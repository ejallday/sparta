class InvitationsController < ApplicationController
  helper_method :invitation

  def new
    @invitation = Invitation.new
  end

  def create
    if invite_guardian.call(new_invitation_params)
      flash[:notice] = "#{I18n.t('invitations.sent')} for #{invite_guardian.student_name} to #{invite_guardian.guardian_email}"
      redirect_to admin_dashboard_path
    else
      render 'new'
    end
  end

  private

  def new_invitation_params
    params.require(:invitation).permit(:student_id, :guardian_email, :token)
  end

  def invitation
    @invitation ||= Invitation.find(params[:id])
  end

  def invite_guardian
    @invite_guardian ||= InviteGuardian.new
  end
end
