require_relative File.join 'support', 'coverage'
require_relative File.join '..', 'lib', 'spectus'

unless Process.respond_to?(:fork)
  warn 'Info: fork is not implemented on the current platform.'
  exit
end

greeting = 'Hello, world!'

result = Spectus.this do
  greeting.gsub!('world', 'Alice')
end.MUST! Eql: 'Hello, Alice!'

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
end.MUST! Eql: 'Hello, Bob!'

fail unless result.success? == true
fail unless result.info? == false
fail unless result.to_sym == :success
fail unless result.to_char == '.'
fail unless result.to_char(true) == "\e[32m.\e[0m"
fail unless result.message == 'Pass: Expected "Hello, Bob!" ' \
                              'to eql "Hello, Bob!".'
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
