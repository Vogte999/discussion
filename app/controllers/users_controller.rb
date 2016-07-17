class UsersController < ApplicationController
  def show
  end
  def new
  end
  def create
    mail = user_params[:email].downcase()
    if (mail.include? "@") && (mail.include? ".") && (mail.length >= 6) && (user_params[:name].length > 2) && (user_params[:password].lenth > 6)
      @user = User.new(user_params)
      @user.save!
    else
      redirect_to "/users/new"
    end
  end
  def edit
  end
  def update
  end
  def destroy
  end

  private def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
