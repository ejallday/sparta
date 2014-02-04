module Students
  class StudentsController < ApplicationController
    before_filter :authorize_student

    private

    def authorize_student
      unless current_user && current_user.student?
        flash[:error] = I18n.t('errors.unauthorized')
        redirect_to sign_in_path
      end
    end
  end
end
