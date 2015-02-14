require_relative File.join '..', '..', 'support', 'coverage'
require_relative File.join '..', '..', '..', 'lib', 'spectus'
require_relative 'helper'

subject 'Unexpected exception' do
  Spectus.this { 'foo'.upcase(:bar) }
end

it 'must fail, the optional behavior is implemented but it raised an error' do
  @object.MAY(eql: 'foo').equal?(false)
end
