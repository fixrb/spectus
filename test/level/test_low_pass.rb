require_relative File.join '..', 'support', 'coverage'
require_relative File.join '..', '..', 'lib', 'spectus'

include Spectus

subject = -> { 'foo'.upcase }

result = it(&subject).MAY eql('FOO')

raise unless result.success? == true
raise unless result.info? == false
raise unless result.to_sym == :success
raise unless result.to_char == '.'
raise unless result.to_char(true) == "\e[32m.\e[0m"
raise unless result.message == 'Pass: Expected "FOO" to eql "FOO".'
raise unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [] },
  actual:     'FOO',
  expected:   { Eql: ['FOO'] },
  got:        true,
  error:      nil,
  level:      :Low,
  negate:     false,
  valid:      true,
  result:     true
}

print '.'

subject = -> { 'foo'.bar }

result = it(&subject).MAY eql('foo')

raise unless result.error.class == NoMethodError
raise unless result.success? == false
raise unless result.info? == true
raise unless result.to_sym == :info
raise unless result.to_char == 'I'
raise unless result.to_char(true) == "\e[33mI\e[0m"

if defined?(RUBY_ENGINE) && RUBY_ENGINE == 'ruby' &&
   defined?(RUBY_VERSION) && RUBY_VERSION.start_with?('2.')

  raise unless result.message ==
               'Info: undefined method `bar\' for "foo":String (NoMethodError).'
end

raise unless result.to_h == {
  subject:    subject,
  challenge:  { method: :call, args: [] },
  actual:     nil,
  expected:   { Eql: ['foo'] },
  got:        nil,
  error:      result.error,
  level:      :Low,
  negate:     false,
  valid:      false,
  result:     true
}

print '.'

puts
