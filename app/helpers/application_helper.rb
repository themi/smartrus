module ApplicationHelper

  def flash_class(level)
    case level.to_sym
      when :notice then "info"
      when :success then "success"
      when :error then "danger"
      when :alert then "warning"
    end
  end

  def current_avatar(size=32)
    return "".html_safe if current_user.nil?
    if (link = current_user.gravatar_url(size: size))
      image_tag(link, class: "rounded-circle img-responsive")
    else
      current_user.to_s
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

  def current_user_menu
    if current_admin
      "/admins/menu"
    elsif current_supervisor
      "/supervisors/menu"
    elsif current_student
      "/students/menu"
    end
  end

end
