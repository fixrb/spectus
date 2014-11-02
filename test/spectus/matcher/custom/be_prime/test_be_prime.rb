require_relative 'helper_test'

subject 'be prime custom matcher' do
  Spectus::Matcher::BePrime.new
end

it 'must be prime' do
  expect { subject.matches? { 3 } }.to equal: true
end

it 'must not match the string' do
  expect { subject.matches? { 4 } }.not_to equal: true
end

it 'must return false' do
  expect { subject.matches? { 4 } }.to equal: false
end

it 'must return the raised exception' do
  expect { fail subject.matches? { BOOM } }.to raise_exception: NameError
end
