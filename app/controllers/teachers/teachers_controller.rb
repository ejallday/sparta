module Teachers
  class TeachersController < ApplicationController
    before_filter :authorize_teacher

    private

    def authorize_teacher
      unless current_user && current_user.teacher?
        flash[:error] = I18n.t('errors.unauthorized')
        redirect_to sign_in_path
      end
    end
  end
end
