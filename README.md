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

There's only one bat:

```ruby
definition = Spectus.must equal 1
definition.call { "🦇".size }
# => Expresenter::Pass(actual: 1, error: nil, expected: 1, got: true, matcher: :equal, negate: false, level: :MUST
```

### Absolute Prohibition

The true from the false:

```ruby
definition = Spectus.must_not be_true
definition.call { false }
# => Expresenter::Pass(actual: false, error: nil, expected: nil, got: true, matcher: :be_true, negate: true, level: :MUST
```

### Recommended

A well-known joke. An addition of `0.1` and `0.2` is deadly precise:

```ruby
definition = Spectus.should equal 0.3
definition.call { 0.1 + 0.2 }
# => Expresenter::Pass(actual: 0.30000000000000004, error: nil, expected: 0.3, got: false, matcher: :equal, negate: false, level: :SHOULD
```

### Not Recommended

The situation should still be under control:

```ruby
definition = Spectus.should_not raise_exception SystemExit
definition.call { BOOM }
```

```txt
Traceback (most recent call last):
        6: from /Users/cyril/.rbenv/versions/2.7.3/bin/irb:23:in `<main>'
        5: from /Users/cyril/.rbenv/versions/2.7.3/bin/irb:23:in `load'
        4: from /Users/cyril/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/irb-1.2.6/exe/irb:11:in `<top (required)>'
        3: from (irb):11
        2: from /Users/cyril/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/spectus-4.0.0/lib/spectus/requirement/base.rb:32:in `call'
        1: from /Users/cyril/.rbenv/versions/2.7.3/lib/ruby/gems/2.7.0/gems/expresenter-1.3.0/lib/expresenter/fail.rb:25:in `with'
Expresenter::Fail (NameError: uninitialized constant BOOM.)
```

### Optional

An empty array is blank, right?

```ruby
definition = Spectus.may be_true
definition.call { [].blank? }
# => Expresenter::Pass(actual: nil, error: #<NoMethodError: undefined method `blank?' for []:Array>, expected: nil, got: nil, matcher: :be_true, negate: false, level: :MAY
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
