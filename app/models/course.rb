class Course < ActiveRecord::Base
  has_and_belongs_to_many :institutes
  has_and_belongs_to_many :staffs
  has_and_belongs_to_many :programmes

  has_many :list_items
  has_many :users, through: :list_items

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def self.search(search)
    # define search function and make sure it is not case sensitive
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
