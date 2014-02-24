require 'spec_helper'

feature 'Admin manages Teachers', js: true do
  scenario 'by navigating to new Teacher page' do
    admin = create(:user, :admin)

    visit admin_dashboard_path(as: admin)

    click_link t('.layouts.admin.new_teacher')
    expect(current_path).to eq(new_admin_teacher_path)
  end

  scenario 'fill out new Teacher form' do
    admin = create(:user, :admin)

    visit new_admin_teacher_path(as: admin)
    fill_in 'First name', with: 'Timmy'
    fill_in 'Last name', with: 'Tebow'
    fill_in 'Email', with: 'timmyt4eva@example.com'
    fill_in 'Username', with: 'timmyt4eva'
    fill_in 'Password', with: 'password'
    click_button t('admin.teachers.create_teacher')
    teacher = Teacher.last

    expect(current_path).to eq(admin_teacher_path(teacher))
    expect(page).to have_content('Timmy')
    expect(page).to have_content('Tebow')
    expect(page).to have_content('timmyt4eva@example.com')
    expect(page).to have_content('timmyt4eva')
  end

  scenario 'by navigating to Teachers page' do
    admin = create(:user, :admin)

    visit admin_dashboard_path(as: admin)

    click_link t('layouts.admin.teachers')
    expect(current_path).to eq(admin_teachers_path)
  end

  scenario 'views all teachers' do
    admin = create(:user, :admin)
    create(:teacher, first_name: 'Jim', last_name: 'Jones')
    create(:teacher, first_name: 'Laura', last_name: 'Thompson')

    visit admin_teachers_path(as: admin)

    expect(page).to have_content('Jim Jones')
    expect(page).to have_content('Laura Thompson')
  end

  scenario 'filters teachers' do
    admin = create(:user, :admin)
    create(:teacher, first_name: 'Jim', last_name: 'Jones')
    create(:teacher, first_name: 'Laura', last_name: 'Thompson')
    create(:teacher, first_name: 'Jim', last_name: 'Griffin')

    visit admin_teachers_path(as: admin)

    expect(page).to have_teacher_count(3)

    fill_in t('.admin.teachers.index.search'), with: 'Jim'

    expect(page).to have_teacher_count(2)

    fill_in t('.admin.teachers.index.search'), with: 'Thompson'

    expect(page).to have_teacher_count(1)
  end

  def have_teacher_count(count)
    have_css('tr.teacher-record', count: count)
  end
end
