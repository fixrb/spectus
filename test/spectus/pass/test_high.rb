require_relative File.join '..', '..', 'support', 'coverage'
require_relative File.join '..', '..', '..', 'lib', 'spectus'
require_relative 'helper'

subject 'Uppercase of foo string' do
  Spectus.this { 'foo'.upcase }
end

it 'must be equivalent to FOO' do
  @object.MUST(eql: 'FOO').equal?(true)
end

it 'must no longer be equivalent to foo' do
  @object.MUST_NOT(eql: 'foo').equal?(true)
end
