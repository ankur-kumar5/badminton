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
     @player.won_matches.size
  end

  def losses
    @player.respond_to?(:losses_count) ? @player.losses_count : @player.lost_matches.size
  end
end
