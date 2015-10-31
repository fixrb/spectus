require_relative File.join '..', 'support', 'coverage'
require_relative File.join '..', '..', 'lib', 'spectus'

include Spectus

subject = -> { true }

result = it(&subject).MUST be_true

fail unless result.success? == true
fail unless result.info? == false
fail unless result.to_sym == :success
fail unless result.to_char == '.'
fail unless result.to_char(true) == "\e[32m.\e[0m"
fail unless result.message == 'Pass: Expected true to be_true.'
fail unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [] },
  actual:     true,
  expected:   { BeTrue: [] },
  got:        true,
  error:      nil,
  level:      :High,
  negate:     false,
  valid:      true,
  result:     true
}

print '.'

result = it(&subject).MUST_NOT be_false

fail unless result.success? == true
fail unless result.info? == false
fail unless result.to_sym == :success
fail unless result.to_char == '.'
fail unless result.to_char(true) == "\e[32m.\e[0m"
fail unless result.message == 'Pass: Expected true not to be_false.'
fail unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [] },
  actual:     true,
  expected:   { BeFalse: [] },
  got:        true,
  error:      nil,
  level:      :High,
  negate:     true,
  valid:      true,
  result:     true
}

print '.'

puts
