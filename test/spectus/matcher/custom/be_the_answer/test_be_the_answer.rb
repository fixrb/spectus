require_relative 'helper_test'

subject 'be the answer custom matcher' do
  Spectus::Matcher::BeTheAnswer.new
end

it 'must be the answer' do
  expect { subject.matches? { 42 } }.to equal: true
end

it 'must not match the string' do
  expect { subject.matches? { 'foo' } }.not_to equal: true
end

it 'must return false' do
  expect { subject.matches? { 'foo' } }.to equal: false
end

it 'must return the raised exception' do
  expect { raise subject.matches? { BOOM } }.to raise_exception: NameError
end
