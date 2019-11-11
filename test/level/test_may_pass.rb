# frozen_string_literal: true

require_relative File.join('..', 'support', 'coverage')
require_relative File.join('..', '..', 'lib', 'spectus')

include Spectus
front_object = 'foo'


print 'Testing low requirement expectations that pass'


# @note When challenging the subject against an implemented method.
subject = -> { front_object.upcase }

result = it(&subject).MAY eql('FOO')

raise unless result.success? == true
raise unless result.info? == false
raise unless result.to_sym == :success
raise unless result.to_char == '.'
raise unless result.to_char(true) == "\e[32m.\e[0m"
raise unless result.message == 'Success: expected "FOO" to eql "FOO".'

raise unless result.to_h == {
  subject:            subject,
  challenge:          { method: :call, args: [], opts: {}, block: nil },
  actual:             'FOO',
  expected:           { Eql: ['FOO'] },
  got:                true,
  error:              nil,
  requirement_level:  :MAY,
  negate:             false,
  valid:              true,
  result:             true
}

print "\e[32m.\e[0m"


# @note When challenging the subject against a not implemented method.
subject = -> { front_object.bar }

result = it(&subject).MAY eql('foo')

raise unless result.error.class == NoMethodError
raise unless result.success? == false
raise unless result.info? == true
raise unless result.to_sym == :info
raise unless result.to_char == 'I'
raise unless result.to_char(true) == "\e[33mI\e[0m"
raise unless result.message == 'Info: undefined method `bar\' for "foo":String (NoMethodError).'

raise unless result.to_h == {
  subject:            subject,
  challenge:          { method: :call, args: [], opts: {}, block: nil },
  actual:             nil,
  expected:           { Eql: ['foo'] },
  got:                nil,
  error:              result.error,
  requirement_level:  :MAY,
  negate:             false,
  valid:              false,
  result:             true
}

print "\e[32m.\e[0m"


puts "\e[32mSuccess!\e[0m"
