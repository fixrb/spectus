# Spectus

[![Version](https://img.shields.io/github/v/tag/fixrb/spectus?label=Version&logo=github)](https://github.com/fixrb/spectus/releases)
[![Yard documentation](https://img.shields.io/badge/Yard-documentation-blue.svg?logo=github)](https://rubydoc.info/github/fixrb/spectus/main)
[![CI](https://github.com/fixrb/spectus/workflows/CI/badge.svg?branch=main)](https://github.com/fixrb/spectus/actions?query=workflow%3Aci+branch%3Amain)
[![RuboCop](https://github.com/fixrb/spectus/workflows/RuboCop/badge.svg?branch=main)](https://github.com/fixrb/spectus/actions?query=workflow%3Arubocop+branch%3Amain)
[![License](https://img.shields.io/github/license/fixrb/spectus?label=License&logo=github)](https://github.com/fixrb/spectus/raw/main/LICENSE.md)

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

## Usage

The __Spectus__ library is basically a module defining methods that can be used to qualify expectations in specifications.

To make __Spectus__ available:

```ruby
require "spectus"
```

For convenience, we will also instantiate some matchers from the [Matchi library](https://github.com/fixrb/matchi):

```sh
gem install matchi
```

```ruby
require "matchi/helper"

include Matchi::Helper
```

All examples here assume that this has been done.

### Absolute Requirement

There is exactly one bat:

```ruby
definition = Spectus.must equal 1
definition.call { "🦇".size }
# => Expresenter::Pass(actual: 1, error: nil, expected: 1, got: true, matcher: :equal, negate: false, level: :MUST
```

The test is passed.

### Absolute Prohibition

Truth and lies:

```ruby
definition = Spectus.must_not be_true
definition.call { false }
# => Expresenter::Pass(actual: false, error: nil, expected: nil, got: true, matcher: :be_true, negate: true, level: :MUST
```

### Recommended

A well-known joke. The addition of `0.1` and `0.2` is deadly precise:

```ruby
definition = Spectus.should equal 0.3
definition.call { 0.1 + 0.2 }
# => Expresenter::Pass(actual: 0.30000000000000004, error: nil, expected: 0.3, got: false, matcher: :equal, negate: false, level: :SHOULD
```

### Not Recommended

This should not be wrong:

```ruby
definition = Spectus.should_not match "123456"

definition.call do
  require "securerandom"

  SecureRandom.hex(3)
end
# => Expresenter::Pass(actual: "ce22e3", error: nil, expected: "123456", got: true, matcher: :match, negate: true, level: :SHOULD
```

In any case, as long as there are no exceptions, the test passes.

### Optional

An empty array is blank, right?

```ruby
definition = Spectus.may be_true
definition.call { [].blank? }
# => Expresenter::Pass(actual: nil, error: #<NoMethodError: undefined method `blank?' for []:Array>, expected: nil, got: nil, matcher: :be_true, negate: false, level: :MAY
```

My bad! ActiveSupport was not imported. 🤦‍♂️

Anyways, the test passes because the exception produced is `NoMethodError`, meaning that the functionality is not implemented.

## Code Isolation

When executing expectations, side-effects may occur.
Because they may or may not be desired, each requirement level has 2 versions:

* if it does not end with `!`, its test is performed without isolation;
* if it ends with `!`, its test is performed in isolation.

Example of test without isolation:

```ruby
greeting = "Hello, world!"

definition = Spectus.must eql "Hello, Alice!"
definition.call { greeting.gsub!("world", "Alice") }
# => Expresenter::Pass(actual: "Hello, Alice!", error: nil, expected: "Hello, Alice!", got: true, matcher: :eql, negate: false, level: :MUST

greeting # => "Hello, Alice!"
```

Example of test in isolation:

```ruby
greeting = "Hello, world!"

definition = Spectus.must! eql "Hello, Alice!"
definition.call { greeting.gsub!("world", "Alice") }
# => Expresenter::Pass(actual: "Hello, Alice!", error: nil, expected: "Hello, Alice!", got: true, matcher: :eql, negate: false, level: :MUST

greeting # => "Hello, world!"
```

## Contact

* Home page: https://github.com/fixrb/spectus
* Bugs/issues: https://github.com/fixrb/spectus/issues
* Blog post: https://batman.buzz/a-spectus-tutorial-expectations-with-rfc-2119-compliance-1fc769861c1

## Versioning

__Spectus__ follows [Semantic Versioning 2.0](https://semver.org/).

## License

The [gem](https://rubygems.org/gems/spectus) is available as open source under the terms of the [MIT License](https://github.com/fixrb/spectus/raw/main/LICENSE.md).

***

<p>
  This project is sponsored by:<br />
  <a href="https://sashite.com/"><img
    src="https://github.com/fixrb/spectus/raw/main/img/sashite.png"
    alt="Sashite" /></a>
</p>
