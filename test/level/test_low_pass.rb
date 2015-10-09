require_relative File.join '..', 'support', 'coverage'
require_relative File.join '..', '..', 'lib', 'spectus'

subject = -> { 'foo'.upcase }

result = Spectus.this(&subject).MAY(Eql: 'FOO')

fail unless result.success? == true
fail unless result.info? == false
fail unless result.to_sym == :success
fail unless result.to_char == '.'
fail unless result.to_char(true) == "\e[32m.\e[0m"
fail unless result.message == 'Pass: Expected "FOO" to eql "FOO".'
fail unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [] },
  actual:     'FOO',
  expected:   { Eql: 'FOO' },
  got:        true,
  error:      nil,
  level:      :Low,
  negate:     false,
  valid:      true,
  result:     true
}

print '.'

subject = -> { 'foo'.bar }

result = Spectus.this(&subject).MAY(Eql: 'foo')

fail unless result.error.class == NoMethodError
fail unless result.success? == false
fail unless result.info? == true
fail unless result.to_sym == :info
fail unless result.to_char == 'I'
fail unless result.to_char(true) == "\e[33mI\e[0m"

if defined?(RUBY_ENGINE) && RUBY_ENGINE == 'ruby' &&
   defined?(RUBY_VERSION) && RUBY_VERSION.start_with?('2.')

  fail unless result.message ==
              'Info: undefined method `bar\' for "foo":String (NoMethodError).'
end

fail unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [] },
  actual:     nil,
  expected:   { Eql: 'foo' },
  got:        nil,
  error:      result.error,
  level:      :Low,
  negate:     false,
  valid:      false,
  result:     true
}

print '.'

puts