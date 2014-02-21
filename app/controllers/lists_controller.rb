class ListsController < ApplicationController
	before_action :signed_in_user

  def create
  	if params[:listtype] == 'shopping_cart_items'
	    addToList!(params[:id], ListItem.shopping_cart)
	    redirect_to controller: 'browse_courses', action: 'show', type: 'courses', id: params[:id]
	  elsif params[:listtype] == 'currently_taking_items'
	  	current_user.list_items.where(list_type: ListItem.shopping_cart).each do |item|
	  		addToList!(item.course.id, ListItem.currently_taking)
	  		removeFromList!(item.course.id, ListItem.shopping_cart)
	  	end
	  	redirect_to user_path(current_user.id, tab: 'current')
	  end
  end

	def destroy
		if params[:listtype] == 'shopping_cart_items'
			removeFromList!(params[:id], ListItem.shopping_cart)
			redirect_to controller: 'browse_courses', action: 'show', type: 'courses', id: params[:id]
		elsif params[:listtype] == 'shopping_cart_items_noj'
			removeFromList!(params[:id], ListItem.shopping_cart)
			redirect_to user_path(current_user.id, tab: 'shop')
		elsif params[:listtype] == 'currently_taking_items'
			removeFromList!(params[:id], ListItem.currently_taking)
			redirect_to user_path(current_user.id, tab: 'current')
		end
	end
end
