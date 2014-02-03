require 'spec_helper'

describe Teachers::CoursesController do
  context 'when not logged in as a Teacher' do
    describe 'GET#index' do
      it 'redirects to sign_in_path' do
        get :index
        expect(response).to redirect_to(sign_in_path)
      end

      it 'displays flash error message' do
        get :index
        expect(flash[:error]).to eq(I18n.t('errors.teacher.unauthorized'))
      end
    end

    describe 'GET#show' do
      it 'redirects to sign_in_path' do
        course = create(:course)
        get :show, id: course.id
        expect(response).to redirect_to(sign_in_path)
      end

      it 'displays flash error message' do
        course = create(:course)
        get :show, id: course.id
        expect(flash[:error]).to eq(I18n.t('errors.teacher.unauthorized'))
      end
    end
  end
end
