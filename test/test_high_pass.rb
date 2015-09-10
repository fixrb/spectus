require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'spectus'

subject = -> { true }

result = Spectus.this(&subject).MUST(:BeTrue)

fail unless result.to_char == '.'
fail unless result.message == 'Pass: Expected true to be true.'
fail unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [] },
  actual:     true,
  expected:   :BeTrue,
  got:        true,
  error:      nil,
  level:      :High,
  negate:     false,
  valid:      true,
  result:     true
}

print '.'

result = Spectus.this(&subject).MUST_NOT(:BeFalse)

fail unless result.to_char == '.'
fail unless result.message == 'Pass: Expected true not to be false.'
fail unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [] },
  actual:     true,
  expected:   :BeFalse,
  got:        true,
  error:      nil,
  level:      :High,
  negate:     true,
  valid:      true,
  result:     true
}

print '.'

puts
