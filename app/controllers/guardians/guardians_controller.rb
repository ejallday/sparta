module Guardians
  class GuardiansController < ApplicationController
    before_filter :authorize_guardian

    private

    def authorize_guardian
      unless current_user && current_user.guardian?
        flash[:error] = I18n.t('errors.unauthorized')
        redirect_to sign_in_path
      end
    end
  end
end
