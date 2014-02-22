class SearchController < ApplicationController
	def index
		@search_sgid = 			Course.basic_search(sgid: params[:q])
		@search_staff = 		Staff.basic_search(name: params[:q])

		if @search_sgid.empty? && @search_staff.empty?
			search_title = 			Course.basic_search(name: params[:q])
			search_description = 	Course.basic_search(description: params[:q])
			
			@search_general = 		search_title + search_description
			@search_general.uniq!
		end
	end
end