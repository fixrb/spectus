require_relative File.join '..', '..', 'support', 'coverage'
require_relative File.join '..', '..', '..', 'lib', 'spectus'
require_relative 'helper'

subject 'Uppercase of foo string' do
  Spectus.this { 'foo'.upcase }
end

it 'must fail, the recommended expected value is ignored' do
  begin
    @object.MAY(eql: 'foo')
  rescue Spectus::LowFailure
    true
  end
end

# ***

subject 'Unexpected exception' do
  Spectus.this { 'foo'.upcase(:bar) }
end

it 'must fail, the optional behavior is implemented but it raised an error' do
  begin
    @object.MAY(eql: 'foo')
  rescue Spectus::LowFailure
    true
  end
end
