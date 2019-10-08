# frozen_string_literal: true

require_relative File.join('..', 'support', 'coverage')
require_relative File.join('..', '..', 'lib', 'spectus')

include Spectus

subject = -> { 'foo'.bar }

begin
  it(&subject).SHOULD eql('foo')
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
    level:      :Medium,
    negate:     false,
    valid:      false,
    result:     false
  }

  print '.'
end

begin
  it(&subject).SHOULD_NOT eql('foo')
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
    level:      :Medium,
    negate:     true,
    valid:      false,
    result:     false
  }

  print '.'
end

puts
