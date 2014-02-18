class ListItem < ActiveRecord::Base
	belongs_to :course
	belongs_to :user

	def self.recently_viewed
		1
	end
	def self.currently_taking
		2
	end
	def self.shopping_cart
		3
	end
end
