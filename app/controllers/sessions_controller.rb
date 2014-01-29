class SessionsController < Clearance::SessionsController
  def url_after_create
    if current_user.teacher?
      teachers_dashboard_path
    else
      root_path
    end
  end
end
