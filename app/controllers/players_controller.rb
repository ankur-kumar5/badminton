class PlayersController < ApplicationController
  def index
    players = Player.includes(:won_matches, :lost_matches)
                    .order(:name)
                    .paginate(page: params[:page], per_page: 10)

    @players = players.map { |p| PlayerStats.new(p) }
    @paginated_players = players
  end

  def create
    player = Player.new(player_params)

    if player.save
      redirect_to players_path, notice: I18n.t("players.create.success")
    else
      redirect_to players_path, alert:  I18n.t("players.create.failure", error: player.errors.full_messages.to_sentence)
    end
  end

  def destroy
    player = Player.find(params[:id])
    if player.destroy
      redirect_to players_path, notice: I18n.t("players.destroy.success")
    else
      redirect_to players_path, alert: I18n.t("players.destroy.failure", error: player.errors.full_messages.to_sentence)
    end
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end
