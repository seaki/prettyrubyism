module KirattoPriChan
  [:kiratto_prichan].each do |series_name|
    PrettyRubythm::Series.find(series_name).actors.map do |actor|
      actor_name = actor.actor_name.to_sym
      define_singleton_method actor_name do
        PrettyRubythm::Actor.find(actor_name)
      end
    end
  end

  define_singleton_method :aira do
    PrettyRubythm::Actor.find(:nanahoshi_aira)
  end
end
