module Guardians
  class DashboardsController < ApplicationController
    layout 'guardian'
    helper_method :guardian
    helper_method :students

    def show
    end

    private

    def guardian
      @guardian ||= Guardian.find_by(user_id: current_user.id)
    end

    def students
       guardian.students
    end
  end
end
