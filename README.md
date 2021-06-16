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

When an expectation is evaluated by Spectus,

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
#         6: from ./bin/console:8:in `<main>'
#         5: from (irb):23
#         4: from (irb):11:in `test_a'
#         3: from /Users/cyril/github/fixrb/spectus/lib/spectus/expectation_target.rb:34:in `MUST'
#         2: from /Users/cyril/github/fixrb/spectus/lib/spectus/requirement_level/base.rb:38:in `call'
#         1: from /Users/cyril/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/expresenter-1.2.1/lib/expresenter/fail.rb:19:in `with'
# Spectus::Result::Fail (NoMethodError: undefined method `upcase' for 4:Integer)

t.test_b # => Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `blank?' for 4:Integer>, expected: nil, got: nil, matcher: :be_true, negate: false, level: :MAY, valid: false)

t.test_c # => raises an exception:
# Traceback (most recent call last):
#         6: from ./bin/console:8:in `<main>'
#         5: from (irb):25
#         4: from (irb):19:in `test_c'
#         3: from /Users/cyril/github/fixrb/spectus/lib/spectus/expectation_target.rb:100:in `SHOULD'
#         2: from /Users/cyril/github/fixrb/spectus/lib/spectus/requirement_level/base.rb:38:in `call'
#         1: from /Users/cyril/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/expresenter-1.2.1/lib/expresenter/fail.rb:19:in `with'
# Spectus::Result::Fail (NoMethodError: undefined method `length' for 4:Integer.)
```

## More examples

### Absolute Requirement

Given the "`ルビー`" object, when it receives `valid_encoding?` method, then it **MUST** be `true`:

```ruby
require "spectus"

include Spectus

it { "ルビー".valid_encoding? }.MUST be_true
# => Spectus::Result::Pass(actual: true, error: nil, expected: nil, got: true, matcher: :be_true, negate: false, level: :MUST, valid: true)
```

The result of the test shows that the spec passed.

### Absolute Prohibition

Given the "`foo`" object, when it receives `length` method, then it **MUST NOT** raise the `NoMethodError` exception:

```ruby
require "spectus"

include Spectus

it { "foo".length }.MUST_NOT raise_exception NoMethodError
# => Spectus::Result::Pass(actual: 3, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)
```

The result of the test shows that the spec passed.

### Recommended

Given the `BasicObject` object, when it receives `superclass` method, then it **SHOULD** return the explicit blank class `NilClass`:

```ruby
require "spectus"

include Spectus

it { BasicObject.superclass }.SHOULD equal NilClass
# => Spectus::Result::Pass(actual: nil, error: nil, expected: NilClass, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)
```

Instead of the expected `NilClass` class, its sole instance (which is `nil`) was returned.
However, because there isn't any exception, the result of the test shows that the spec passed.

### Not Recommended

Given the "`1`" object, when it receives `+(1)` method, then it **SHOULD NOT** return the "`11`" value:

```ruby
require "spectus"

include Spectus

it { "1" + 1 }.SHOULD_NOT eql "11"
# raise Spectus::Result::Fail(actual: nil, error: #<TypeError: no implicit conversion of Integer into String>, expected: "11", got: nil, matcher: :eql, negate: true, level: :SHOULD, valid: false)
```

There was a `TypeError` exception, the result of the test shows that the spec failed.

### Optional

Given the "`foo`" object, when it receives `blank?` method, then it **MAY** be `false`:

```ruby
require "spectus"

include Spectus

it { "foo".blank? }.MAY be_false
# => Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `blank?' for "foo":String>, expected: nil, got: nil, matcher: :be_false, negate: false, level: :MAY, valid: false)
```

The optional `blank?` method is not implemented (unlike in [Ruby on Rails](https://api.rubyonrails.org/classes/Object.html#method-i-blank-3F), for instance), so the result of the test shows that the spec passed.

## Code Isolation

When executing expectations, side-effects may occur.
Because they may or may not be desired, each requirement level has 2 versions:

* if it does not end with `!`, its test is performed without isolation;
* if it ends with `!`, its test is performed in isolation.

Example of test without isolation:

```ruby
require "spectus"

include Spectus

greeting = "Hello, world!"
it { greeting.gsub!("world", "Alice") }.MUST eql "Hello, Alice!"
# => Spectus::Result::Pass(actual: "Hello, Alice!", error: nil, expected: "Hello, Alice!", got: true, matcher: :eql, negate: false, level: :MUST, valid: true)
greeting # => "Hello, Alice!"
```

Example of test in isolation:

```ruby
require "spectus"

include Spectus

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
