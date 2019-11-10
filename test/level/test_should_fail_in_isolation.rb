# frozen_string_literal: true

require_relative File.join('..', 'support', 'coverage')
require_relative File.join('..', '..', 'lib', 'spectus')

include Spectus
front_object = 'foo'


print 'Testing medium requirement expectations that fail ' \
      'when the actual value is computed in isolation'


# @note When challenging the subject against a not implemented method.
subject = -> { front_object.bar }

begin
  it(&subject).SHOULD! eql('foo')
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
    subject:            subject,
    challenge:          { method: :call, args: [], opts: {}, block: nil },
    actual:             nil,
    expected:           { Eql: ['foo'] },
    got:                nil,
    error:              raised_result.error,
    requirement_level:  :SHOULD,
    negate:             false,
    valid:              false,
    result:             false
  }

  print "\e[32m.\e[0m"
end

begin
  it(&subject).SHOULD_NOT! eql('foo')
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
    subject:            subject,
    challenge:          { method: :call, args: [], opts: {}, block: nil },
    actual:             nil,
    expected:           { Eql: ['foo'] },
    got:                nil,
    error:              raised_result.error,
    requirement_level:  :SHOULD,
    negate:             true,
    valid:              false,
    result:             false
  }

  print "\e[32m.\e[0m"
end


puts "\e[32mSuccess!\e[0m"
