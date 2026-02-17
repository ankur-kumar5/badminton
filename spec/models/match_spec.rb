require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'associations' do
    it { should belong_to(:winner).class_name('Player') }
    it { should belong_to(:loser).class_name('Player') }
  end

  describe 'validations' do
    let(:player) { create(:player) }

    it 'is valid when winner and loser are different players' do
      winner = create(:player)
      loser  = create(:player)

      match = Match.new(winner: winner, loser: loser)

      expect(match).to be_valid
    end

    it 'is invalid when winner and loser are the same player' do
      match = Match.new(winner: player, loser: player)

      expect(match).not_to be_valid
      expect(match.errors[:base]).to include(I18n.t("matches.different_player"))
    end
  end
end
