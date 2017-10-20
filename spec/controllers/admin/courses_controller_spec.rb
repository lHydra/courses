require 'rails_helper'

RSpec.describe Admin::CoursesController, type: :controller do
  let(:course) { create(:course) }
  let(:student) { create(:student) }
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

  describe 'GET #edit' do
    before { get :edit, params: { id: course } }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'assigns the requested course to @course' do
      expect(assigns(:course)).to eq(course)
    end

    it 'assigns the requested users to @users' do
      expect(assigns(:users)).to match_array(User.all)
    end

    it 'assigns the requested roles to @roles' do
      expect(assigns(:roles)).to match_array(Role.all)
    end

    it 'render edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'PUT #update' do
    it 'adds course to student' do
      put :update, params: { id: course, user: student.id }

      expect(student.courses.first).to eq(course)
    end

    it 'adds course to all student group' do
      student1 = User.create(email: 'test@mail.ru', password: 'qwerty', password_confirmation: 'qwerty')
      student2 = User.create(email: 'test2@mail.ru', password: 'qwerty', password_confirmation: 'qwerty')
      student1.add_role :student
      student2.add_role :student

      put :update, params: { id: course, groups: student1.roles.first.id }

      expect(student1.courses.first).to eq(course)
      expect(student2.courses.first).to eq(course)
    end

    it 'redirects to admin page' do
      put :update, params: { id: course, user: student.id }

      expect(response).to redirect_to admin_courses_path
    end
  end
end
