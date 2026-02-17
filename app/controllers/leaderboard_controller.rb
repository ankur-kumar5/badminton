class LeaderboardController < ApplicationController
  def index
    players = LeaderboardQuery.new.call
    @players = players.paginate(page: params[:page], per_page: 10)
    @leaderboard = LeaderboardPresenter.new(@players)
  end
end
