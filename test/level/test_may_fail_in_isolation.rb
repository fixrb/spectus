# frozen_string_literal: true

require_relative File.join('..', 'support', 'coverage')
require_relative File.join('..', '..', 'lib', 'spectus')

include Spectus
front_object = 'foo'


print 'Testing low requirement expectations that fail ' \
      'when the actual value is computed in isolation'


# @note When challenging the subject against an implemented method.
subject = -> { front_object.upcase }

begin
  it(&subject).MAY! eql('foo')
  raise
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.error?   == false
  raise unless raised_result.failure? == true
  raise unless raised_result.info?    == false
  raise unless raised_result.negate?  == false
  raise unless raised_result.pass?    == false
  raise unless raised_result.success? == false
  raise unless raised_result.valid?   == false
  raise unless raised_result.warning? == false

  raise unless raised_result.to_sym == :failure

  raise unless raised_result.to_char(is_color: false) == 'F'
  raise unless raised_result.to_char(is_color: true)  == "\e[35mF\e[0m"

  raise unless raised_result.message  == 'Failure: expected "FOO" to eql "foo".'
  raise unless raised_result.to_s     == 'Failure: expected "FOO" to eql "foo".'

  raise unless raised_result.inspect == 'Spectus::Result::Fail(actual: "FOO", challenge: Defi(method: :call, args: [], opts: {}, block: ), error: nil, expected: Eql("foo"), got: false, negate: false, requirement_level: :MAY, valid: false)'

  raise unless raised_result.to_h == {
    subject:            subject,
    challenge:          { method: :call, args: [], opts: {}, block: nil },
    actual:             'FOO',
    expected:           { Eql: ['foo'] },
    got:                false,
    error:              nil,
    requirement_level:  :MAY,
    negate:             false,
    valid:              false,
    result:             false
  }

  print "\e[32m.\e[0m"
end


# @note When challenging the subject against an implemented method but bad args.
subject = -> { front_object.upcase(:bar) }

begin
  it(&subject).MAY! eql('foo')
  raise
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.error.class == ArgumentError
  raise unless raised_result.failure? == false
  raise unless raised_result.error? == true
  raise unless raised_result.to_sym == :error
  raise unless raised_result.to_char(is_color: false) == 'E'
  raise unless raised_result.to_char(is_color: true) == "\e[31mE\e[0m"
  raise unless raised_result.message == 'Error: invalid option (ArgumentError).'

  raise unless raised_result.to_h == {
    subject:            subject,
    challenge:          { method: :call, args: [], opts: {}, block: nil },
    actual:             nil,
    expected:           { Eql: ['foo'] },
    got:                nil,
    error:              raised_result.error,
    requirement_level:  :MAY,
    negate:             false,
    valid:              false,
    result:             false
  }

  print "\e[32m.\e[0m"
end


puts "\e[32mSuccess!\e[0m"
