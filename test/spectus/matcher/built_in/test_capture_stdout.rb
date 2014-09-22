require_relative 'helper_test'

subject 'capture standard output built-in matcher' do
  Spectus::Matcher::CaptureStdout.new "foo\n"
end

it 'must return the expected value' do
  expect { subject.instance_variable_get(:@expected) }.to eql: "foo\n"
end

it 'must match the captured standard output' do
  expect { subject.matches? { puts 'foo' } }.to equal: true
end

it 'must not match the captured standard output' do
  expect { subject.matches? { puts 'bar' } }.to equal: false
end

it 'must return the raised exception' do
  expect { raise subject.matches? { BOOM } }.to raise_exception: NameError
end
