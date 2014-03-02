class SearchController < ApplicationController
	def index
		# search courses through studiegids id
		@search_sgid = 			Course.basic_search(sgid: params[:q])

		# search courses through connected staff members
		@search_staff = 		Staff.basic_search(name: params[:q])

		# when no sgid or staff members are found within given search query search
		# through title and description
		if @search_sgid.empty? && @search_staff.empty?
			search_title = 			Course.basic_search(name: params[:q])
			search_description = 	Course.basic_search(description: params[:q])
			
			# make sure results found by both queries don't show twice
			@search_general = 		search_title + search_description
			@search_general.uniq!
		end
	end
end