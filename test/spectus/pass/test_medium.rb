require_relative File.join '..', '..', 'support', 'coverage'
require_relative File.join '..', '..', '..', 'lib', 'spectus'
require_relative 'helper'

subject 'Uppercase of foo string' do
  Spectus.this { 'foo'.upcase }
end

it 'must pass, even if the recommended expected value is ignored' do
  @object.SHOULD(eql: 'foo')
end

it 'must pass' do
  @object.SHOULD_NOT(eql: 'foo')
end

it 'must pass, the recommended expected value is correct' do
  @object.SHOULD(eql: 'FOO')
end

it 'must pass, even if the not recommended expected value is given' do
  @object.SHOULD_NOT(eql: 'FOO')
end
