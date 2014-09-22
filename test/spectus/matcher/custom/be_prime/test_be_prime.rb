require_relative 'helper_test'

subject 'be prime custom matcher' do
  Spectus::Matcher::BePrime.new
end

it 'must confirm that the instance variable is undefined' do
  expect { subject.instance_variable_defined?(:@expected) }.to equal: false
end

it 'must be prime' do
  expect { subject.matches? { 3 } }.to equal: true
end

it 'must not match the string' do
  expect { subject.matches? { 4 } }.to equal: false
end

it 'must return the raised exception' do
  expect { raise subject.matches? { BOOM } }.to raise_exception: NameError
end
