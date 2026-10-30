# Spectus

[![Version](https://img.shields.io/github/v/tag/fixrb/spectus?label=Version&logo=github)](https://github.com/fixrb/spectus/tags)
[![Yard documentation](https://img.shields.io/badge/Yard-documentation-blue.svg?logo=github)](https://rubydoc.info/github/fixrb/spectus/main)
[![License](https://img.shields.io/github/license/fixrb/spectus?label=License&logo=github)](https://github.com/fixrb/spectus/raw/main/LICENSE.md)

Spectus expresses expectations with the requirement levels of [RFC 2119](https://www.rfc-editor.org/rfc/rfc2119): what a value MUST do, SHOULD do, or MAY do. An expectation is a level, a negation and a matcher; called with a block, it gives a result that says how it went, and never raises for an expectation that is not met.

## Installation

```ruby
# Gemfile
gem "spectus"
gem "matchi" # the matchers of Fix, or any object with match? and to_s
```

Spectus requires Ruby 3.3 or later, and depends on [Defi](https://github.com/fixrb/defi).

## Usage

```ruby
require "spectus"
require "matchi"

requirement = Spectus.must(Matchi::Eq.new(42))
result = requirement.call { 6 * 7 }
result.passed?  # => true
result.outcome  # => :success
result.to_s     # => "Success: expected 42 to eq 42"

Spectus.must_not(Matchi::Eq.new(42)).call { 42 }.to_s # => "Failure: expected 42 not to eq 42"
Spectus.should(Matchi::Be.new(3)).call { 2 }.to_s # => "Warning: expected 2 to be 3"
Spectus.may(Matchi::Predicate.new(:be_foo)).call { 42 }.outcome # => :info
Spectus.must(Matchi::Eq.new(42)).call { 1 / 0 }.to_s # => "Error: ZeroDivisionError: divided by 0"
```

`Spectus.must`, `must_not`, `should`, `should_not` and `may` build a `Spectus::Requirement`; `may` has no negative form, the RFC having none. A requirement is `Data`: its `level` (`:MUST`, `:SHOULD` or `:MAY`), its `negate` and its `matcher`, which is any object with a `match?` method that takes the block and answers `true` or `false`, and a `to_s` that describes it. The matcher is neither copied nor frozen. The five functions are the normal entry; `Spectus::Requirement.new(level:, negate:, matcher:)` is the general one.

## Outcomes

Two questions tell the levels apart. Does the method exist? MUST and SHOULD require it, MAY does not. Does it do what is specified? MUST and MAY require it, SHOULD recommends it. Hence five outcomes:

| Level  | Match is true | Match is false | Missing method | Other exception |
|--------|---------------|----------------|----------------|-----------------|
| MUST   | success       | failure        | error          | error           |
| SHOULD | success       | warning        | error          | error           |
| MAY    | success       | failure        | info           | error           |

A negation swaps the first two columns. A success, a warning and an info pass (`passed?` is true); a failure and an error do not.

A missing method is a `NoMethodError` raised by `match?` whose receiver is the very value the block returned (the last one, when the matcher calls the block more than once): `Spectus.may(Matchi::Predicate.new(:be_blank)).call { "" }` is an info when `String#blank?` does not exist, a success or a failure when it does. A `NoMethodError` raised by the block itself, or on another object, is an error. Spectus does not know which method the matcher meant to test, so the rule has its limits: a private method counts as missing, as does a method that exists but calls a missing one on `self`, or a missing method the matcher's own code calls on the value.

`match?` must answer `true` or `false`: any other answer is an error, as if `match?` had raised a `TypeError`.

## Results

A `Spectus::Result` is plain data, frozen: symbols, booleans and frozen strings in UTF-8. It can be marshalled, shared between ractors and compared, and nothing in it runs user code again.

| Member          | Content |
|-----------------|---------|
| `level`         | `:MUST`, `:SHOULD` or `:MAY` |
| `negate`        | `true` or `false` |
| `outcome`       | `:success`, `:warning`, `:info`, `:failure` or `:error` |
| `description`   | the matcher, as its `to_s` wrote it: `eq 42` |
| `actual`        | the value the block returned, as its `inspect` wrote it, or the exception it raised, whether the matcher rescued it or not; `nil` when the matcher did not call the block, or when the block raised an exception Defi does not keep and the matcher rescued it |
| `error_class`   | the class of the exception that came out of `match?`, or `TypeError` for an answer that was not `true` or `false`; `nil` otherwise |
| `error_message` | its message |
| `backtrace`     | its backtrace, when it has one, library frames included: a runner filters by path |

`summary` writes `expected ACTUAL to DESCRIPTION`, with `not` for a negation and without the actual value when the block was not called, or `CLASS: MESSAGE` for an exception. `to_s` puts the outcome first: `Success: expected 42 to eq 42`, `Info: NoMethodError: undefined method 'blank?' for an instance of String` (as Ruby 3.4 writes it). No letter, emoji or colour: a runner derives them from `outcome`.

The texts are read defensively: an `inspect` or a `message` that raises or does not answer a `String` gives a fixed text (`an object of Point`, `a message that cannot be read`), a class without a name is `an anonymous exception`, a `backtrace` that raises or is not an `Array` of `String` is `nil`, and bytes that are not valid UTF-8 become U+FFFD. A result carries the level and the negation of its requirement, so that a runner holding results alone can still write the requirement they answer; a runner may also build a `Spectus::Result` of its own for what never reached `call`.

## Exceptions

`call` raises `ArgumentError` without a block and `TypeError` when the `to_s` of the matcher is not a `String`; the matcher is test code, trusted, and what its `to_s` raises goes through. The block and `match?` run under the policy of Defi: the exceptions a method raises on its own, a `StandardError`, a `ScriptError` (such as `NotImplementedError`), a `SystemStackError` or the `SystemExit` of an `exit`, end in the result (as an error, or as an info for a MAY), while an `Interrupt`, a `SignalException`, a `NoMemoryError`, the exception a `Timeout` uses to end its block and any other subclass of `Exception` go through, whether the block or the matcher raised them. Spectus never sees what a matcher rescues itself: `Matchi::RaiseException` rescues a `SystemExit`, so an `exit` inside its block is a failed match, not an error, and `Matchi::RaiseException.new(Interrupt)` rescues an `Interrupt`, a success without an actual value.

The block runs inside `match?`, as many times as the matcher calls it, and without arguments: a lambda that expects some raises `ArgumentError`, which ends in the result. `actual` is the block's last value. The exception it raises is raised again inside the matcher, the same object with its own cause, as Defi does it.

## Changes in 6.0.1

- Documentation: `actual` is also `nil` when the block raised an exception Defi does not keep and the matcher rescued it, as `Matchi::RaiseException.new(Interrupt)` does; what `Matchi::RaiseException` rescues is described as of matchi 6.0.

## Changes in 6.0

Compared with 5.0.2:

- `call` returns a `Spectus::Result` and never raises for a failed expectation, where 5.0.2 returned an `Expresenter::Pass` or raised an `Expresenter::Fail`: read `passed?` or `outcome`. An `expect { requirement.call { … } }.not_to raise_error` written for 5.0.2 passes whatever happens.
- `Spectus::Requirement` is one `Data` class with a `level`, in place of `Requirement::Required`, `Recommended` and `Optional`; `Spectus::Requirement.new(level:, negate:, matcher:)` builds one, with an `ArgumentError` for a MAY that is negated, a level other than the three symbols, a negation that is not `true` or `false`, or a matcher without `match?`. `call` without a block raises `ArgumentError`, where 5.0.2 passed.
- `match?` must answer `true` or `false`: 5.0.2 passed any truthy value and, when negated, `nil`. A missing method is a `NoMethodError` on the value the block returned: 5.0.2 counted every `NoMethodError` as one. A `Timeout` and an `Interrupt` go through, where 5.0.2 swallowed them; a `SystemExit` is an error, as it was.
- The result exposes `description`, `actual`, `error_class`, `error_message` and `backtrace` as strings, `summary` and `to_s` without a trailing period, the outcome as its title; `char`, `emoji`, `colored_char`, `colored_string`, `to_sym`, `success?`, `warning?`, `info?`, `failure?` and `error?` are gone, as are the dependencies on test_tube and expresenter.
- Ruby 3.3 or later; tested on 3.3, 3.4, 4.0 and head.

## Versioning

Spectus follows [Semantic Versioning 2.0](https://semver.org/).

## License

The [gem](https://rubygems.org/gems/spectus) is available as open source under the terms of the [MIT License](https://github.com/fixrb/spectus/raw/main/LICENSE.md).

## Sponsors

This project is sponsored by [Sashité](https://sashite.com/)
