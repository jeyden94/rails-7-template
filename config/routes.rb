Rails.application.routes.draw do

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  get("/", { :controller => "game", :action => "homepage" })
  
  get("/join", { :controller => "game", :action => "join" })
  

  # get "/your_first_screen" => "pages#first"
  
# Route for the 'new game' page
  get("/new", { :controller => "game", :action => "new" })

  # Route for handling the form submission (create a new game)
  post("/games", { :controller => "game", :action => "create" })

  # Route for showing a specific game
  get("/games/:id", { :controller => "game", :action => "show" })


  resources :games, only: [:new, :create, :show]
end
