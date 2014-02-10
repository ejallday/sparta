  require 'spec_helper'

feature 'Guardian signs up' do
  scenario 'by navigating to the invitation sign up page' do
    student = create(:student, first_name: 'Lil', last_name: 'T')
    invitation = create(:invitation, student: student, guardian_email: 'therealmrt@example.com')

    visit new_invitation_sign_up_path(invitation)
    fill_in :user_first_name, with: 'Mr'
    fill_in :user_last_name, with: 'T'
    fill_in :user_username, with: 'therealmrt'
    fill_in :user_password, with: 'password'
    click_button t('invitations.sign_up')

    expect(current_path).to eq(guardians_dashboard_path)
    expect(page).to have_content('Lil T')
    expect(page).to have_content('Mr T')
  end
end
