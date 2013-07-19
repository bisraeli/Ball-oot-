class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = Player.new(params[:player])
    if @player.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
    id = params[:id]
    @player = Player.find(id)
  end

  def index
    @players = Player.all
  end
end

#   def create
#     player = Player.create(firstname: params[:first_name], lastname: params[:last_name], email: params[:email], height: params[:height], weight: params[:weight])
#     redirect_to root_url, :notice => "You've signed up"
#   end
# end



