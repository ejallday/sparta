class InvitationSignUpsController < ApplicationController
  helper_method :invitation

  def new
    @user = User.new(email: invitation.guardian_email)
  end

  def create
    if guardian_transaction
      sign_in @user
      redirect_to guardians_dashboard_path
    else
      render new
    end
  end

  private

  delegate :student, to: :invitation

  def guardian_transaction
    ActiveRecord::Base.transaction do
      @user = create_user!
      guardian = create_guardian!(@user)
      create_guardianship!(guardian)
    end
  end

  def create_user!
    User.create!(user_params)
  end

  def create_guardian!(user)
    Guardian.create!(user_id: user.id)
  end

  def create_guardianship!(guardian)
    Guardianship.create!(guardian_id: guardian.id, student_id: student.id)
  end

  def invitation
    @invitation ||= Invitation.find_by!(token: params[:invitation_id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end
end
