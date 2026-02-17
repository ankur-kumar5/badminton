class LeaderboardPresenter
  def initialize(players)
    @players = players
  end

  def ranked_players
    @players.each_with_index.map do |player, index|
      OpenStruct.new(
        rank: index + 1,
        name: player.name,
        wins: player.wins_count || player.won_matches.size,
        losses: player.lost_matches.size
      )
    end
  end
end
