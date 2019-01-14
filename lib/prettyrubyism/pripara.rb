module PriPara
  [:pripara, :idoltime_pripara].each do |series_name|
    PrettyRubyism::Series.find(series_name).actors.map do |actor|
      actor_name = actor.actor_name.to_sym
      define_singleton_method actor_name do
        PrettyRubyism::Actors.find(actor_name)
      end
    end
  end
end
