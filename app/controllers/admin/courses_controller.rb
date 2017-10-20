module Admin
  class CoursesController < ApplicationController
    load_and_authorize_resource
    before_action :find_course, except: [:index]

    def index
      @courses = Course.all
    end

    def edit
      @users = User.all
      @roles = Role.all
    end

    def update
      if params[:groups].present?
        role = Role.find(params[:groups]).name
        users = User.with_role(role)
        users.each { |u| u.courses.push(@course) unless u.courses.include?(@course) }
      end

      if params[:user].present?
        user = User.find(params[:user])
        user.courses.push @course unless user.courses.include?(@course)
      end

      redirect_to admin_courses_path, notice: 'Course was successfully add!'
    end

    private

    def find_course
      @course = Course.find(params[:id])
    end
  end
end
