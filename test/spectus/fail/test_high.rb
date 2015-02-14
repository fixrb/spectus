require_relative File.join '..', '..', 'support', 'coverage'
require_relative File.join '..', '..', '..', 'lib', 'spectus'
require_relative 'helper'

subject 'Uppercase of foo string' do
  Spectus.this { 'foo'.upcase }
end

it 'must be equivalent to foo must be false' do
  @object.MUST(eql: 'foo').equal?(false)
end

it 'must not be equivalent to FOO must be false' do
  @object.MUST_NOT(eql: 'FOO').equal?(false)
end

# ***

subject 'Not implemented behavior' do
  Spectus.this { 'foo'.bar }
end

it 'must raise and fail the spec' do
  @object.MUST(eql: 'foo').equal?(false)
end

it 'must also raise and fail the spec' do
  @object.MUST_NOT(eql: 'foo').equal?(false)
end

# ***

subject 'Unexpected exception' do
  Spectus.this { 'foo'.upcase(:bar) }
end

it 'must raise and fail the spec' do
  @object.MUST(eql: 'foo').equal?(false)
end

it 'must also raise and fail the spec' do
  @object.MUST_NOT(eql: 'foo').equal?(false)
end
