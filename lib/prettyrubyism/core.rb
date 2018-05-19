module PrettyRubyism
  require "singleton"

  # generic methods
  class Core
    include Singleton
    include Enumerable

    def method_missing(name, *args)
      super
    end

  end
end
