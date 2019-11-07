# frozen_string_literal: false

require_relative File.join('support', 'coverage')
require_relative File.join('..', 'lib', 'spectus')

include Spectus

greeting = 'Hello, world!'

result = it { greeting.gsub!('world', 'Alice') }.MUST eql('Hello, Alice!')

raise unless result.success? == true
raise unless result.info? == false
raise unless result.to_sym == :success
raise unless result.to_char == '.'
raise unless result.to_char(true) == "\e[32m.\e[0m"
raise unless result.message == 'Success: Expected "Hello, Alice!" ' \
                              'to eql "Hello, Alice!".'
raise unless result.to_h == {
  subject:    result.subject,
  challenge:  { method: :call, args: [] },
  actual:     result.actual,
  expected:   result.expected.to_h,
  got:        true,
  error:      nil,
  level:      :High,
  negate:     false,
  valid:      true,
  result:     true
}

print "\e[32m.\e[0m"

result = it { greeting.gsub!('world', 'Bob') }.MUST be_nil

raise unless result.success? == true
raise unless result.info? == false
raise unless result.to_sym == :success
raise unless result.to_char == '.'
raise unless result.to_char(true) == "\e[32m.\e[0m"
raise unless result.message == 'Success: Expected nil to be_nil.'
raise unless result.to_h == {
  subject:    result.subject,
  challenge:  { method: :call, args: [] },
  actual:     result.actual,
  expected:   result.expected.to_h,
  got:        true,
  error:      nil,
  level:      :High,
  negate:     false,
  valid:      true,
  result:     true
}

print "\e[32m.\e[0m"
