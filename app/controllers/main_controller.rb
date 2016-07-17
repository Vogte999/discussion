class MainController < ApplicationController
  before_filter :authorize
  def index
    @name = User.find(session[:id]).name
  end
end
