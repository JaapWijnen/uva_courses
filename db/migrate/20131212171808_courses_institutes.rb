class CoursesInstitutes < ActiveRecord::Migration
  def change
  	create_table :courses_institutes, id: false do |t|
  	  t.integer :course_id
  	  t.integer :institute_id
  	end
  end
end
