require_relative 'helper_test'

subject 'domain-specific language' do
  Spectus::DSL
end

it 'must return DSL methods' do
  expect { [:expect] == subject.instance_methods(false) }.to equal: true
end
