class ApplicationController < ActionController::Base

  def current_username
    if current_student || current_supervisor || current_admin
      (current_student || current_supervisor || current_admin).email
    else
      t('.sign_out', default: 'Sign Out')
    end
  end

  def logout_current_user_link
    if current_admin
      destroy_admin_session_path
    elsif current_supervisor
      destroy_supervisor_session_path
    elsif current_student
      destroy_student_session_path
    end
  end

  helper_method :current_username, :logout_current_user_link

end
