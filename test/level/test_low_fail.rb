# frozen_string_literal: true

require_relative File.join '..', 'support', 'coverage'
require_relative File.join '..', '..', 'lib', 'spectus'

include Spectus

subject = -> { 'foo'.upcase }

begin
  it(&subject).MAY eql('foo')
rescue Spectus::Result::Fail => raised_result
  raise unless raised_result.failure? == true
  raise unless raised_result.error? == false
  raise unless raised_result.to_sym == :failure
  raise unless raised_result.to_char == 'F'
  raise unless raised_result.to_char(true) == "\e[35mF\e[0m"
  raise unless raised_result.message == 'Failure: Expected "FOO" to eql "foo".'

  raise unless raised_result.to_h == {
    subject:    subject,
    challenge:  { method: :call, args: [] },
    actual:     'FOO',
    expected:   { Eql: ['foo'] },
    got:        false,
    error:      nil,
    level:      :Low,
    negate:     false,
    valid:      false,
    result:     false
  }

  print '.'
end

subject = -> { 'foo'.upcase(:bar) }

begin
  it(&subject).MAY eql('foo')
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
    level:      :Low,
    negate:     false,
    valid:      false,
    result:     false
  }

  print '.'
end

puts
