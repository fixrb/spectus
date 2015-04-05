# Spectus

[![Build Status](https://travis-ci.org/fixrb/spectus.svg?branch=master)](https://travis-ci.org/fixrb/spectus)
[![Dependency Status](https://gemnasium.com/fixrb/spectus.svg)](https://gemnasium.com/fixrb/spectus)
[![Gem Version](http://img.shields.io/gem/v/spectus.svg)](https://rubygems.org/gems/spectus)
[![Inline docs](http://inch-ci.org/github/fixrb/spectus.svg?branch=master)](http://inch-ci.org/github/fixrb/spectus)
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)](http://rubydoc.info/gems/spectus/frames)

> Expectation library with [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt)'s requirement levels, and some matchers for Ruby.

## Contact

* Home page: https://github.com/fixrb/spectus
* Bugs/issues: https://github.com/fixrb/spectus/issues
* Support: https://stackoverflow.com/questions/tagged/spectus

## Rubies

* [MRI](https://www.ruby-lang.org/)
* [Rubinius](http://rubini.us/)
* [JRuby](http://jruby.org/)

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

## Results

There are two cases:

* when an expectation is `true`, an instance of `Spectus::Result::Pass` is returned;
* when an expectation is `false`, an instance of `Spectus::Result::Fail` is raised.

Both instances share the same interface.

## Usage

### Absolute requirement

Given the `"ルビー"` object, when it receives `valid_encoding?` method, then it **MUST** be `true`:

```ruby
Spectus.this { 'ルビー'.valid_encoding? }.MUST :BeTrue
# => #<Spectus::Result::Pass:0x007fa41c371b90 @message="passing spec", @subject=#<Proc:0x007fa41c3721f8@(irb):1>, @challenge=:call, @context=[], @actual=true, @expected=:BeTrue, @got=true, @error=nil, @level=:High, @negate=false, @valid=true>
```

The result of the test shows that the spec passed.

### Absolute prohibition

Given the `"foo"` object, when it receives `length` method, then it **MUST NOT** raise the `NoMethodError` exception:

```ruby
Spectus.this { 'foo'.length }.MUST_NOT RaiseException: NoMethodError
# => #<Spectus::Result::Pass:0x007fa41e001d50 @message="passing spec", @subject=#<Proc:0x007fa41c34a928@(irb):2>, @challenge=:call, @context=[], @actual=3, @expected={:RaiseException=>NoMethodError}, @got=true, @error=nil, @level=:High, @negate=true, @valid=true>
```

The result of the test shows that the spec passed.

### Recommended

Given the `BasicObject` object, when it receives `superclass` method, then it **SHOULD** return the explicit blank class `NilClass`:

```ruby
Spectus.this { BasicObject.superclass }.SHOULD Equal: NilClass
# => #<Spectus::Result::Pass:0x007fa41c2f1d00 @message="passing spec", @subject=#<Proc:0x007fa41c2f2110@(irb):3>, @challenge=:call, @context=[], @actual=nil, @expected={:Equal=>NilClass}, @got=false, @error=nil, @level=:Medium, @negate=false, @valid=false>
```

Even if the sole instance of `NilClass` (`nil`) was returned, there isn't any exception so the result of the test shows that the spec passed.

### Not recommended

Given the `"1"` object, when it receives `+(1)` method, then it **SHOULD NOT** return the `"11"` value:

```ruby
Spectus.this { '1' + 1 }.SHOULD_NOT Eql: '11'
# => raise #<Spectus::Result::Fail: failing spec> exception
```

There was a `TypeError` exception, the result of the test shows that the spec failed.

### Optional

Given the `"foo"` object, when it receives `bar` method, then it **MAY** match the regular expression `/^foo$/`:

```ruby
Spectus.this { 'foo'.blank? }.MAY :BeFalse
# => #<Spectus::Result::Pass:0x007fa41c2bae18 @message="passing spec", @subject=#<Proc:0x007fa41c2bb368@(irb):6>, @challenge=:call, @context=[], @actual=nil, @expected=:BeFalse, @got=nil, @error=#<NoMethodError: undefined method `blank?' for "foo":String>, @level=:Low, @negate=false, @valid=false>
```

The optional `blank?` method is not implemented (unlike in [Ruby on Rails](http://api.rubyonrails.org/classes/Object.html#method-i-blank-3F) for instance), so the result of the test shows that the spec passed.

## Versioning

__Spectus__ follows [Semantic Versioning 2.0](http://semver.org/).

## Contributing

1. [Fork it](https://github.com/fixrb/spectus/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

See `LICENSE.md` file.
