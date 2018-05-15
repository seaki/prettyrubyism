describe PrettyRubyism::Series do
  let(:series_names) do
    [
      :aurora_dream,
      :dear_my_future,
      :rainbow_live,
      :by_prettyrhythm,
      :pride_the_hero,
      :pripara,
      :idoltime_pripara,
      :kiratto_prichan,
    ]
  end

  describe "#names" do
    subject { PrettyRubyism::Series.names }

    it { should include(*series_names) }
  end

end
