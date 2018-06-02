module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_admin
      flash.clear
      redirect_to(root_authenticated_admin_path) && return

    elsif current_supervisor
      flash.clear
      redirect_to(root_authenticated_supervisor_path) && return

    elsif current_student
      flash.clear
      redirect_to(root_authenticated_student_path) && return

    end
  end
end
