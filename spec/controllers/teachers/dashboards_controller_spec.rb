require 'spec_helper'

describe Teachers::DashboardsController do
  context 'when not logged in as a Teacher' do
    describe 'GET#show' do
      it 'redirects to the sign_in_path' do
        get :show
        expect(response).to redirect_to(sign_in_path)
      end

      it 'displays flash error message' do
        get :show
        expect(flash[:error]).to eq(I18n.t('errors.teacher.unauthorized'))
      end
    end
  end
end
