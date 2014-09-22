require_relative 'helper_test'

subject 'equal built-in matcher' do
  Spectus::Matcher::Equal.new :foo
end

it 'must return the expected value' do
  expect { subject.instance_variable_get(:@expected) }.to equal: :foo
end

it 'must be equal' do
  expect { subject.matches? { :foo } }.to equal: true
end

it 'must not be equal' do
  expect { subject.matches? { :bar } }.to equal: false
end

it 'must return the raised exception' do
  expect { raise subject.matches? { BOOM } }.to raise_exception: NameError
end
