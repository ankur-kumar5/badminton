class Match < ApplicationRecord
  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"

  validate :players_must_be_different

  private

  def players_must_be_different
    return unless winner_id == loser_id

    errors.add(:base, I18n.t("matches.different_player"))
  end
end
