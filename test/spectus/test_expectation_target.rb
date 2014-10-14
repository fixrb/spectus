require_relative 'helper_test'

subject "expectation target" do
  Spectus::ExpectationTarget.new { 42 }
end

it 'must confirm that the block is defined' do
  expect { subject.instance_variable_defined?(:@actual) }.to equal: true
end

it 'must responds to :to' do
  expect { subject.respond_to? :to }.to equal: true
end

it 'must responds to :not_to' do
  expect { subject.respond_to? :not_to }.not_to equal: false
end
