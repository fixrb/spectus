# Spectus

[![Build Status](https://api.travis-ci.org/fixrb/spectus.svg?branch=main)][travis]
[![Code Climate](https://codeclimate.com/github/fixrb/spectus/badges/gpa.svg)][codeclimate]
[![Gem Version](https://badge.fury.io/rb/spectus.svg)][gem]
[![Inline docs](https://inch-ci.org/github/fixrb/spectus.svg?branch=main)][inchpages]
[![Documentation](https://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> Expectation library with [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt)'s requirement levels 🚥

## Installation

Add this line to your application's Gemfile:

```ruby
gem "spectus"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spectus

## Usage

To begin with, let's include __Spectus__:

```ruby
include Spectus
```

### Absolute Requirement

Given the "`ルビー`" object, when it receives `valid_encoding?` method, then it **MUST** be `true`:

```ruby
it { "ルビー".valid_encoding? }.MUST be_true
# => Expresenter::Pass(actual: true, error: nil, expected: nil, got: true, matcher: :be_true, negate: false, level: :MUST, valid: true)
```

The result of the test shows that the spec passed.

### Absolute Prohibition

Given the "`foo`" object, when it receives `length` method, then it **MUST NOT** raise the `NoMethodError` exception:

```ruby
it { "foo".length }.MUST_NOT raise_exception NoMethodError
# => Expresenter::Pass(actual: 3, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)
```

The result of the test shows that the spec passed.

### Recommended

Given the `BasicObject` object, when it receives `superclass` method, then it **SHOULD** return the explicit blank class `NilClass`:

```ruby
it { BasicObject.superclass }.SHOULD equal NilClass
# => Expresenter::Pass(actual: nil, error: nil, expected: NilClass, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)
```

Instead of the expected `NilClass` class, its sole instance (which is `nil`) was returned.
However, because there isn't any exception, the result of the test shows that the spec passed.

### Not Recommended

Given the "`1`" object, when it receives `+(1)` method, then it **SHOULD NOT** return the "`11`" value:

```ruby
it { "1" + 1 }.SHOULD_NOT eql "11"
# raise Expresenter::Fail(actual: nil, error: #<TypeError: no implicit conversion of Integer into String>, expected: "11", got: nil, matcher: :eql, negate: true, level: :SHOULD, valid: false)
```

There was a `TypeError` exception, the result of the test shows that the spec failed.

### Optional

Given the "`foo`" object, when it receives `blank?` method, then it **MAY** be `false`:

```ruby
it { "foo".blank? }.MAY be_false
# => Expresenter::Pass(actual: nil, error: #<NoMethodError: undefined method `blank?' for "foo":String>, expected: nil, got: nil, matcher: :be_false, negate: false, level: :MAY, valid: false)
```

The optional `blank?` method is not implemented (unlike in [Ruby on Rails](https://api.rubyonrails.org/classes/Object.html#method-i-blank-3F), for instance), so the result of the test shows that the spec passed.

### More Examples

A full list of unit tests can be viewed (and executed) here:
[./test.rb](https://github.com/fixrb/spectus/blob/main/test.rb)

## Code Isolation

When executing expectations, side-effects may occur.
Because they may or may not be desired, each requirement level has 2 versions:

* if it does not end with `!`, its test is performed without isolation;
* if it ends with `!`, its test is performed in isolation.

Example of test without isolation:

```ruby
include Spectus
greeting = "Hello, world!"
it { greeting.gsub!("world", "Alice") }.MUST eql "Hello, Alice!"
# => Expresenter::Pass(actual: "Hello, Alice!", error: nil, expected: "Hello, Alice!", got: true, matcher: :eql, negate: false, level: :MUST, valid: true)
greeting # => "Hello, Alice!"
```

Example of test in isolation:

```ruby
include Spectus
greeting = "Hello, world!"
it { greeting.gsub!("world", "Alice") }.MUST! eql "Hello, Alice!"
# => Expresenter::Pass(actual: "Hello, Alice!", error: nil, expected: "Hello, Alice!", got: true, matcher: :eql, negate: false, level: :MUST, valid: true)
greeting # => "Hello, world!"
```

## Contact

* Home page: https://github.com/fixrb/spectus
* Bugs/issues: https://github.com/fixrb/spectus/issues

## Versioning

__Spectus__ follows [Semantic Versioning 2.0](https://semver.org/).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

***

<p>
  This project is sponsored by:<br />
  <a href="https://sashite.com/"><img
    src="https://github.com/fixrb/spectus/raw/main/img/sashite.png"
    alt="Sashite" /></a>
</p>

[gem]: https://rubygems.org/gems/spectus
[travis]: https://travis-ci.org/fixrb/spectus
[codeclimate]: https://codeclimate.com/github/fixrb/spectus
[inchpages]: https://inch-ci.org/github/fixrb/spectus
[rubydoc]: https://rubydoc.info/gems/spectus/frames
