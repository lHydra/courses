require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:course) { create(:course) }
  let(:admin) { create(:admin) }

  before do
    sign_in(admin)
  end

  describe 'GET #index' do
    let!(:courses) { create_list(:course, 2) }
    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the requested courses to @courses' do
      expect(assigns(:courses)).to match_array(courses)
    end
  end

  describe 'GET #show' do
    before { get :show, params: {id: course } }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the requested course to @course' do
      expect(assigns(:course)).to eq(course)
    end

    it 'render show template' do
      expect(response).to render_template :show
    end
  end
end
