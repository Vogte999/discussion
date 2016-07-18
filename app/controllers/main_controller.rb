class MainController < ApplicationController
  def index
    if session[:id]
      @name = User.find(session[:id]).name
    else
      @name = "Guest"
    end
  end
end
