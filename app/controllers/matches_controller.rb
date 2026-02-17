class MatchesController < ApplicationController
  def index
    @matches = Match.includes(:winner, :loser)
                    .order(created_at: :desc)
                    .paginate(page: params[:page])
  end

  def create
    result = Matches::CreateMatch.new(
      winner_id: params[:match][:winner_id],
      loser_id: params[:match][:loser_id]
    ).call

    if result.success?
      redirect_to matches_path, notice: I18n.t("matches.recorded.success")
    else
      redirect_to matches_path, alert: I18n.t("matches.recorded.failure", error: result.errors.to_sentence)
    end
  end
end
