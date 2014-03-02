class ListsController < ApplicationController
	before_action :signed_in_user

  def create
  	# check route from which user is coming
  	if params[:listtype] == 'shopping_cart_items'
  		# create shopping cart list item containing chosen course and redirect to 
  		# course page
	    addToList!(params[:id], ListItem.shopping_cart)
	    redirect_to controller: 'browse_courses', 
	    			action: 'show', 
	    			type: 'courses', 
	    			id: params[:id]
	  elsif params[:listtype] == 'currently_taking_items'
	  	# for all items in the shopping cart create a currently_taking list item 
	  	# destroy all old shopping cart items and redirect to currently taking 
	  	# items list
	  	current_user.list_items.where(
	  						list_type: ListItem.shopping_cart).each do |item|
	  		addToList!(item.course.id, ListItem.currently_taking)
	  		removeFromList!(item.course.id, ListItem.shopping_cart)
	  	end
	  	redirect_to user_path(current_user.id, tab: 'current')
	  end
  end

	def destroy
		# check route from which user is coming
		if params[:listtype] == 'shopping_cart_items'
			# destroy shopping cart item and redirect to the show course page
			removeFromList!(params[:id], ListItem.shopping_cart)
			redirect_to controller: 'browse_courses', 
						action: 'show', 
						type: 'courses', 
						id: params[:id]
		# when user is not deleting a shoppingcart item through an ajax request
		elsif params[:listtype] == 'shopping_cart_items_noj'
			# destroy shopping cart item and redirect to shopping cart list
			removeFromList!(params[:id], ListItem.shopping_cart)
			redirect_to user_path(current_user.id, tab: 'shop')
		elsif params[:listtype] == 'currently_taking_items'
			# destroy currently taking item and redirect to currently taking list
			removeFromList!(params[:id], ListItem.currently_taking)
			redirect_to user_path(current_user.id, tab: 'current')
		end
	end
end
