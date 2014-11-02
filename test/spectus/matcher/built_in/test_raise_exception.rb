require_relative 'helper_test'

subject 'raise exception built-in matcher' do
  Spectus::Matcher::RaiseException.new ZeroDivisionError
end

it 'must raise the expected exception' do
  expect { subject.matches? { 0 / 0 } }.to equal: true
end

it 'must not raise any exceptions' do
  expect { subject.matches? { :foo } }.not_to equal: true
end

it 'must return false' do
  expect { subject.matches? { :foo } }.to equal: false
end

it 'must return the raised exception' do
  expect { fail subject.matches? { BOOM } }.to raise_exception: NameError
end
