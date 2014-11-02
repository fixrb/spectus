require_relative 'helper_test'

subject 'equal built-in matcher' do
  Spectus::Matcher::Equal.new :foo
end

it 'must be equal' do
  expect { subject.matches? { :foo } }.to equal: true
end

it 'must not be equal' do
  expect { subject.matches? { :bar } }.not_to equal: true
end

it 'must return false' do
  expect { subject.matches? { :bar } }.to equal: false
end

it 'must return the raised exception' do
  expect { fail subject.matches? { BOOM } }.to raise_exception: NameError
end
