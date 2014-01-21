class Course < ActiveRecord::Base
  has_and_belongs_to_many :institutes
  has_and_belongs_to_many :staffs
  has_and_belongs_to_many :programmes

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def self.search(search)
  	if search
    	where('UPPER(name) LIKE UPPER(?)', "%#{search}%")
  	else
			scoped
  	end
	end
end
