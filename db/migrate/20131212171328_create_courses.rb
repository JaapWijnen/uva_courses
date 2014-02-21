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
    execute "
    create index on courses using gin(to_tsvector('dutch', sgid));
    create index on courses using gin(to_tsvector('dutch', name));
    create index on courses using gin(to_tsvector('dutch', description));"
  end
end
