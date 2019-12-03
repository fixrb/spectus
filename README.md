# Spectus

[![Build Status](https://api.travis-ci.org/fixrb/spectus.svg?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/fixrb/spectus/badges/gpa.svg)][codeclimate]
[![Gem Version](https://badge.fury.io/rb/spectus.svg)][gem]
[![Inline docs](https://inch-ci.org/github/fixrb/spectus.svg?branch=master)][inchpages]
[![Documentation](https://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> Expectation library with [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt)'s requirement levels, and some matchers for Ruby.

## Contact

* Home page: https://github.com/fixrb/spectus
* Bugs/issues: https://github.com/fixrb/spectus/issues

## Rubies

* [MRI](https://www.ruby-lang.org/)
* [Rubinius](https://rubinius.com/)
* [JRuby](https://www.jruby.org/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spectus'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spectus

## Expectation

An expectation is an assertion that is either `true` or `false`.

| Requirement levels        | **MUST** | **SHOULD** | **MAY** |
| ------------------------- | -------- | ---------- | ------- |
| Implemented & Matched     | `true`   | `true`     | `true`  |
| Implemented & Not matched | `false`  | `true`     | `false` |
| Implemented & Exception   | `false`  | `false`    | `false` |
| Not implemented           | `false`  | `false`    | `true`  |

## Isolation

There are two cases:

* when the requirement level of an expectation ends with `!`, the test is performed in isolation;
* when the requirement level of an expectation does not end with `!`, the test is performed without isolation.

Example of test in isolation:

```ruby
include Spectus

greeting = 'Hello, world!'
it { greeting.gsub!('world', 'Alice') }.MUST! eql 'Hello, Alice!'
# => Spectus::Result::Pass(actual: "Hello, Alice!", error: nil, expected: "Hello, Alice!", got: true, matcher: :eql, negate: false, level: :MUST, valid: true)
greeting # => "Hello, world!"
```

Example of test without isolation:

```ruby
include Spectus

greeting = 'Hello, world!'
it { greeting.gsub!('world', 'Alice') }.MUST eql 'Hello, Alice!'
# => Spectus::Result::Pass(actual: "Hello, Alice!", error: nil, expected: "Hello, Alice!", got: true, matcher: :eql, negate: false, level: :MUST, valid: true)
greeting # => "Hello, Alice!"
```

## Results

There are two possibilities:

* when an expectation is `true`, a `Spectus::Result::Pass` object is returned;
* when an expectation is `false`, a `Spectus::Result::Fail` error is raised.

Both instances share the same interface.

## Usage

To begin with, let's include __Spectus__:

```ruby
include Spectus
```

### Absolute requirement

Given the "`ルビー`" object, when it receives `valid_encoding?` method, then it **MUST** be `true`:

```ruby
it { 'ルビー'.valid_encoding? }.MUST be_true
# => Spectus::Result::Pass(actual: true, error: nil, expected: nil, got: true, matcher: :be_true, negate: false, level: :MUST, valid: true)
```

The result of the test shows that the spec passed.

### Absolute prohibition

Given the "`foo`" object, when it receives `length` method, then it **MUST NOT** raise the `NoMethodError` exception:

```ruby
it { 'foo'.length }.MUST_NOT raise_exception NoMethodError
# => Spectus::Result::Pass(actual: 3, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)
```

The result of the test shows that the spec passed.

### Recommended

Given the `BasicObject` object, when it receives `superclass` method, then it **SHOULD** return the explicit blank class `NilClass`:

```ruby
it { BasicObject.superclass }.SHOULD equal NilClass
# => Spectus::Result::Pass(actual: nil, error: nil, expected: NilClass, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)
```

Instead of the expected `NilClass` class, its sole instance (which is `nil`) was returned.
However, because there isn't any exception, the result of the test shows that the spec passed.

### Not recommended

Given the "`1`" object, when it receives `+(1)` method, then it **SHOULD NOT** return the "`11`" value:

```ruby
it { '1' + 1 }.SHOULD_NOT eql '11'
# Traceback (most recent call last):
#         2: from ./bin/console:8:in `<main>'
#         1: from (irb):5
# Spectus::Result::Fail (Error: no implicit conversion of Integer into String (TypeError).)
```

There was a `TypeError` exception, the result of the test shows that the spec failed.

### Optional

Given the "`foo`" object, when it receives `blank?` method, then it **MAY** be `false`:

```ruby
it { 'foo'.blank? }.MAY be_false
# => Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `blank?' for "foo":String>, expected: nil, got: nil, matcher: :be_false, negate: false, level: :MAY, valid: false)
```

The optional `blank?` method is not implemented (unlike in [Ruby on Rails](https://api.rubyonrails.org/classes/Object.html#method-i-blank-3F), for instance), so the result of the test shows that the spec passed.

## Security

As a basic form of security __Spectus__ provides a set of SHA512 checksums for
every Gem release.  These checksums can be found in the `checksum/` directory.
Although these checksums do not prevent malicious users from tampering with a
built Gem they can be used for basic integrity verification purposes.

The checksum of a file can be checked using the `sha512sum` command.  For
example:

    $ sha512sum pkg/spectus-2.3.0.gem
    e9e35e1953104e2d428b0f217e418db3c1baecd9e011b2545f9fcba4ff7e3bba674c6b928b3d8db842a139cd7cc9806d77ebdc7f710ece4f2aecb343703e2451  pkg/spectus-2.3.0.gem

## Versioning

__Spectus__ follows [Semantic Versioning 2.0](https://semver.org/).

## Contributing

1. [Fork it](https://github.com/fixrb/spectus/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

See `LICENSE.md` file.

[gem]: https://rubygems.org/gems/spectus
[travis]: https://travis-ci.org/fixrb/spectus
[codeclimate]: https://codeclimate.com/github/fixrb/spectus
[inchpages]: https://inch-ci.org/github/fixrb/spectus
[rubydoc]: https://rubydoc.info/gems/spectus/frames

***

This project is sponsored by:

[![Sashite](https://pbs.twimg.com/profile_images/618485028322975744/PZ9qPuI__400x400.png)](https://sashite.com/)
