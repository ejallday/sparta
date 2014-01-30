require 'spec_helper'

feature 'Guardian views guardian dashboard' do
  scenario 'by logging in as guardian' do
    guardian = create(:guardian)
    visit sign_in_path
    within_form(:session) do |f|
      f.fill_in_text_fields(
        email: guardian.email,
        password: guardian.password
      )
      f.submit('session.submit')
    end

    expect(current_path).to eq(guardians_dashboard_path)
  end
end
