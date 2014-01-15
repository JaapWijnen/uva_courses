class BrowseCoursesController < ApplicationController
	def index
		if params[:type] == 'courses'
			@browse_courses = Course.paginate(page: params[:page]).order(:name)
		elsif params[:type] == 'institutes'
			@browse_courses = Institute.paginate(page: params[:page]).order(:name)
		elsif params[:type] == 'programmes'
			@browse_courses = Programme.paginate(page: params[:page]).order(:name)
		elsif params[:type] == 'staff'
			@browse_courses = Staff.paginate(page: params[:page]).order(:name)
		end
	end

	def show
		if params[:type] == 'courses'
			@course = Course.find_by(id: params[:id])
			@institutes = @course.institutes.order(:name)
			@programmes = @course.programmes.order(:name)
			@staff = @course.staffs.order(:name)
		elsif params[:type] == 'institutes'
			@institute = Institute.find_by(id: params[:id])
		elsif params[:type] == 'programmes'
			@programme = Programme.find_by(id: params[:id])
		elsif params[:type] == 'staff'
			@staff = Staff.find_by(id: params[:id])
		end
	end
end
