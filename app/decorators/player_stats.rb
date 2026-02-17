class PlayerStats
  def initialize(player)
    @player = player
  end

  def id
    @player.id
  end

  def name
    @player.name
  end

  def wins
    @player.respond_to?(:wins_count) ? @player.wins_count : @player.won_matches.count
  end

  def losses
    @player.respond_to?(:losses_count) ? @player.losses_count : @player.lost_matches.count
  end

  def win_percentage
    return 0 if total_matches.zero?
    (wins.to_f / total_matches * 100).round(2)
  end

  private

  def total_matches
    wins + losses
  end
end
