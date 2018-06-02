class ApplicationController < ActionController::Base

  def current_user
    (current_student || current_supervisor || current_admin)
  end

  helper_method :current_user

end
