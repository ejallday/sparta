require 'spec_helper'

feature 'Teacher views teacher dashboard' do
  scenario 'by logging in as a teacher' do
    teacher = create(:teacher)
    visit sign_in_path
    fill_in 'session_email', with: teacher.email
    fill_in 'session_password', with: teacher.password
    click_button t('.helpers.submit.session.submit')

    expect(current_path).to eq(teachers_dashboard_path)
  end
end
