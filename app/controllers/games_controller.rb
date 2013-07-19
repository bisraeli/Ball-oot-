class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    game_options = {challenger_id: current_user.id}.merge(params[:game])
    @game = Game.new(game_options)
    success = @game.save
    if success
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def show
    id = params[:id]
    @game = Game.find(id)
  end
end
