require 'spec_helper'

describe Teachers::AssignmentsController do
  context 'when not logged in as a Teacher' do
    describe 'GET#new' do
      it 'redirects to sign_in_path' do
        get :new
        expect(response).to redirect_to(sign_in_path)
      end

      it 'displays flash error message' do
        get :new
        expect(flash[:error]).to eq(I18n.t('errors.teacher.unauthorized'))
      end
    end
  end
end
