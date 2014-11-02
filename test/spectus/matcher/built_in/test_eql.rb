require_relative 'helper_test'

subject 'eql built-in matcher' do
  Spectus::Matcher::Eql.new 'foo'
end

it 'must be eql' do
  expect { subject.matches? { 'foo' } }.to equal: true
end

it 'must not be eql' do
  expect { subject.matches? { 'bar' } }.not_to equal: true
end

it 'must return false' do
  expect { subject.matches? { 'bar' } }.to equal: false
end

it 'must return the raised exception' do
  expect { fail subject.matches? { BOOM } }.to raise_exception: NameError
end
