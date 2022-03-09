require '../classes/corrector'

describe Corrector do
  context "When testing the Corrector class" do

    it "The correct_name method should return a correct name" do
      corrector = Corrector.new
      expect(corrector.correct_name("kero")).to eq "Kero"
    end

    it "The correct_name method should return a correct name" do
      corrector = Corrector.new
      expect(corrector.correct_name("kerosamygrace")).to eq "Kerosamygr"
    end

  end 
end