module KirattoPriChan
  PrettyRubyism::Actors.names.each do |actor_name|
    define_singleton_method actor_name do
      PrettyRubyism::Actors.find(actor_name)
    end
  end
end
