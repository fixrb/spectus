# frozen_string_literal: false

require_relative File.join('support', 'coverage')
require_relative File.join('..', 'lib', 'spectus')

begin
  Spectus::RequirementLevel::Base.new('BOOM', true, 42, Defi.send(:call), true)
  raise
rescue NoMethodError
  print "\e[32m.\e[0m"
end
