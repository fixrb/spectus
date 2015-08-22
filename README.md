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
# => #<Spectus::Result::Pass:0x007fbbc12b9fd8 @subject=#<Proc:0x007fbbc12ba410@(irb):1>, @challenge=:call, @context=[], @actual=true, @expected=:BeTrue, @got=true, @error=nil, @level=:High, @negate=false, @valid=true>
```

The result of the test shows that the spec passed.

### Absolute prohibition

Given the `"foo"` object, when it receives `length` method, then it **MUST NOT** raise the `NoMethodError` exception:

```ruby
Spectus.this { 'foo'.length }.MUST_NOT RaiseException: NoMethodError
# => #<Spectus::Result::Pass:0x007fbbc12a8e90 @subject=#<Proc:0x007fbbc12a95e8@(irb):2>, @challenge=:call, @context=[], @actual=3, @expected={:RaiseException=>NoMethodError}, @got=true, @error=nil, @level=:High, @negate=true, @valid=true>
```

The result of the test shows that the spec passed.

### Recommended

Given the `BasicObject` object, when it receives `superclass` method, then it **SHOULD** return the explicit blank class `NilClass`:

```ruby
Spectus.this { BasicObject.superclass }.SHOULD Equal: NilClass
# => #<Spectus::Result::Pass:0x007fbbc1291ec0 @subject=#<Proc:0x007fbbc12923e8@(irb):3>, @challenge=:call, @context=[], @actual=nil, @expected={:Equal=>NilClass}, @got=false, @error=nil, @level=:Medium, @negate=false, @valid=false>
```

Instead of the expected `NilClass` class, its sole instance (which is `nil`) was returned.
However, because there isn't any exception, the result of the test shows that the spec passed.

### Not recommended

Given the `"1"` object, when it receives `+(1)` method, then it **SHOULD NOT** return the `"11"` value:

```ruby
Spectus.this { '1' + 1 }.SHOULD_NOT Eql: '11'
# => raise #<Spectus::Result::Fail: failing spec> exception
```

There was a `TypeError` exception, the result of the test shows that the spec failed.

### Optional

Given the `"foo"` object, when it receives `blank?` method, then it **MAY** be `false`:

```ruby
Spectus.this { 'foo'.blank? }.MAY :BeFalse
# => #<Spectus::Result::Pass:0x007fbbc1b7c238 @subject=#<Proc:0x007fbbc1b7c698@(irb):5>, @challenge=:call, @context=[], @actual=nil, @expected=:BeFalse, @got=nil, @error=#<NoMethodError: undefined method `blank?' for "foo":String>, @level=:Low, @negate=false, @valid=false>
```

The optional `blank?` method is not implemented (unlike in [Ruby on Rails](http://api.rubyonrails.org/classes/Object.html#method-i-blank-3F), for instance), so the result of the test shows that the spec passed.

## Security

As a basic form of security __Spectus__ provides a set of SHA512 checksums for
every Gem release.  These checksums can be found in the `checksum/` directory.
Although these checksums do not prevent malicious users from tampering with a
built Gem they can be used for basic integrity verification purposes.

The checksum of a file can be checked using the `sha512sum` command.  For
example:

    $ sha512sum pkg/spectus-2.0.0.gem
    e00ef19cbae209816410c1b0e4b032a59ba70ab2e43367c934ad723d3e23a9c50c457c0963fab7d46743d82ab21f9482dbd8ceb7cab23617e37be26823d846cd  pkg/spectus-2.0.0.gem

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
