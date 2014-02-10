class GuardianInvitationMailer < ActionMailer::Base
  default from: 'from@example.com'

  def invite(invitation)
    @invitation = invitation
    @url = new_invitation_sign_up_url(invitation.token)
    mail(
      to: invitation.guardian_email,
      subject: 'Claim your Student on SWOTBot',
    )
  end
end
