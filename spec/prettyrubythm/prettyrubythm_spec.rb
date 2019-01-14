require "spec_helper"

describe PrettyRubythm do
  it "has a version number" do
    expect(PrettyRubythm::VERSION).not_to be_nil
  end

  describe "PriPara." do
    where(:name) do
      [
        [:laala],
        [:mirei],
        [:sophy],
        [:sion],
        [:dorothy],
        [:reona],
        [:cosmo],
        [:chanko],
        [:falulu],
        [:aroma],
        [:mikan],
        [:garuru],
        [:shikyouin_hibiki],
        [:fuwari],
        [:ajimi],
        [:non],
        [:chiri],
        [:pepper],
        [:juri],
        [:janis],
        [:meganee],
        [:nao],
      ]
    end

    with_them do
      it { expect(PriPara.send(name)).to be_an_instance_of PrettyRubythm::Actor }
    end
  end
end
