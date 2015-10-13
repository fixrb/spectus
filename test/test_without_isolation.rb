require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'spectus'

greeting = 'Hello, world!'

result = Spectus.this do
  greeting.gsub!('world', 'Alice')
end.MUST Eql: 'Hello, Alice!'

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
  expected:   result.expected,
  got:        true,
  error:      nil,
  level:      :High,
  negate:     false,
  valid:      true,
  result:     true
}

print '.'

result = Spectus.this do
  greeting.gsub!('world', 'Bob')
end.MUST :BeNil

fail unless result.success? == true
fail unless result.info? == false
fail unless result.to_sym == :success
fail unless result.to_char == '.'
fail unless result.to_char(true) == "\e[32m.\e[0m"
fail unless result.message == 'Pass: Expected nil to be nil.'
fail unless result.to_h == {
  subject:    result.subject,
  challenge:  { method: :call, args: [] },
  actual:     result.actual,
  expected:   result.expected,
  got:        true,
  error:      nil,
  level:      :High,
  negate:     false,
  valid:      true,
  result:     true
}

print '.'
