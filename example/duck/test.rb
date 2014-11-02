#!/usr/bin/env ruby -w

require_relative 'app'

require_relative '../../lib/spectus'

extend Spectus::DSL

# Let's define the custom matcher `capture_stdout`.
require 'stringio'
module Spectus
  module Matcher
    # Provides a way to assert that the has emitted content to either $stdout.
    class CaptureStdout
      def initialize(expected)
        @expected = expected
      end

      def matches?
        begin
          orig_std  = $stdout
          $stdout   = StringIO.new
          yield
          $stdout.string.eql? @expected
        ensure
          $stdout   = orig_std
        end
      end
    end
  end
end

expectation_1 = expect { @bird.walks  }.to eql: 'Klop klop!'
expectation_2 = expect { @bird.swims  }.to eql: 'Swoosh...'
expectation_3 = expect { @bird.quacks }.to capture_stdout: "Quaaaaaack!\n"
expectation_4 = expect { @bird.speaks }.to raise_exception: NoMethodError

case (expectation_1 == true &&
      expectation_2 == true &&
      expectation_3 == true &&
      expectation_4 == true)
when true then puts "I call that #{@bird} a duck."
else abort 'WAT?'
end
