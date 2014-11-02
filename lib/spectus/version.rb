require 'pathname'

# Namespace for the Spectus library.
module Spectus
  # Gem version
  VERSION = File.open(
    Pathname.new(__FILE__).join '..', '..', '..', 'VERSION.semver'
  ).read.chomp.to_sym
end
