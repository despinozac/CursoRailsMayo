class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_action :auth! 

  def current_user
    User.find(session[:user])
  end

  def auth!
    unless session[:user]
      redirect_to new_session_path, notice: "Debe estar logeado"
    end
  end
end
