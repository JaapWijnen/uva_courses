class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :acode
      t.string :code
      t.string :sgid
      t.text :year
      t.integer :ects
      t.string :period
      t.text :lecture_material
      t.text :timetable
      t.text :goals
      t.text :participant_count
      t.text :specialities
      t.text :examination

      t.timestamps
    end
  end
end
