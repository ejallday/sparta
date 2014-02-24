module Admin
  class GuardiansController < AdminController
    helper_method :guardians
    respond_to :html, :json

    def index
      respond_with guardians
    end

    private

    def guardians
      @guardians ||= Guardian.includes(:user)
    end
  end
end
