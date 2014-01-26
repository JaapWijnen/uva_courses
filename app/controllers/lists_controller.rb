class ListsController < ApplicationController
	before_action :signed_in_user

  def create
  	if params[:listtype] == "shopping_cart_items"
	    addToList!(params[:course_id], current_user.shopping_cart_items)
	    respond_to do |format|
	      format.html { redirect_to controller: 'browse_courses', action: 'show', type: 'courses', id: params[:course_id] }
	      format.js
	    end
	  elsif params[:listtype] == "currently_taking_items"
	  	current_user.shopping_cart_items.each do |item|
	  		addToList!(item.course.id, current_user.currently_taking_items)
	  		removeFromList!(item.course.id, current_user.shopping_cart_items)
	  	end
	  	redirect_to user_path(current_user.id, tab: 'current')
	  end
  end

  def destroy
	  if params[:listtype == "shopping_cart_items"]  
	    removeFromList!(params[:course_id], current_user.shopping_cart_items)
	    respond_to do |format|
	      format.html { redirect_to controller: 'browse_courses', action: 'show', type: 'courses', id: params[:course_id] }
	      format.js
	    end
	  elsif params[:listtype] == "currently_taking_items"
	  	removeFromList!(params[:course_id], current_user.currently_taking_items)
	  	redirect_to user_path(current_user.id, tab: 'current')
	  end
  end
end
