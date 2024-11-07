class GameController < ApplicationController
  def homepage
    render({ :template => "layouts/homepage"})
  end
end
