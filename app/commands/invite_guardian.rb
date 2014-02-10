class InviteGuardian
  delegate :guardian_email, to: :invitation

  def call(params)
    if save_invitation(params)
      send_invitation
    end
  end

  def student_name
    invitation.student_name
  end

  private

  def save_invitation(params)
    invitation.update_attributes(params)
  end

  def send_invitation
    GuardianInvitationMailer.invite(invitation).deliver
  end

  def invitation
    @invitation ||= Invitation.new
  end
end
