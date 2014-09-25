require 'stringio'

module Spectus
  module Matcher

    # Provides the implementation for `capture_stdout`.
    class CaptureStdout
      def initialize expected
        @expected = expected

        freeze
      end

      # @return [Boolean] Comparison between actual and expected values.
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
