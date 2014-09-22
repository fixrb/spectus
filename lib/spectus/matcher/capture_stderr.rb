require 'stringio'

module Spectus
  module Matcher

    # @api private
    # Provides the implementation for `capture_stderr`.
    class CaptureStderr

      # @api private
      def initialize expected
        @expected = expected

        freeze
      end

      # @return [Boolean] Comparison between actual and expected values.
      def matches?
        begin
          orig_std  = $stderr
          $stderr   = StringIO.new

          yield
          $stderr.string.eql? @expected
        ensure
          $stderr   = orig_std
        end
      end
    end
  end
end
