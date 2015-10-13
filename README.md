# Spectus

[![Build Status](https://travis-ci.org/fixrb/spectus.svg?branch=master)][travis]
[![Gem Version](https://badge.fury.io/rb/spectus.svg)][gem]
[![Inline docs](http://inch-ci.org/github/fixrb/spectus.svg?branch=master)][inchpages]
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

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

__Spectus__ is cryptographically signed.

To be sure the gem you install hasn't been tampered with, add my public key (if you haven't already) as a trusted certificate:

    $ gem cert --add <(curl -Ls https://raw.github.com/fixrb/spectus/master/certs/gem-fixrb-public_cert.pem)
    $ gem install spectus -P HighSecurity

The `HighSecurity` trust profile will verify all gems.  All of __Spectus__'s dependencies are signed.

Or add this line to your application's Gemfile:

```ruby
gem 'spectus'
```

And then execute:

    $ bundle

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
greeting = 'Hello, world!'
Spectus.this { greeting.gsub!('world', 'Alice') }.MUST! Eql: 'Hello, Alice!'
# => #<Spectus::Result::Pass:0x007fd6312e5310 @message="Pass: Expected \"Hello, Alice!\" to eql \"Hello, Alice!\".", @subject=#<Proc:0x007fd6312e6238@(irb):2>, @challenge=#<Defi::Challenge:0x007fd6312e59c8 @method=:call, @args=[]>, @actual="Hello, Alice!", @expected={:Eql=>"Hello, Alice!"}, @got=true, @error=nil, @level=:High, @negate=false, @valid=true>
greeting # => "Hello, world!"
```

Example of test without isolation:

```ruby
greeting = 'Hello, world!'
Spectus.this { greeting.gsub!('world', 'Alice') }.MUST Eql: 'Hello, Alice!'
# => #<Spectus::Result::Pass:0x007fabbab88f68 @message="Pass: Expected \"Hello, Alice!\" to eql \"Hello, Alice!\".", @subject=#<Proc:0x007fabbab895a8@(irb):2>, @challenge=#<Defi::Challenge:0x007fabbab89530 @method=:call, @args=[]>, @actual="Hello, Alice!", @expected={:Eql=>"Hello, Alice!"}, @got=true, @error=nil, @level=:High, @negate=false, @valid=true>
greeting # => "Hello, Alice!"
```

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
# => #<Spectus::Result::Pass:0x007fec19b1d638 @message="Pass: Expected true to be true.", @subject=#<Proc:0x007fec19b1e470@(irb):1>, @challenge=#<Spectus::Challenge:0x007fec19b1e3a8 @method=:call, @args=[]>, @actual=true, @expected=:BeTrue, @got=true, @error=nil, @level=:High, @negate=false, @valid=true>
```

The result of the test shows that the spec passed.

### Absolute prohibition

Given the `"foo"` object, when it receives `length` method, then it **MUST NOT** raise the `NoMethodError` exception:

```ruby
Spectus.this { 'foo'.length }.MUST_NOT RaiseException: NoMethodError
# => #<Spectus::Result::Pass:0x007fec193a0fe0 @message="Pass: Expected 3 not to raise exception NoMethodError.", @subject=#<Proc:0x007fec193a1a08@(irb):2>, @challenge=#<Spectus::Challenge:0x007fec193a19b8 @method=:call, @args=[]>, @actual=3, @expected={:RaiseException=>NoMethodError}, @got=true, @error=nil, @level=:High, @negate=true, @valid=true>
```

The result of the test shows that the spec passed.

### Recommended

Given the `BasicObject` object, when it receives `superclass` method, then it **SHOULD** return the explicit blank class `NilClass`:

```ruby
Spectus.this { BasicObject.superclass }.SHOULD Equal: NilClass
# => #<Spectus::Result::Pass:0x007fec193b2ec0 @message="Info: Expected nil to equal NilClass.", @subject=#<Proc:0x007fec193b37f8@(irb):3>, @challenge=#<Spectus::Challenge:0x007fec193b37a8 @method=:call, @args=[]>, @actual=nil, @expected={:Equal=>NilClass}, @got=false, @error=nil, @level=:Medium, @negate=false, @valid=false>
```

Instead of the expected `NilClass` class, its sole instance (which is `nil`) was returned.
However, because there isn't any exception, the result of the test shows that the spec passed.

### Not recommended

Given the `"1"` object, when it receives `+(1)` method, then it **SHOULD NOT** return the `"11"` value:

```ruby
Spectus.this { '1' + 1 }.SHOULD_NOT Eql: '11'
# Spectus::Result::Fail: Error: no implicit conversion of Fixnum into String (TypeError).
# 	from (irb):4
# 	from ./bin/console:7:in `<main>'
```

There was a `TypeError` exception, the result of the test shows that the spec failed.

### Optional

Given the `"foo"` object, when it receives `blank?` method, then it **MAY** be `false`:

```ruby
Spectus.this { 'foo'.blank? }.MAY :BeFalse
# => #<Spectus::Result::Pass:0x007fec19423af8 @message="Info: undefined method `blank?' for \"foo\":String (NoMethodError).", @subject=#<Proc:0x007fec193f0270@(irb):5>, @challenge=#<Spectus::Challenge:0x007fec193f0220 @method=:call, @args=[]>, @actual=nil, @expected=:BeFalse, @got=nil, @error=#<NoMethodError: undefined method `blank?' for "foo":String>, @level=:Low, @negate=false, @valid=false>
```

The optional `blank?` method is not implemented (unlike in [Ruby on Rails](http://api.rubyonrails.org/classes/Object.html#method-i-blank-3F), for instance), so the result of the test shows that the spec passed.

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

__Spectus__ follows [Semantic Versioning 2.0](http://semver.org/).

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
[inchpages]: http://inch-ci.org/github/fixrb/spectus/
[rubydoc]: http://rubydoc.info/gems/spectus/frames
