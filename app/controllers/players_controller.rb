class PlayersController < ApplicationController
  def index
    @players = Player.all.map { |p| PlayerStats.new(p) }
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
    player.destroy
    redirect_to players_path
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end
