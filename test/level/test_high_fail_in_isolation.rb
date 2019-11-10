# frozen_string_literal: true

require_relative File.join('..', 'support', 'coverage')
require_relative File.join('..', '..', 'lib', 'spectus')

include Spectus
front_object = 'foo'


print 'Testing high requirement expectations that fail ' \
      'when the actual value is computed in isolation'


# @note When challenging the subject against an implemented method.
subject = -> { front_object.upcase }

begin
  it(&subject).MUST! eql('foo')
  raise
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.failure? == true
  raise unless raised_result.error? == false
  raise unless raised_result.to_sym == :failure
  raise unless raised_result.to_char == 'F'
  raise unless raised_result.to_char(true) == "\e[35mF\e[0m"
  raise unless raised_result.message ==
               'Failure: expected "FOO" to eql "foo".'

  raise unless raised_result.to_h == {
    subject:    subject,
    challenge:  { method: :call, args: [] },
    actual:     'FOO',
    expected:   { Eql: ['foo'] },
    got:        false,
    error:      nil,
    level:      :Must,
    negate:     false,
    valid:      false,
    result:     false
  }

  print "\e[32m.\e[0m"
end

begin
  it(&subject).MUST_NOT! eql('FOO')
  raise
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.failure? == true
  raise unless raised_result.error? == false
  raise unless raised_result.to_sym == :failure
  raise unless raised_result.to_char == 'F'
  raise unless raised_result.to_char(true) == "\e[35mF\e[0m"
  raise unless raised_result.message ==
               'Failure: expected "FOO" not to eql "FOO".'

  raise unless raised_result.to_h == {
    subject:    subject,
    challenge:  { method: :call, args: [] },
    actual:     'FOO',
    expected:   { Eql: ['FOO'] },
    got:        false,
    error:      nil,
    level:      :Must,
    negate:     true,
    valid:      false,
    result:     false
  }

  print "\e[32m.\e[0m"
end


# @note When challenging the subject against a not implemented method.
subject = -> { front_object.bar }

begin
  it(&subject).MUST! eql('foo')
  raise
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.error.class == NoMethodError
  raise unless raised_result.failure? == false
  raise unless raised_result.error? == true
  raise unless raised_result.to_sym == :error
  raise unless raised_result.to_char == 'E'
  raise unless raised_result.to_char(true) == "\e[31mE\e[0m"
  raise unless raised_result.message.start_with?('Error: ')

  raise unless raised_result.to_h == {
    subject:    subject,
    challenge:  { method: :call, args: [] },
    actual:     nil,
    expected:   { Eql: ['foo'] },
    got:        nil,
    error:      raised_result.error,
    level:      :Must,
    negate:     false,
    valid:      false,
    result:     false
  }

  print "\e[32m.\e[0m"
end

begin
  it(&subject).MUST_NOT! eql('foo')
  raise
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.error.class == NoMethodError
  raise unless raised_result.failure? == false
  raise unless raised_result.error? == true
  raise unless raised_result.to_sym == :error
  raise unless raised_result.to_char == 'E'
  raise unless raised_result.to_char(true) == "\e[31mE\e[0m"
  raise unless raised_result.message.start_with?('Error: ')

  raise unless raised_result.to_h == {
    subject:    subject,
    challenge:  { method: :call, args: [] },
    actual:     nil,
    expected:   { Eql: ['foo'] },
    got:        nil,
    error:      raised_result.error,
    level:      :Must,
    negate:     true,
    valid:      false,
    result:     false
  }

  print "\e[32m.\e[0m"
end


# @note When challenging the subject against an implemented method but bad args.
subject = -> { front_object.upcase(:bar) }

begin
  it(&subject).MUST! eql('foo')
  raise
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.error.class == ArgumentError
  raise unless raised_result.failure? == false
  raise unless raised_result.error? == true
  raise unless raised_result.to_sym == :error
  raise unless raised_result.to_char == 'E'
  raise unless raised_result.to_char(true) == "\e[31mE\e[0m"
  raise unless raised_result.message.start_with?('Error: ')

  raise unless raised_result.to_h == {
    subject:    subject,
    challenge:  { method: :call, args: [] },
    actual:     nil,
    expected:   { Eql: ['foo'] },
    got:        nil,
    error:      raised_result.error,
    level:      :Must,
    negate:     false,
    valid:      false,
    result:     false
  }

  print "\e[32m.\e[0m"
end

begin
  it(&subject).MUST_NOT! eql('foo')
  raise
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.error.class == ArgumentError
  raise unless raised_result.failure? == false
  raise unless raised_result.error? == true
  raise unless raised_result.to_sym == :error
  raise unless raised_result.to_char == 'E'
  raise unless raised_result.to_char(true) == "\e[31mE\e[0m"
  raise unless raised_result.message.start_with?('Error: ')

  raise unless raised_result.to_h == {
    subject:    subject,
    challenge:  { method: :call, args: [] },
    actual:     nil,
    expected:   { Eql: ['foo'] },
    got:        nil,
    error:      raised_result.error,
    level:      :Must,
    negate:     true,
    valid:      false,
    result:     false
  }

  print "\e[32m.\e[0m"
end


puts "\e[32mSuccess!\e[0m"
