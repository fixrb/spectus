require_relative File.join '..', '..', 'support', 'coverage'
require_relative File.join '..', '..', '..', 'lib', 'spectus'
require_relative 'helper'

subject 'Uppercase of foo string' do
  Spectus.this { 'foo'.bar }
end

it 'must raise and fail the spec' do
  @object.SHOULD(eql: 'foo').equal?(false)
end

it 'must also raise and fail the spec' do
  @object.SHOULD_NOT(eql: 'foo').equal?(false)
end
