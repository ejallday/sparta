require 'spec_helper'

feature 'User signs up' do 
  scenario 'by navigating to the page' do 
    visit sign_in_path
    click_link I18n.t('sessions.form.sign_up')

    expect(current_path).to eq(sign_up_path)
  end

  scenario 'with valid attributes' do
    visit sign_up_path
    fill_in 'user_first_name', with: 'John'
    fill_in 'user_last_name', with: 'Doe'
    fill_in 'user_username', with: 'username1'
    fill_in 'user_email', with: 'username1@example.com'
    fill_in 'user_password', with: 'password'

    click_button I18n.t('helpers.submit.user.create')
    expect(User.count).to eq(1)
  end

  scenario 'with invalid username' do
    visit sign_up_path
    fill_in 'user_first_name', with: 'John'
    fill_in 'user_last_name', with: 'Doe'
    fill_in 'user_username', with: 'jd'
    fill_in 'user_email', with: 'username1@example.com'
    fill_in 'user_password', with: 'password'
    
    click_button I18n.t('helpers.submit.user.create')
    expect(page).to have_content('Sign in')
  end
end
