describe PrettyRubythm::Series do
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

  describe '#actors' do
    subject { series.actors }

    let(:series) do
      PrettyRubythm::Series[
        actors: %w[
          laala
          mirei
          sophy
          sion
          dorothy
          reona
          cosmo
          chanko
          falulu
          aroma
          mikan
          garuru
          shikyouin_hibiki
          fuwari
          ajimi
          non
          chiri
          pepper
          juri
          janis
          meganee
          nao
        ]
      ]
    end

    it { should have_exactly(22).actors }
    it { should all(be_instance_of PrettyRubythm::Actor) }
  end

  describe "#===" do
    let(:series) { PrettyRubythm::Series.find(series_name) }
    let(:series_name) { :pripara }
    let(:actor) { PrettyRubythm::Actor.find(actor_name) }
    let(:actor_name) { :mirei }

    context "same series" do
      it { expect(series === series).to be true }
      it { expect(series === actor).to be true }
    end

    context "other series" do
      let(:other_series) { PrettyRubythm::Series.find(:kiratto_prichan) }
      let(:other_actor) { PrettyRubythm::Actor.find(:mirai) }

      it { expect(series === other_series).to be false }
      it { expect(series === other_actor).to be false }
    end

    context "other ruby object" do
      it { expect(series === Module).to be false }
      it { expect(series === Object.new).to be false }
      it { expect(series === :smile).to be false }
      it { expect(series === true).to be false }
      it { expect(series === nil).to be false }
    end
  end

  describe "#names" do
    subject { PrettyRubythm::Series.names }

    it { should include(*series_names) }
  end

  describe "#uniq_names" do
    subject { PrettyRubythm::Series.uniq_names }

    it { should include(*series_names) }
    its(:count) { should == series_names.count }
  end

  describe "#find" do
    subject { PrettyRubythm::Series.find(series_name) }

    context "when exists" do
      let(:series_name) { :pripara }

      its(:title) { should == "プリパラ" }
      its(:actors) { should have_exactly(22).actors }
      its(:series_name) { should eq series_name.to_s }
    end

    context "when not exists" do
      let(:series_name) { :smile_precure }

      it { expect { subject }.to raise_error PrettyRubythm::UnknownSeriesError }
    end
  end

  describe "#each" do
    subject { series.each }

    let(:series) { PrettyRubythm::Series.find(series_name) }
    let(:series_name) { :aurora_dream }

    it { expect {|b| series.each(&b) }.to yield_successive_args(
      PrettyRubythm::Actor,
      PrettyRubythm::Actor,
      PrettyRubythm::Actor,
      ) }
  end

  describe "#to_json" do
    subject { series.to_json }

    let(:series) { PrettyRubythm::Series.find(series_name) }
    let(:series_name) { :aurora_dream }

    let(:json) do
      <<-JSON
{\"series_name\":\"aurora_dream\",\"title\":\"オーロラドリーム\",\"started_date\":\"2011-04-09\",\"ended_date\":\"2012-03-31\",\"episodes\":51,\"actors\":[\"aira\",\"rizumu\",\"mion\"]}
      JSON
    end

    it { should eq json.squish }
  end
end
