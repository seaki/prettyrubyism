require "active_support/all"
require "yaml"
require "hashie"
require "prettyrubythm/version"
require "prettyrubythm/concerns/util"
require "prettyrubythm/series"
require "prettyrubythm/actor"
require "prettyrubythm/core"
require "prettyrubythm/prettyrhythm"
require "prettyrubythm/kingofprism"
require "prettyrubythm/pripara"
require "prettyrubythm/kirattoprichan"
require "prettyrubythm/errors"

module PrettyRubythm
  def self.method_missing(name, *args, &block) # rubocop:disable Style/MethodMissing
    PrettyRubythm::Core.instance.send(name, *args, &block)
  end
end

module PrettyRhythm
  def self.method_missing(name, *args, &block) # rubocop:disable Style/MethodMissing
    PrettyRubythm::Core.instance.send(name, *args, &block)
  end
end

module KingOfPrism
  def self.method_missing(name, *args, &block) # rubocop:disable Style/MethodMissing
    PrettyRubythm::Core.instance.send(name, *args, &block)
  end
end

module PriPara
  def self.method_missing(name, *args, &block) # rubocop:disable Style/MethodMissing
    PrettyRubythm::Core.instance.send(name, *args, &block)
  end
end

module KirattoPriChan
  def self.method_missing(name, *args, &block) # rubocop:disable Style/MethodMissing
    PrettyRubythm::Core.instance.send(name, *args, &block)
  end
end

PR = Rubythm = PrettyRubythm
PriChan = KirattoPriChan
