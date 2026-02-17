class LeaderboardQuery
  def initialize(scope = Player.all)
    @scope = scope
  end

  def call
    @scope
      .left_joins(:won_matches)
      .select("players.*, COUNT(matches.id) AS wins_count")
      .group("players.id")
      .order("wins_count DESC")
  end
end
