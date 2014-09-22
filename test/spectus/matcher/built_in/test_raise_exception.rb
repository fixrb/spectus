require_relative 'helper_test'

subject 'raise exception built-in matcher' do
  Spectus::Matcher::RaiseException.new ZeroDivisionError
end

it 'must return the expected value' do
  expect { subject.instance_variable_get(:@expected) }.to equal: ZeroDivisionError
end

it 'must raise the expected exception' do
  expect { subject.matches? { 0 / 0 } }.to equal: true
end

it 'must not raise any exceptions' do
  expect { subject.matches? { :foo } }.to equal: false
end

it 'must return the raised exception' do
  expect { raise subject.matches? { BOOM } }.to raise_exception: NameError
end
