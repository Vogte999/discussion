module ApplicationHelper
  require 'digest/md5'

  def avatar
    if session[:id]
      user = User.find(session[:id])
      mail = user.email.downcase().strip()
      code = Digest::MD5.hexdigest(mail)
      return "https://www.gravatar.com/avatar/#{code}?s=30"
    end
  end

  def login
    if session[:id]
      return "<a class=\"mdl-navigation__link\" href=\"/users/show\"><img src =\"#{avatar}\"></img>My account</a>"
    else
      return "<a class=\"mdl-navigation__link\" href=\"/sessions/new\">Log in</a>"
    end
  end

  def signup
    if session[:id]
      return "<a class = \"mdl-navigation__link\" data-method=\"delete\" href=\"/sessions/#{session[:id]}\">log out</a>"
    else
      return "<a class=\"mdl-navigation__link\" href=\"/users/new\">Sign up</a>"
    end
  end

end
