class UsersController < ApplicationController
  def show
    if session[:id]
      @user = User.find(session[:id])
    else
      redirect_to "/users/new"
    end
  end
  def new
  end
  def create
    mail = user_params[:email].downcase()
    if (mail.include? "@") && (mail.include? ".") && (mail.length >= 6) && (user_params[:name].length > 2) && (user_params[:password].length > 6)
      user = User.new(user_params)
      user.save!
      session[:id] = user.id
      redirect_to "/"
    else
      redirect_to "/users/new"
    end
  rescue
    redirect_to "/users/new"
  end
  def edit
  end
  def update
    mail = user_params[:email].downcase()
    if (mail.include? "@") && (mail.include? ".") && (mail.length >= 6) && (user_params[:name].length > 2) && (user_params[:password].length > 6)
      user = User.find(session[:id])
      user.name = user_params[:name]
      user.email = user_params[:email]
      user.password = user_params[:password]
      user.save!
      redirect_to "/"
    else
      redirect_to "/users/#{session[:id]}/edit"
    end
  end
  def destroy
    user = User.find(session[:id])
    user.destroy!
    session[:id] = nil
    redirect_to "/"
  end

  private def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
