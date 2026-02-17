class LeaderboardController < ApplicationController
  def index
    players = LeaderboardQuery.new.call
    @leaderboard = LeaderboardPresenter.new(players)
  end
end
