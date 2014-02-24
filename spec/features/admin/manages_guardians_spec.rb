require 'spec_helper'

feature 'Admin manages Guardians', js: true do
  scenario 'views all Guardians' do
    admin = create(:user, :admin)
    create(:guardian, first_name: 'Jim', last_name: 'Jones')
    create(:guardian, first_name: 'Laura', last_name: 'Thompson')

    visit admin_guardians_path(as: admin)

    expect(page).to have_content('Jim Jones')
    expect(page).to have_content('Laura Thompson')
  end
end
