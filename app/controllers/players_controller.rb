class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    id = params[:id]
    @player = Player.find(id)
  end

  def new
  end

  def create
    player = Player.create(firstname: params[:first_name], lastname: params[:last_name], email: params[:email], height: params[:height], weight: params[:weight])
    redirect_to player_path(player)
  end
end