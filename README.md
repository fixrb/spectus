# Spectus

[![Build Status](https://travis-ci.org/fixrb/spectus.svg?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/fixrb/spectus/badges/gpa.svg)][codeclimate]
[![Gem Version](https://badge.fury.io/rb/spectus.svg)][gem]
[![Inline docs](https://inch-ci.org/github/fixrb/spectus.svg?branch=master)][inchpages]
[![Documentation](https://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> Expectation library with [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt)'s requirement levels, and some matchers for Ruby.

## Contact

* Home page: https://github.com/fixrb/spectus
* Bugs/issues: https://github.com/fixrb/spectus/issues
* Support: https://stackoverflow.com/questions/tagged/spectus

## Rubies

* [MRI](https://www.ruby-lang.org/en/)
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
# => #<Spectus::Result::Pass:0x00007fca618bcd28 @message="Pass: Expected \"Hello, Alice!\" to eql \"Hello, Alice!\".", @subject=#<Proc:0x00007fca618bf370 (irb):3>, @challenge=#<Defi::Challenge:0x00007fca618bf168 @method=:call, @args=[]>, @actual="Hello, Alice!", @expected=#<Matchi::Matchers::Eql::Matcher:0x00007fca618bf028 @expected="Hello, Alice!">, @got=true, @error=nil, @level=:High, @negate=false, @valid=true>
greeting # => "Hello, world!"
```

Example of test without isolation:

```ruby
include Spectus

greeting = 'Hello, world!'
it { greeting.gsub!('world', 'Alice') }.MUST eql 'Hello, Alice!'
# => #<Spectus::Result::Pass:0x00007fdfa31b0168 @message="Pass: Expected \"Hello, Alice!\" to eql \"Hello, Alice!\".", @subject=#<Proc:0x00007fdfa31b09d8 (irb):3>, @challenge=#<Defi::Challenge:0x00007fdfa31b0870 @method=:call, @args=[]>, @actual="Hello, Alice!", @expected=#<Matchi::Matchers::Eql::Matcher:0x00007fdfa31b06e0 @expected="Hello, Alice!">, @got=true, @error=nil, @level=:High, @negate=false, @valid=true>
greeting # => "Hello, Alice!"
```

## Results

There are two cases:

* when an expectation is `true`, an instance of `Spectus::Result::Pass` is returned;
* when an expectation is `false`, an instance of `Spectus::Result::Fail` is raised.

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
# => #<Spectus::Result::Pass:0x00007faac7024df0 @message="Pass: Expected true to be_true.", @subject=#<Proc:0x00007faac7046428 (irb):2>, @challenge=#<Defi::Challenge:0x00007faac7035650 @method=:call, @args=[]>, @actual=true, @expected=#<Matchi::Matchers::BeTrue::Matcher:0x00007faac7035060>, @got=true, @error=nil, @level=:High, @negate=false, @valid=true>
```

The result of the test shows that the spec passed.

### Absolute prohibition

Given the "`foo`" object, when it receives `length` method, then it **MUST NOT** raise the `NoMethodError` exception:

```ruby
it { 'foo'.length }.MUST_NOT raise_exception NoMethodError
# => #<Spectus::Result::Pass:0x00007faac7ae65b8 @message="Pass: Expected 3 not to raise_exception NoMethodError.", @subject=#<Proc:0x00007faac7ae68b0 (irb):3>, @challenge=#<Defi::Challenge:0x00007faac7ae6838 @method=:call, @args=[]>, @actual=3, @expected=#<Matchi::Matchers::RaiseException::Matcher:0x00007faac7ae6798 @expected=NoMethodError>, @got=true, @error=nil, @level=:High, @negate=true, @valid=true>
```

The result of the test shows that the spec passed.

### Recommended

Given the `BasicObject` object, when it receives `superclass` method, then it **SHOULD** return the explicit blank class `NilClass`:

```ruby
it { BasicObject.superclass }.SHOULD equal NilClass
# => #<Spectus::Result::Pass:0x00007faac7b3edf8 @message="Info: Expected nil to equal NilClass.", @subject=#<Proc:0x00007faac7b3f0c8 (irb):4>, @challenge=#<Defi::Challenge:0x00007faac7b3f050 @method=:call, @args=[]>, @actual=nil, @expected=#<Matchi::Matchers::Equal::Matcher:0x00007faac7b3efb0 @expected=nil>, @got=false, @error=nil, @level=:Medium, @negate=false, @valid=false>
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
# => #<Spectus::Result::Pass:0x00007faac721cf68 @message="Info: undefined method `blank?' for \"foo\":String (NoMethodError).", @subject=#<Proc:0x00007faac721d3a0 (irb):6>, @challenge=#<Defi::Challenge:0x00007faac721d328 @method=:call, @args=[]>, @actual=nil, @expected=#<Matchi::Matchers::BeFalse::Matcher:0x00007faac721d288>, @got=nil, @error=#<NoMethodError: undefined method `blank?' for "foo":String>, @level=:Low, @negate=false, @valid=false>
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
[gemnasium]: https://gemnasium.com/fixrb/spectus
[inchpages]: https://inch-ci.org/github/fixrb/spectus
[rubydoc]: https://rubydoc.info/gems/spectus/frames

***

This project is sponsored by:

[![Sashite](https://pbs.twimg.com/profile_images/618485028322975744/PZ9qPuI__400x400.png)](https://sashite.com/)
