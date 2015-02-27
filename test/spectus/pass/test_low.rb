require_relative File.join '..', '..', 'support', 'coverage'
require_relative File.join '..', '..', '..', 'lib', 'spectus'
require_relative 'helper'

subject 'Uppercase of foo string' do
  Spectus.this { 'foo'.upcase }
end

it 'must pass' do
  @object.MAY(eql: 'FOO')
end

# ***

subject 'Not implemented behavior' do
  Spectus.this { 'foo'.bar }
end

it 'must pass, the optional behavior is not implemented' do
  @object.MAY(eql: 'foo')
end
