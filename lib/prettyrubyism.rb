require "active_support/all"
require "yaml"
require "hashie"
require "prettyrubyism/version"
require "prettyrubyism/concerns/util"
require "prettyrubyism/series"
require "prettyrubyism/actors"
require "prettyrubyism/core"
require "prettyrubyism/pripara"
require "prettyrubyism/kirattoprichan"

module PrettyRubyism
  def self.method_missing(name, *args, &block) # rubocop:disable Style/MethodMissing
    PrettyRubyism::Core.instance.send(name, *args, &block)
  end
end

module PrettyRhythm
  def self.method_missing(name, *args, &block) # rubocop:disable Style/MethodMissing
    PrettyRubyism::Core.instance.send(name, *args, &block)
  end
end

module KingOfPrism
  def self.method_missing(name, *args, &block) # rubocop:disable Style/MethodMissing
    PrettyRubyism::Core.instance.send(name, *args, &block)
  end
end

module PriPara
  def self.method_missing(name, *args, &block) # rubocop:disable Style/MethodMissing
    PrettyRubyism::Core.instance.send(name, *args, &block)
  end
end

module KirattoPriChan
  def self.method_missing(name, *args, &block) # rubocop:disable Style/MethodMissing
    PrettyRubyism::Core.instance.send(name, *args, &block)
  end
end

PR = Rubyism = PrettyRubyism
