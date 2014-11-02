require_relative 'helper_test'

subject 'start with custom matcher' do
  Spectus::Matcher::StartWith.new('foo')
end

it 'must match the string' do
  expect { subject.matches? { 'foobar' } }.to equal: true
end

it 'must not match the string' do
  expect { subject.matches? { 'bar' } }.not_to equal: true
end

it 'must return false' do
  expect { subject.matches? { 'bar' } }.to equal: false
end

it 'must return the raised exception' do
  expect { fail subject.matches? { BOOM } }.to raise_exception: NameError
end
