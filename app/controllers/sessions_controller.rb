class SessionsController < ApplicationController
  def new
  end

  def create
    #The following returns t/f
    player = Player.autheticate(params[:email], params[:password])
    if player
      #This is if login worked
      #Stores the user_id in a cookie!!

      session[:player_id] = player.id
      redirect_to root_url, notice: "Logged in!!"
    else
      #This is if login didn't work
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
end
