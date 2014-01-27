require 'spec_helper'

describe Admin::CoursesController do
  context 'when not logged in as an admin' do
    {
      post: :create,
      get: :edit,
      delete: :destroy,
      put: :update
    }.each do |http_verb, action|
      describe "#{http_verb.upcase} #{action}" do
        it 'redirects to the sign_in_path' do
          course = create(:course)
          send(http_verb, action, id: course)
          expect_redirect_to_sign_in
        end

        it 'displays a flash error message' do
          course = create(:course)
          send(http_verb, action, id: course)
          expect_admin_unauthorized_flash_message
        end
      end
    end

    [:index, :new].each do |action|
      describe "GET #{action}" do
        it 'redirects to the sign_in_path' do
          get action
          expect_redirect_to_sign_in
        end

        it 'displays a flash error message' do
          get action
          expect_admin_unauthorized_flash_message
        end
      end
    end

    def expect_redirect_to_sign_in
      expect(response).to redirect_to(sign_in_path)
    end

    def expect_admin_unauthorized_flash_message
      expect(flash[:error]).to eq(I18n.t('errors.admin.unauthorized'))
    end
  end
end
