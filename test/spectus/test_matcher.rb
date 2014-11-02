require_relative 'helper_test'

subject 'matcher module' do
  Spectus::Matcher
end

it 'must return true after the evaluation' do
  expect { subject.pass?(false, eql: 'foo') { 'foo' } }.to equal: true
end

it 'must return false after the evaluation' do
  expect { subject.pass?(false, eql: 'foo') { 'bar' } }.to equal: false
end

it 'must raise a name error exception' do
  expect { subject.pass?(false, eql: 'foo') { BOOM } }
    .to raise_exception: NameError
end

it 'must return the class of a matcher from its symbol' do
  expect { subject.get(:eql).equal? subject.const_get(:Eql) }.to equal: true
end

it 'must raise a name error exception' do
  expect { subject.get(:foo).equal? subject.const_get(:Foo) }
    .to raise_exception: NameError
end

it 'must no longer raise' do
  module Spectus
    module Matcher
      class Foo
      end
    end
  end

  expect { subject.get(:foo).equal? subject.const_get(:Foo) }.to equal: true
end
