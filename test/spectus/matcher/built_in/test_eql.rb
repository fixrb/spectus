require_relative 'helper_test'

subject 'eql built-in matcher' do
  Spectus::Matcher::Eql.new 'foo'
end

it 'must return the expected value' do
  expect { subject.instance_variable_get(:@expected) }.to eql: 'foo'
end

it 'must be eql' do
  expect { subject.matches? { 'foo' } }.to equal: true
end

it 'must not be eql' do
  expect { subject.matches? { 'bar' } }.to equal: false
end

it 'must return the raised exception' do
  expect { raise subject.matches? { BOOM } }.to raise_exception: NameError
end
