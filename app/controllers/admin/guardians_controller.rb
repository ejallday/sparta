module Admin
  class GuardiansController < AdminController
    helper_method :guardians

    def index
      guardians
    end

    private

    def guardians
      @guardians ||= Guardian.includes(:user)
    end
  end
end
