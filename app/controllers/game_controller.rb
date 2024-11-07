class GameController < ApplicationController

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
  @game = Game.new(
    game_status: 0, # Initial status is 'pending'
    max_players: params[:query_player_count].to_i
  )

  if @game.save
    @game.players.create(player_name: "Player 1", is_bot: false)

    params[:query_bot_count].to_i.times do |i|
      @game.players.create(player_name: "Bot #{i + 1}", is_bot: true)
    end

    available_slots = @game.max_players - @game.players.count
    redirect_to @game, notice: "Game created successfully. Share this key: #{@game.game_password}. There are #{available_slots} open slots for human players."
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
  
  if request.post?
    puts "Form submitted with key: #{params[:query_key]}" # Check if the parameter is received
    # Rest of your logic...
  else
    render({ template: 'launch/join' }) # Render the form for GET requests
  end
  @game_key = params[:query_key]

  if @game_key.present?
    @game = Game.find_by(game_password: @game_key)

    if @game
      current_human_players = @game.players.where(is_bot: false).count
      available_human_slots = @game.max_players - @game.players.count

      if current_human_players < available_human_slots
        @player = @game.players.create(player_name: "Player #{current_human_players + 1}")
        session[:player_id] = @player.id
        session[:game_id] = @game.id

        # Redirect to the game session view
        redirect_to @game, notice: 'You have successfully joined the game!'
      else
        flash.now[:alert] = 'This game has reached its player limit for human players.'
        render({ template: 'launch/join' }) # Re-render join page if full
      end
    else
      flash.now[:alert] = 'Invalid game key. Please try again.'
      render({ template: 'launch/join' }) # Re-render join page if the game key is invalid
    end
  else
    render({ template: 'launch/join' }) # Re-render join page if no key is provided
  end
end




#------------------------------
# Action to add bots if there are less than 5 players

def add_bots(game)
  while game.players.count < game.max_players
    game.players.create(player_name: "Bot #{game.players.count + 1}", is_bot: true)
  end
end



end
