class SessionsController < Clearance::SessionsController
  def url_after_create
    case
      when current_user.admin? then admin_dashboard_path
      when current_user.teacher? then teachers_dashboard_path
      when current_user.student? then students_dashboard_path
      when current_user.guardian? then guardians_dashboard_path
    else
      root_path
    end
  end
end
