require_relative 'helper_test'

subject "reported success" do
  Spectus::Reporter.new true, :foo, 42, true
end

it 'must return nil as the is no exceptions' do
  expect { subject.exception }.to equal: nil
end

it 'must pass' do
  expect { subject.pass? }.to equal: true
end

it 'must be a negative assertion' do
  expect { subject.negated }.to equal: true
end

it 'must be foo matcher' do
  expect { subject.matcher }.to equal: :foo
end

it 'must expect 42' do
  expect { subject.expected }.to equal: 42
end

it 'must return a state' do
  expect { subject.state }.to equal: :success
end

it 'must return a char' do
  expect { subject.to_s }.to eql: '.'
end

subject "reported error" do
  Spectus::Reporter.new false, :foo, 4, :BOOM
end

it 'must return the cached exception' do
  expect { subject.exception }.to equal: :BOOM
end

it 'wont pass' do
  expect { subject.pass? }.to equal: false
end

it 'must be a positive assertion' do
  expect { subject.negated }.to equal: false
end

it 'must be foo matcher' do
  expect { subject.matcher }.to equal: :foo
end

it 'must expect 4' do
  expect { subject.expected }.to equal: 4
end

it 'must return a state' do
  expect { subject.state }.to equal: :error
end

it 'must return a char' do
  expect { subject.to_s }.to eql: 'E'
end

subject "reported failure" do
  Spectus::Reporter.new false, :foo, 9, false
end

it 'must return nil as the is no exceptions' do
  expect { subject.exception }.to equal: nil
end

it 'wont pass' do
  expect { subject.pass? }.to equal: false
end

it 'must be a positive assertion' do
  expect { subject.negated }.to equal: false
end

it 'must be foo matcher' do
  expect { subject.matcher }.to equal: :foo
end

it 'must expect 9' do
  expect { subject.expected }.to equal: 9
end

it 'must return a state' do
  expect { subject.state }.to equal: :failure
end

it 'must return a char' do
  expect { subject.to_s }.to eql: 'F'
end
