# Spectus

[![Build Status](https://travis-ci.org/cyril/spectus.rb.svg?branch=master)](https://travis-ci.org/cyril/spectus.rb)
[![Coverage Status](http://img.shields.io/coveralls/cyril/spectus.rb.svg?branch=master)](https://coveralls.io/r/cyril/spectus.rb)
[![Dependency Status](https://gemnasium.com/cyril/spectus.rb.svg)](https://gemnasium.com/cyril/spectus.rb)
[![Gem Version](http://img.shields.io/gem/v/spectus.svg)](https://rubygems.org/gems/spectus)
[![Inline docs](http://inch-ci.org/github/cyril/spectus.rb.svg)](http://inch-ci.org/github/cyril/spectus.rb)
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)](http://rubydoc.info/gems/spectus/frames)
[![License](http://img.shields.io/:license-MIT-38c800.svg)](http://cyril.mit-license.org/)

> An expectation library with some built-in matchers for Ruby.

## Contact

* Home page: https://github.com/cyril/spectus.rb
* Bugs/issues: https://github.com/cyril/spectus.rb/issues
* Support: https://stackoverflow.com/questions/tagged/spectus-ruby

## Rubies

__Spectus__ is supported by Ruby (MRI) 2+.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spectus'
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install spectus
```

## Why would I want this library?

* It's ~200 lines of fast and KISS code.
* Atomic state transitions, immutable objects, thread-safe.
* A generic, consistent DSL for assertions.

## Usage

```ruby
class Duck
  def walks
    "Klop klop!"
  end

  def swims
    "Swoosh..."
  end

  def quacks
    puts "Quaaaaaack!"
  end
end

@bird = Duck.new
```

> When I see a `#<Duck:0x007f96b285d6d0>` that ...

```ruby
require 'spectus'
extend Spectus::DSL

expectation_1 = expect { @bird.walks  }.to eql: "Klop klop!"
expectation_2 = expect { @bird.swims  }.to eql: "Swoosh..."
expectation_3 = expect { @bird.quacks }.to capture_stdout: "Quaaaaaack!\n"
expectation_4 = expect { @bird.speaks }.to raise_exception: NoMethodError

case (expectation_1.pass? &&
      expectation_2.pass? &&
      expectation_3.pass? &&
      expectation_4.pass?)
  when true then puts "I call that #{@bird} a duck."
  else warn 'WAT?'
end
```

> I call that `#<Duck:0x007f96b285d6d0>` a duck.

## Built-in matchers

### Standard error

```ruby
expect { warn 'foo' }.to capture_stderr: "foo\n"
```

### Standard output

```ruby
expect { puts 'foo' }.to capture_stdout: "foo\n"
```

### Equivalence

```ruby
expect { 'foo' }.to eql: 'foo'
```

### Identity

```ruby
expect { :foo }.to equal: :foo
```

### Regular expressions

```ruby
expect { 'foo' }.to({match: /^foo$/})
```

### Expecting errors

```ruby
expect { Foo }.to raise_exception: NameError
```

## Custom matchers

Custom matchers can also be defined for expressing expectations.

### Be prime

The following expression...

```ruby
require 'prime'
expect { Prime.prime? 42 }.to equal: false
```

...could be refactored into:

```ruby
expect { 42 }.not_to :be_prime
```

It can be done with this custom matcher:

```ruby
require 'prime'

module Spectus
  module Matcher
    class BePrime
      def matches?
        Prime.prime? yield
      end
    end
  end
end
```

### Be the answer

The following expression...

```ruby
expect { 42 }.to equal: 42
```

...could be refactored into:

```ruby
expect { 42 }.to :be_the_answer
```

It can be done with this custom matcher:

```ruby
module Spectus
  module Matcher
    class BeTheAnswer
      def matches?
        42.equal? yield
      end
    end
  end
end
```

### Start with

The following expression...

```ruby
expect { 'foobar' }.to match: /^foo/
```

...could be refactored into:

```ruby
expect { 'foobar' }.to start_with: 'foo'
```

It can be done with this custom matcher:

```ruby
module Spectus
  module Matcher
    class StartWith
      def initialize expected
        @expected = expected
      end

      def matches?
        !Regexp.new("^#{@expected}").match(yield).nil?
      end
    end
  end
end
```

## Contributing

1. [Fork it](https://github.com/cyril/spectus.rb/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Versioning

__Spectus__ follows [Semantic Versioning 2.0](http://semver.org/)

## Copyright

&copy; [Cyril Wack](https://plus.google.com/+CyrilWack?rel=author)
