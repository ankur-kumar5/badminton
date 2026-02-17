class LeaderboardController < ApplicationController
  def index
    players = LeaderboardQuery.new.call
    @players = players.paginate(page: params[:page])
    @leaderboard = LeaderboardPresenter.new(@players)
  end
end
