class SessionsController < ApplicationController

  def new
  end

  def create
    user = user_params
    User.all.each do |userD|
      if (userD.authenticate(user_params[:password])) && (userD.email.eql? user_params[:email])
        session[:id] = userD.id
        redirect_to '/' and return
      end
    end
    redirect_to '/sessions/new' and return
  end

  private def user_params
    params.require(:user).permit(:email, :password)
  end
end
