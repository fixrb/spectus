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

## Usage

**Absolute requirement** definition:

```ruby
Spectus.this { 'foo'.upcase }.MUST eql: 'FOO' # => true
```

**Absolute prohibition** definition:

```ruby
Spectus.this { 'foo'.length }.MUST_NOT equal: 42 # => true
```

**Recommended** definition:

```ruby
Spectus.this { 'foo'.valid_encoding? }.SHOULD equal: true # => true
```

**Not recommended** definition:

```ruby
Spectus.this { ''.blank? }.SHOULD_NOT raise_exception: NoMethodError # => false
```

**Optional** definition:

```ruby
Spectus.this { 'foo'.bar }.MAY match: /^foo$/ # => true
```

## Versioning

__Spectus__ follows [Semantic Versioning 2.0](http://semver.org/).

## Contributing

1. [Fork it](https://github.com/fixrb/spectus/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
