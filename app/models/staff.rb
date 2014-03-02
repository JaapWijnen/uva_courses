class Staff < ActiveRecord::Base
  has_and_belongs_to_many :courses

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  # define search function and make sure it is not case sensitive
  def self.search(search)
  	if search
    	where('UPPER(name) LIKE UPPER(?)', "%#{search}%")
  	else
			scoped
  	end
	end

  # set textacular gem search language to dutch
	def self.searchable_language
  	'dutch'
	end
end
