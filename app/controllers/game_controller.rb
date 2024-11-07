class GamesController < ApplicationController
  
  #------------------------------
  # Actions to open the app and launch into a new or existing game

  def homepage
    render({ :template => "layouts/homepage"})
  end

  def join
    render({ :template => "launch/join"})
  end

  def new
    render({ :template => "launch/new"})
  end

  #------------------------------
  # Actions to create or join games

  def create
    @game = Game.new(game_password: params[:query_password], game_status: 0) # Initial status is 'pending'
    if @game.save
      redirect_to @game, notice: 'Game created successfully. Share the password to invite others!'
    else
      flash.now[:alert] = 'Failed to create the game. Please try again.'
      render :new
    end
  end
  
  def show
    @game = Game.find(params[:id])
    # Logic to display the game and its current players
    render({ :template => "play/show"})
  end

  def join
    @game_password = params[:query_password]

    if @game_password.present?
      @game = Game.find_by(game_password: @game_password)

      if @game
        if @game.players.count < 3
          @player = @game.players.create(player_name: "Player #{(@game.players.count + 1)}") # Replace with actual player input if available
          redirect_to @game, notice: 'You have successfully joined the game!'
        else
          flash.now[:alert] = 'This game already has the maximum number of players.'
          render :join
        end
      else
        flash.now[:alert] = 'Invalid game password. Please try again.'
        render :join
      end
    else
      render :join
    end
  end

end
  
