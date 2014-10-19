class Object
  alias_method :overridden_initialize, :initialize

  def initialize
    overridden_initialize

    if  !self.class.ancestors.include?(SimpleCov::Formatter::MultiFormatter) &&
        !self.class.ancestors.include?(SimpleCov::Formatter::HTMLFormatter)
      freeze
    end
  end
end
