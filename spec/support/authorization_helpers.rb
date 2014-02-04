module AuthorizationHelpers
  def expect_redirect_to_sign_in
    expect(response).to redirect_to(sign_in_path)
  end

  def expect_unauthorized_flash_message
    expect(flash[:error]).to eq(I18n.t('errors.unauthorized'))
  end
end
