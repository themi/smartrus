class ApplicationController < ActionController::Base
  # include Pundit
  protect_from_forgery

  def current_user
    (current_student || current_supervisor || current_admin)
  end

  def authenticate!
   authenticate_admin! || authenticate_supervisor! || authenticate_student!
  end

  helper_method :current_user

end
