module PrettyRubythm
  require "singleton"

  # generic methods
  class Core
    include Singleton
    include Enumerable
    include PrettyRubythm::Concerns::Util

    PrettyRubythm::Series.names.each do |series_name|
      define_method series_name do
        PrettyRubythm::Series.find(series_name)
      end
    end

    def method_missing(name, *args)
      super
    end

    # Get all actors
    #
    # @param [Time,Date] arg Time, Date or date like String (ex. "2013-12-16")
    #
    # @return [Array<PrettyRubythm::Actors>] all actors
    #
    # @example
    #   PrettyRubythm.all_actors.count
    #   PrettyRubythm.all_actors.map(&:actor_name)
    #   # returns current actor count and names
    #
    #   PrettyRubythm.all_actors("2013-10-26").count
    #   #=> (オーロラドリーム、ディアマイフューチャー、レインボーライブの途中)
    #
    #   PrettyRubythm.all_actors.include?(PriPara.falulu)
    #   #=> true
    def all_actors(arg = Time.current)
      date = to_date(arg)

      unless @all_actors
        @all_actors = []
        PrettyRubythm::Actors.names.each do |actor_name|
          @all_actors << PrettyRubythm::Actors.find(actor_name)
        end
      end

      @all_actors.select {|actor| actor.created_date && actor.created_date <= date }
    end

    alias_method :all, :all_actors

  end
end
