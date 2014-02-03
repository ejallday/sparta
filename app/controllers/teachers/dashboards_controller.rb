class Teachers::DashboardsController < ApplicationController
  before_filter :authorize_teacher
  helper_method :teacher
  helper_method :courses

  def show
  end

  private


  def teacher
    @teacher ||= Teacher.includes(:courses).find_by(user_id: current_user.id)
  end

  def courses
    @courses ||= teacher.courses
  end

  def authorize_teacher
    unless current_user && current_user.teacher?
      flash[:error] = I18n.t('errors.teacher.unauthorized')
      redirect_to sign_in_path
    end
  end
end
