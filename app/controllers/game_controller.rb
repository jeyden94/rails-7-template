class GameController < ApplicationController
  def homepage
    render({ :template => "layouts/homepage"})
  end

  def join
    render({ :template => "launch/join"})
  end

  def create
    render({ :template => "launch/new"})
  end

end
