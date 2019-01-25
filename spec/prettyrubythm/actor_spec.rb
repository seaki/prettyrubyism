describe PrettyRubythm::Actor do
  let(:actor) do
    actor = PrettyRubythm::Actor[
      actor_name:   actor_name,
      name:         name,
      # full_name:    full_name,
      cast_name:    cast_name,
      # singer_name:  singer_name,
      # type:         type,
      # brand:        brand,
      # color:        color,
      created_date: created_date,
      birthday:     birthday,
    ]
    actor.io = mock_io
    actor
  end
  let(:mock_io) { StringIO.new }

  let(:actor_name)   { "laala" }
  let(:name)         { "真中らぁら" }
  let(:cast_name)    { "茜屋日海夏" }
  let(:created_date) { "2014-07-05" }
  let(:birthday)     { "11/20" }

  describe "#==" do
    subject { actor == other_actor }

    context "same object" do
      let(:other_actor) { actor }

      it { should be true }
    end

    context "copied object" do
      let(:other_actor) { actor.dup }

      it { should be true }
    end

    context "other actor" do
      let(:other_actor) { PrettyRubythm::Actor.find(:mirei) }

      it { should be false }
    end

    describe "#find" do
    subject { PrettyRubythm::Actor.find(actor_name) }

    let(:actor_name) { :laala }

    it { should be_an_instance_of PrettyRubythm::Actor }
    its(:name) { should == "真中らぁら" }
    its(:actor_name)    { should == "laala" }
  end
  end
end
