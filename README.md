# Spectus

[![Build Status](https://api.travis-ci.org/fixrb/spectus.svg?branch=main)](https://travis-ci.org/fixrb/spectus)
[![Gem Version](https://badge.fury.io/rb/spectus.svg)](https://rubygems.org/gems/spectus)
[![Documentation](https://img.shields.io/:yard-docs-38c800.svg)](https://rubydoc.info/gems/spectus/frames)

> Expectation library with [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt) requirement levels 🚥

## Installation

Add this line to your application's Gemfile:

```ruby
gem "spectus"
```

And then execute:

```sh
bundle
```

Or install it yourself as:

```sh
gem install spectus
```

## Overview

Assuming that an expectation is an assertion that is either `true` or `false`,
qualifying it with `MUST`, `SHOULD` and `MAY`, we can draw up several scenarios:

| Requirement levels        | **MUST** | **SHOULD** | **MAY** |
| ------------------------- | -------- | ---------- | ------- |
| Implemented & Matched     | `true`   | `true`     | `true`  |
| Implemented & Not matched | `false`  | `true`     | `false` |
| Implemented & Exception   | `false`  | `false`    | `false` |
| Not implemented           | `false`  | `false`    | `true`  |

When an expectation is evaluated by __Spectus__,

* in case of a _passed_ expectation, a `Spectus::Result::Pass` instance is _returned_;
* in case of a _failed_ expectation, a `Spectus::Result::Fail` exception is _raised_.

## Usage

The __Spectus__ library is basically a module containing an `it` instance method that accept a block representing the actual value to be evaluated through an expectation.

The `Spectus` module can be included inside a class and used as follows:

```ruby
require "spectus"

class Spec
  include ::Spectus

  attr_reader :subject

  def initialize(subject)
    @subject = subject
  end

  def test_a
    it { subject.upcase }.MUST eql "FOO"
  end

  def test_b
    it { subject.blank? }.MAY be_true
  end

  def test_c
    it { subject.length }.SHOULD equal 42
  end
end
```

```ruby
t = Spec.new("foo")

t.test_a # => Spectus::Result::Pass(actual: "FOO", error: nil, expected: "FOO", got: true, matcher: :eql, negate: false, level: :MUST, valid: true)

t.test_b # => Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `blank?' for "foo":String>, expected: nil, got: nil, matcher: :be_true, negate: false, level: :MAY, valid: false)

t.test_c # => Spectus::Result::Pass(actual: 3, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)
```

```ruby
t = Spec.new(4)

t.test_a # => raises an exception:
# Traceback (most recent call last):
#         3: from ./bin/console:8:in `<main>'
#         2: from (irb):23
#         1: from (irb):11:in `test_a'
# Spectus::Result::Fail (NoMethodError: undefined method `upcase' for 4:Integer)

t.test_b # => Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `blank?' for 4:Integer>, expected: nil, got: nil, matcher: :be_true, negate: false, level: :MAY, valid: false)

t.test_c # => raises an exception:
# Traceback (most recent call last):
#         3: from ./bin/console:8:in `<main>'
#         2: from (irb):25
#         1: from (irb):19:in `test_c'
# Spectus::Result::Fail (NoMethodError: undefined method `length' for 4:Integer.)
```

## More examples

To make __Spectus__ available:

```ruby
require "spectus"

include Spectus
```

All examples here assume that this has been done.

### Absolute Requirement

There's only one bat:

```ruby
it { "🦇".size }.MUST equal 1
# => Spectus::Result::Pass(actual: 1, error: nil, expected: 1, got: true, matcher: :equal, negate: false, level: :MUST, valid: true)
```

### Absolute Prohibition

The true from the false:

```ruby
it { false }.MUST_NOT be_true
# => Spectus::Result::Pass(actual: false, error: nil, expected: nil, got: true, matcher: :be_true, negate: true, level: :MUST, valid: true)
```

### Recommended

A well-known joke. An addition of `0.1` and `0.2` is deadly precise:

```ruby
it { 0.1 + 0.2 }.SHOULD equal 0.3
# => Spectus::Result::Pass(actual: 0.30000000000000004, error: nil, expected: 0.3, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)
```

### Not Recommended

The situation should still be under control:

```ruby
it { BOOM }.SHOULD_NOT raise_exception SystemExit
```

```txt
Traceback (most recent call last):
        2: from ./bin/console:8:in `<main>'
        1: from (irb):8
Spectus::Result::Fail (NameError: uninitialized constant BOOM.)
```

### Optional

An empty array is blank, right?

```ruby
it { [].blank? }.MAY be_true
# => Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `blank?' for []:Array>, expected: nil, got: nil, matcher: :be_true, negate: false, level: :MAY, valid: false)
```

Damn, I forgot to load activesupport. 🤦‍♂️

That said, the test is passing due to the _not-implemented-like_ raised exception: `NoMethodError`.

## Code Isolation

When executing expectations, side-effects may occur.
Because they may or may not be desired, each requirement level has 2 versions:

* if it does not end with `!`, its test is performed without isolation;
* if it ends with `!`, its test is performed in isolation.

Example of test without isolation:

```ruby
greeting = "Hello, world!"

it { greeting.gsub!("world", "Alice") }.MUST eql "Hello, Alice!"
# => Spectus::Result::Pass(actual: "Hello, Alice!", error: nil, expected: "Hello, Alice!", got: true, matcher: :eql, negate: false, level: :MUST, valid: true)

greeting # => "Hello, Alice!"
```

Example of test in isolation:

```ruby
greeting = "Hello, world!"

it { greeting.gsub!("world", "Alice") }.MUST! eql "Hello, Alice!"
# => Spectus::Result::Pass(actual: "Hello, Alice!", error: nil, expected: "Hello, Alice!", got: true, matcher: :eql, negate: false, level: :MUST, valid: true)

greeting # => "Hello, world!"
```

## Contact

* Home page: https://github.com/fixrb/spectus
* Bugs/issues: https://github.com/fixrb/spectus/issues

## Versioning

__Spectus__ follows [Semantic Versioning 2.0](https://semver.org/).

## License

The [gem](https://rubygems.org/gems/spectus) is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

***

<p>
  This project is sponsored by:<br />
  <a href="https://sashite.com/"><img
    src="https://github.com/fixrb/spectus/raw/main/img/sashite.png"
    alt="Sashite" /></a>
</p>
