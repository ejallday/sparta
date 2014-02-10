require 'spec_helper'

feature 'Admin invites Guardian to become Guardian of Student' do
  scenario 'by sending an invitation' do
    admin = create(:user, :admin)
    student = create(:student, first_name: 'Tom', last_name: 'Jones')

    visit admin_dashboard_path(as: admin)
    click_link t('admin.dashboards.invite_guardian')
    select student.full_name, from: :invitation_student_id
    fill_in :invitation_guardian_email, with: 'eric@example.com'
    click_button t('invitations.send_invitation')

    expect(page).to have_content('Invitation sent for Tom Jones to eric@example.com')
    expect(current_path).to eq(admin_dashboard_path)
    expect(last_email_sent).to deliver_to('eric@example.com')
    expect(last_email_sent).to have_body_text('Click here to follow your student on the SWOTBot')
  end
end
