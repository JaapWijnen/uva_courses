class CoursesProgrammes < ActiveRecord::Migration
  def change
  	create_table :courses_programmes, id: false do |t|
  	  t.integer :course_id
  	  t.integer :programme_id
  	end
  end
end
