require_relative 'helper_test'

subject "matcher module" do
  Spectus::Matcher
end

it 'must return true after the evaluation' do
  expect { subject.eval(false, eql: 'foo') { 'foo' } }.to equal: true
end

it 'must return false after the evaluation' do
  expect { subject.eval(false, eql: 'foo') { 'bar' } }.to equal: false
end

it 'must return an exception after the evaluation' do
  expect { subject.eval(false, eql: 'foo') { BOOM }.class }.to equal: NameError
end

it 'must return the class of a matcher from its symbol' do
  expect { subject.get(:eql).equal? subject.const_get(:Eql) }.to equal: true
end

it 'must raise: uninitialized constant Foo' do
  expect { subject.get(:foo).equal? subject.const_get(:Foo) }.
    to raise_exception: NameError
end

it 'must no longer raise' do
  module Spectus
    module Matcher
      class Foo
        # def matches?
        #   true
        # end
      end
    end
  end

  expect { subject.get(:foo).equal? subject.const_get(:Foo) }.to equal: true
end
