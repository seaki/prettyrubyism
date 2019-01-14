module PrettyRubyism
  require "sengiri_yaml"

  class Actors < Hash # rubocop:disable Metrics/ClassLength
    include Hashie::Extensions::MethodAccess

    ATTRIBUTES = [
      :actor_name,
      :name,
      :full_name,
      :cast_name,
      :singer_name,
      :type,
      :brand,
      :color,
      :created_date,
      :birthday,
    ].freeze

    attr_accessor :io

    # @return [Boolean]
    def ==(other)
      other.is_a?(self.class) && self.name == other.name
    end

    # Whether `date` is his/her birthday
    #
    # @param date [Date]
    #
    # @return [Boolean]
    #
    # @example
    #   PrismStar.koji.birthday?(Date.parse("")) # TODO: yearがはっきりしないのでどうにかこうにかする
    #   #=> true
    def birthday?(date = Date.today)
      return false unless have_birthday?

      # NOTE: birthday is "mm/dd"
      month, day = birthday.split("/")

      birthday_date = Date.new(date.year, month.to_i, day.to_i)

      birthday_date == date
    end

    # Whether (s)he has birthday
    #
    # @return [Boolean]
    #
    # @example
    #   Cure.peace.have_birthday?
    #   #=> false
    #
    #   Cure.twinkle.has_birthday?
    #   #=> true
    def have_birthday? # rubocop:disable Naming/PredicateName
      has_key?(:birthday)
    end
    alias_method :has_birthday?, :have_birthday?

    class << self
      # @param actor_name [Symbol]
      # @return [PrettyRubyism::Actors]
      def find(actor_name)
        raise "unknown actor: #{actor_name}" unless valid?(actor_name)

        @cache ||= {}
        unless @cache[actor_name]
          actor_config = config[actor_name] || {}
          @cache[actor_name] = PrettyRubyism::Actors[actor_config].tap {|actor| actor.io = $stdout }
        end

        @cache[actor_name]
      end

      # @return [Array<Symbol>]
      def names
        config.keys
      end

      # @return [Array<Symbol>]
      def uniq_names
        config.each_with_object([]) do |(name, actor), uniq_names|
          uniq_names << name unless uniq_names.any? {|uniq_name| config[uniq_name][:actor_name] == actor[:actor_name] }
        end
      end

      # @return [Hash] content of config/actors/*.yml
      def config
        unless @config
          @config = SengiriYaml.load_dir("#{File.dirname(__FILE__)}/../../config/actors").deep_symbolize_keys
        end
        @config
      end

      # @return [Hash] content of config/precure.yml
      def reload_config!
        @cache = {}
        @config = nil
        @colors = nil
        config
      end

      # @param [Symbol] actor_name
      def valid?(actor_name)
        names.include?(actor_name)
      end
    end
  end
end
