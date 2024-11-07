Rails.application.routes.draw do

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  get("/", { :controller => "game", :action => "homepage" })
  
  get("/join", { :controller => "game", :action => "join" })
  get("/new", { :controller => "game", :action => "create" })
  
  # get "/your_first_screen" => "pages#first"
  
end
