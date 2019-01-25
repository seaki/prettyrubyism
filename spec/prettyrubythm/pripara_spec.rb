describe PriPara do
  describe "mia" do
    subject { actor == other_actor }
    let(:actor) { PriPara.mia }

    context "is Hanazono Mia" do
      let(:other_actor) { PrettyRubythm::Actor.find(:hanazono_mia) }

      it { should be true }
    end

    context "is not Ageha Mia" do
      let(:other_actor) { PrettyRubythm::Actor.find(:mia) }

      it { should be false }
    end
  end

  describe "hibiki" do
    subject { actor == other_actor }
    let(:actor) { PriPara.hibiki }

    context "is Shikyouin Hibiki" do
      let(:other_actor) { PrettyRubythm::Actor.find(:shikyouin_hibiki) }

      it { should be true }
    end

    context "is not Hibiki from Aurora Dream" do
      let(:other_actor) { PrettyRubythm::Actor.find(:hibiki) }

      it { should be false }
    end
  end
end
