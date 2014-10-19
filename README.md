# Spectus

[![Build Status](https://travis-ci.org/fixrb/spectus.svg?branch=master)](https://travis-ci.org/fixrb/spectus)
[![Coverage Status](http://img.shields.io/coveralls/fixrb/spectus.svg?branch=master)](https://coveralls.io/r/fixrb/spectus)
[![Dependency Status](https://gemnasium.com/fixrb/spectus.svg)](https://gemnasium.com/fixrb/spectus)
[![Gem Version](http://img.shields.io/gem/v/spectus.svg)](https://rubygems.org/gems/spectus)
[![Inline docs](http://inch-ci.org/github/fixrb/spectus.svg?branch=master)](http://inch-ci.org/github/fixrb/spectus)
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)](http://rubydoc.info/gems/spectus/frames)

> Expectation library with some built-in matchers for Ruby.

## Contact

* Home page: https://github.com/fixrb/spectus
* Bugs/issues: https://github.com/fixrb/spectus/issues
* Support: https://stackoverflow.com/questions/tagged/spectus

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

* It's 143 lines of fast and KISS code.
* Atomic state transitions, unmutated objects, thread-safe.
* Provides a generic and consistent DSL for assertions.

## API

The [Spectus DSL](lib/spectus/dsl.rb) provides the `expect` method.
It takes a block parameter and responds to:

* `to(definition)`
* `not_to(definition)`

Then, it returns `true` or `false`; or it raises an exception.

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

# Let's define the custom matcher `capture_stdout`.
require 'stringio'
module Spectus
  module Matcher
    class CaptureStdout
      def initialize expected
        @expected = expected
      end

      def matches?
        begin
          orig_std  = $stdout
          $stdout   = StringIO.new
          yield
          $stdout.string.eql? @expected
        ensure
          $stdout   = orig_std
        end
      end
    end
  end
end

expectation_1 = expect { @bird.walks  }.to eql: "Klop klop!"
expectation_2 = expect { @bird.swims  }.to eql: "Swoosh..."
expectation_3 = expect { @bird.quacks }.to capture_stdout: "Quaaaaaack!\n"
expectation_4 = expect { @bird.speaks }.to raise_exception: NoMethodError

case (expectation_1 == true &&
      expectation_2 == true &&
      expectation_3 == true &&
      expectation_4 == true)
  when true then puts "I call that #{@bird} a duck."
  else abort 'WAT?'
end
```

> I call that `#<Duck:0x007f96b285d6d0>` a duck.

## Built-in matchers

### Equivalence

```ruby
expect { 'foo' }.to eql: 'foo' # => true
```

### Identity

```ruby
expect { :foo }.to equal: :foo # => true
```

### Regular expressions

```ruby
expect { 'foo' }.to({match: /^foo$/}) # => true
```

### Expecting errors

```ruby
expect { Foo }.to raise_exception: NameError # => true
```

## Custom matchers

Custom matchers can also be defined for expressing expectations.

### Be prime

The following expression...

```ruby
require 'prime'
expect { Prime.prime? 42 }.to equal: false # => true
```

...could be refactored into:

```ruby
expect { 42 }.not_to :be_prime # => true
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
expect { 42 }.to equal: 42 # => true
```

...could be refactored into:

```ruby
expect { 42 }.to :be_the_answer # => true
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
expect { 'foobar' }.to match: /^foo/ # => true
```

...could be refactored into:

```ruby
expect { 'foobar' }.to start_with: 'foo' # => true
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

## Presentations

* [こんばんは、条件やビヘイビアテスト](https://speakerdeck.com/cyril/konbanha-tiao-jian-yabiheibiatesuto)

## Contributing

1. [Fork it](https://github.com/fixrb/spectus/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Versioning

__Spectus__ follows [Semantic Versioning 2.0](http://semver.org/)

## Copyright

&copy; 2014 [Cyril Wack](https://plus.google.com/+CyrilWack?rel=author)
