class Course < ActiveRecord::Base
  has_and_belongs_to_many :institutes
  has_and_belongs_to_many :staffs
  has_and_belongs_to_many :programmes
end
