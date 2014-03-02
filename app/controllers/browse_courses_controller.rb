class BrowseCoursesController < ApplicationController
	def index
		# check from which route user is coming to display correct information
		if params[:type] == 'courses'
			@browse_courses = Course.search(params[:search]).paginate(
											page: params[:page]).order(:name)
		elsif params[:type] == 'institutes'
			@browse_courses = Institute.search(params[:search]).paginate(
											page: params[:page]).order(:name)
		elsif params[:type] == 'programmes'
			@browse_courses = Programme.search(params[:search]).paginate(
											page: params[:page]).order(:name)
		elsif params[:type] == 'staff'
			@browse_courses = Staff.search(params[:search]).paginate(
											page: params[:page]).order(:name)
		end
	end

	def show
		# check from which route user is coming to display correct information
		if params[:type] == 'courses'
			@course = Course.find_by(id: params[:id])
			@institutes = @course.institutes.order(:name)
			@programmes = @course.programmes.order(:name)
			@staff = @course.staffs.order(:name)

			if signed_in?
				# when user is logged in add currently viewed course to recently viewed 
				# list of courses
				recently_viewed

				# let the user know if they are taking this course or not
				if !current_user.list_items.find_by(
										list_type: ListItem.currently_taking, 
										course_id: @course.id).nil?
					flash.now[:success] = 
							"You are already taking the course " + @course.name
				end
			end

		# check from which route user is coming to display correct information
		elsif params[:type] == 'institutes'
			@institute = Institute.find_by(id: params[:id])
			@browse_courses = @institute.courses.search(
					params[:search]).paginate(page: params[:page]).order(:name)
		elsif params[:type] == 'programmes'
			@programme = Programme.find_by(id: params[:id])
			@browse_courses = @programme.courses.search(
					params[:search]).paginate(page: params[:page]).order(:name)
		elsif params[:type] == 'staff'
			@staff = Staff.find_by(id: params[:id])
			@browse_courses = @staff.courses.search(
					params[:search]).paginate(page: params[:page]).order(:name)
		end
	end
end

def recently_viewed
	# check is course has already been viewed recently if not add to list
	if current_user.list_items.find_by(
									course_id: @course.id, 
									list_type: ListItem.recently_viewed).nil?
		addToList!(@course.id, ListItem.recently_viewed)
	end
	# make sure list of recently viewed courses is no longer than 10
	while current_user.list_items.where(
								list_type: ListItem.recently_viewed).count > 10
		course_id = current_user.list_items.where(
					list_type: ListItem.recently_viewed).order(
					:created_at).first.course.id
		removeFromList!(course_id, ListItem.recently_viewed)
	end
end