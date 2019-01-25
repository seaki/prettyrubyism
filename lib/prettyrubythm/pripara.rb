module PriPara
  [:pripara, :idoltime_pripara].each do |series_name|
    PrettyRubythm::Series.find(series_name).actors.map do |actor|
      actor_name = actor.actor_name.to_sym
      define_singleton_method actor_name do
        PrettyRubythm::Actor.find(actor_name)
      end
    end
  end

  define_singleton_method :hibiki do
    PrettyRubythm::Actor.find(:shikyouin_hibiki)
  end

  define_singleton_method :mia do
    PrettyRubythm::Actor.find(:hanazono_mia)
  end
end
