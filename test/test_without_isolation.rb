# frozen_string_literal: false

require_relative File.join('support', 'coverage')
require_relative File.join('..', 'lib', 'spectus')

include Spectus

greeting = 'Hello, world!'

result = it { greeting.gsub!('world', 'Alice') }.MUST eql('Hello, Alice!')

raise unless result.success? == true
raise unless result.info? == false
raise unless result.to_sym == :success
raise unless result.to_char(is_color: false) == '.'
raise unless result.to_char(is_color: true) == "\e[32m.\e[0m"
raise unless result.message == 'Success: expected "Hello, Alice!" ' \
                              'to eql "Hello, Alice!".'

print "\e[32m.\e[0m"

result = it { greeting.gsub!('world', 'Bob') }.MUST be_nil

raise unless result.success? == true
raise unless result.info? == false
raise unless result.to_sym == :success
raise unless result.to_char(is_color: false) == '.'
raise unless result.to_char(is_color: true) == "\e[32m.\e[0m"
raise unless result.message == 'Success: expected nil to be_nil.'

print "\e[32m.\e[0m"
