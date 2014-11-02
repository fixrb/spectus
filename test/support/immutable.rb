# Default root of all Ruby objects, implementing #freeze method.
class Object
  alias_method :overridden_initialize, :initialize

  def initialize
    overridden_initialize

    freeze if !self.class.ancestors.include?(
      SimpleCov::Formatter::MultiFormatter) && !self.class.ancestors.include?(
      SimpleCov::Formatter::HTMLFormatter)
  end
end
