module Admin
  class AdminController < ApplicationController
    layout 'admin'
    before_filter :authorize_admin

    private

    def authorize_admin
      unless current_user && current_user.admin?
        flash[:error] = I18n.t('errors.unauthorized')
        redirect_to sign_in_path
      end
    end
  end
end
