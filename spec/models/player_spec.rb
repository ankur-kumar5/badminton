require "rails_helper"

RSpec.describe Player, type: :model do
  describe "associations" do
    it { should have_many(:won_matches)
           .class_name("Match")
           .with_foreign_key(:winner_id)
           .dependent(:restrict_with_error) }

    it { should have_many(:lost_matches)
           .class_name("Match")
           .with_foreign_key(:loser_id)
           .dependent(:restrict_with_error) }
  end

  describe "validations" do
    subject { Player.create(name: "Ankur") }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "dependent: restrict_with_error" do
    let(:player1) { Player.create!(name: "A") }
    let(:player2) { Player.create!(name: "B") }

    before do
      Match.create!(winner: player1, loser: player2)
    end

    it "does not allow deletion if player has won matches" do
      expect(player1.destroy).to be false
      expect(player1.errors[:base]).to_not be_empty
    end

    it "does not allow deletion if player has lost matches" do
      expect(player2.destroy).to be false
      expect(player2.errors[:base]).to_not be_empty
    end
  end
end
