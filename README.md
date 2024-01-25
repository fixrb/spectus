# Spectus

[![Version](https://img.shields.io/github/v/tag/fixrb/spectus?label=Version&logo=github)](https://github.com/fixrb/spectus/tags)
[![Yard documentation](https://img.shields.io/badge/Yard-documentation-blue.svg?logo=github)](https://rubydoc.info/github/fixrb/spectus/main)
[![Ruby](https://github.com/fixrb/spectus/workflows/Ruby/badge.svg?branch=main)](https://github.com/fixrb/spectus/actions?query=workflow%3Aruby+branch%3Amain)
[![RuboCop](https://github.com/fixrb/spectus/workflows/RuboCop/badge.svg?branch=main)](https://github.com/fixrb/spectus/actions?query=workflow%3Arubocop+branch%3Amain)
[![License](https://img.shields.io/github/license/fixrb/spectus?label=License&logo=github)](https://github.com/fixrb/spectus/raw/main/LICENSE.md)

> A Ruby library for defining expectations with precision, using [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt) compliance levels. 🚥

![A traffic light with three distinct sections](https://github.com/fixrb/spectus/raw/main/img/spectus.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "spectus"
```

And then execute:

```sh
bundle install
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
require "matchi"
```

All examples here assume that this has been done.

### Absolute Requirement

There is exactly one bat:

```ruby
definition = Spectus.must Matchi::Be.new(1)
definition.call { "🦇".size }
# => Expresenter::Pass(actual: 1, definition: "be 1", error: nil, expected: 1, got: true, negate: false, level: :MUST)
```

The test is passed.

### Absolute Prohibition

Truth and lies:

```ruby
definition = Spectus.must_not Matchi::Be.new(true)
definition.call { false }
# => Expresenter::Pass(actual: false, definition: "be true", error: nil, expected: true, got: true, negate: true, level: :MUST)
```

### Recommended

A well-known joke. The addition of `0.1` and `0.2` is deadly precise:

```ruby
definition = Spectus.should Matchi::Be.new(0.3)
definition.call { 0.1 + 0.2 }
# => Expresenter::Pass(actual: 0.30000000000000004, definition: "be 0.3", error: nil, expected: 0.3, got: false, negate: false, level: :SHOULD)
```

### Not Recommended

This should not be wrong:

```ruby
definition = Spectus.should_not Matchi::Match.new("123456")

definition.call do
  require "securerandom"

  SecureRandom.hex(3)
end
# => Expresenter::Pass(actual: "bb5716", definition: "match \"123456\"", error: nil, expected: "123456", got: true, negate: true, level: :SHOULD)
```

In any case, as long as there are no exceptions, the test passes.

### Optional

An empty array is blank, right?

```ruby
definition = Spectus.may Matchi::Be.new(true)
definition.call { [].blank? }
# => Expresenter::Pass(actual: nil, definition: "be true", error: #<NoMethodError: undefined method `blank?' for []:Array>, expected: true, got: nil, negate: false, level: :MAY)
```

My bad! ActiveSupport was not imported. 🤦‍♂️

Anyways, the test passes because the exception produced is `NoMethodError`, meaning that the functionality is not implemented.

## Contact

* Home page: https://github.com/fixrb/spectus
* Bugs/issues: https://github.com/fixrb/spectus/issues
* Blog post: https://cyrilllllll.medium.com/a-spectus-tutorial-expectations-with-rfc-2119-compliance-1fc769861c1

## Versioning

__Spectus__ follows [Semantic Versioning 2.0](https://semver.org/).

## License

The [gem](https://rubygems.org/gems/spectus) is available as open source under the terms of the [MIT License](https://github.com/fixrb/spectus/raw/main/LICENSE.md).

---

<p>
  This project is sponsored by:<br />
  <a href="https://sashite.com/"><img
    src="https://github.com/fixrb/spectus/raw/main/img/sashite.png"
    alt="Sashité" /></a>
</p>
