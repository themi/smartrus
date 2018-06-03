class ApplicationController < ActionController::Base

  def current_user
    (current_student || current_supervisor || current_admin)
  end

  def authenticate!
   authenticate_admin! || authenticate_supervisor! || authenticate_student!
  end

  helper_method :current_user

end
