class Staff < ActiveRecord::Base
  has_and_belongs_to_many :courses

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
