require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'spectus'

include Spectus

greeting = 'Hello, world!'

result = it { greeting.gsub!('world', 'Alice') }.MUST eql('Hello, Alice!')

fail unless result.success? == true
fail unless result.info? == false
fail unless result.to_sym == :success
fail unless result.to_char == '.'
fail unless result.to_char(true) == "\e[32m.\e[0m"
fail unless result.message == 'Pass: Expected "Hello, Alice!" ' \
                              'to eql "Hello, Alice!".'
fail unless result.to_h == {
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

print '.'

result = it { greeting.gsub!('world', 'Bob') }.MUST be_nil

fail unless result.success? == true
fail unless result.info? == false
fail unless result.to_sym == :success
fail unless result.to_char == '.'
fail unless result.to_char(true) == "\e[32m.\e[0m"
fail unless result.message == 'Pass: Expected nil to be_nil.'
fail unless result.to_h == {
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

print '.'
