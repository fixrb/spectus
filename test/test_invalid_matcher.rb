# frozen_string_literal: false

require_relative File.join('support', 'coverage')
require_relative File.join('..', 'lib', 'spectus')

begin
  Spectus::RequirementLevel::Base.new(
    matcher:      'BOOM',
    is_negate:    true,
    subject:      42,
    challenge:    Defi.send(:call),
    is_isolation: true
  ).call

  raise
rescue NoMethodError
  print "\e[32m.\e[0m"
end
