describe KirattoPriChan do
  describe "aira" do
    subject { actor == other_actor }
    let(:actor) { KirattoPriChan.aira }

    context "is Nanahoshi Aira" do
      let(:other_actor) { PrettyRubythm::Actor.find(:nanahoshi_aira) }

      it { should be true }
    end

    context "is not Harune Aira" do
      let(:other_actor) { PrettyRubythm::Actor.find(:aira) }

      it { should be false }
    end
  end
end
