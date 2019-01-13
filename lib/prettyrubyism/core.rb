module PrettyRubyism
  require "singleton"

  # generic methods
  class Core
    include Singleton
    include Enumerable
    include PrettyRubyism::Concerns::Util

    PrettyRubyism::Series.names.each do |series_name|
      define_method series_name do
        PrettyRubyism::Series.find(series_name)
      end
    end

    def method_missing(name, *args)
      super
    end

  end
end
