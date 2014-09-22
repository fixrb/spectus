require_relative 'helper_test'

subject 'capture standard error built-in matcher' do
  Spectus::Matcher::CaptureStderr.new "foo\n"
end

it 'must return the expected value' do
  expect { subject.instance_variable_get(:@expected) }.to eql: "foo\n"
end

it 'must match the captured standard error' do
  expect { subject.matches? { warn 'foo' } }.to equal: true
end

it 'must not match the captured standard error' do
  expect { subject.matches? { warn 'bar' } }.to equal: false
end

it 'must return the raised exception' do
  expect { raise subject.matches? { BOOM } }.to raise_exception: NameError
end
