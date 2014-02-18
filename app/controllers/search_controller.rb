class SearchController < ApplicationController
	def index
		@search_result = Course.basic_search(params[:search])
	end
end
