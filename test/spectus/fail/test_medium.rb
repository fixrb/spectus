require_relative File.join '..', '..', 'support', 'coverage'
require_relative File.join '..', '..', '..', 'lib', 'spectus'
require_relative 'helper'

subject 'Uppercase of foo string' do
  Spectus.this { 'foo'.bar }
end

it 'must raise and fail the spec' do
  begin
    @object.SHOULD(eql: 'foo')
  rescue Spectus::MediumFailure
    true
  end
end

it 'must also raise and fail the spec' do
  begin
    @object.SHOULD_NOT(eql: 'foo')
  rescue Spectus::MediumFailure
    true
  end
end
