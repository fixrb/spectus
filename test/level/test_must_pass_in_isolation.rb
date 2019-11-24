# frozen_string_literal: true

require_relative File.join('..', 'support', 'coverage')
require_relative File.join('..', '..', 'lib', 'spectus')

include Spectus
front_object = true


print 'Testing high requirement expectations that pass ' \
      'when the actual value is computed in isolation'


# @note When challenging the subject against an implemented method.
subject = -> { front_object.itself }

result = it(&subject).MUST! be_true

raise unless result.success? == true
raise unless result.info? == false
raise unless result.to_sym == :success
raise unless result.to_char(is_color: false) == '.'
raise unless result.to_char(is_color: true) == "\e[32m.\e[0m"
raise unless result.message == 'Success: expected true to be_true.'

print "\e[32m.\e[0m"

result = it(&subject).MUST_NOT! be_false

raise unless result.success? == true
raise unless result.info? == false
raise unless result.to_sym == :success
raise unless result.to_char(is_color: false) == '.'
raise unless result.to_char(is_color: true) == "\e[32m.\e[0m"
raise unless result.message == 'Success: expected true not to be_false.'

print "\e[32m.\e[0m"


puts "\e[32mSuccess!\e[0m"
