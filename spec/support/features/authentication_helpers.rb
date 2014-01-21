def signed_in
  visit root_path
  expect(page).to have_content I18n.t('layouts.application.sign_out')
end

def signed_in?
  session[:user_id].present? 
end
