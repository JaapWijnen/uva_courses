class CoursesStaffs < ActiveRecord::Migration
  def change
  	create_table :courses_staffs, id: false do |t|
  	  t.integer :course_id
  	  t.integer :staff_id
  	end
  end
end
