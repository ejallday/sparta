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

  scenario 'filters guardians' do
    admin = create(:user, :admin)
    create(:guardian, first_name: 'Jim', last_name: 'Jones')
    create(:guardian, first_name: 'Laura', last_name: 'Thompson')
    create(:guardian, first_name: 'Jim', last_name: 'Griffin')

    visit admin_guardians_path(as: admin)

    expect(page).to have_guardian_count(3)

    fill_in t('.admin.guardians.index.search'), with: 'Jim'

    expect(page).to have_guardian_count(2)

    fill_in t('.admin.guardians.index.search'), with: 'Thompson'

    expect(page).to have_guardian_count(1)
  end

  def have_guardian_count(count)
    have_css('tr.guardian-record', count: count)
  end
end
