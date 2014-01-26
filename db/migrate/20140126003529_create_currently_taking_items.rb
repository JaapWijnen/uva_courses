class CreateCurrentlyTakingItems < ActiveRecord::Migration
  def change
    create_table :currently_taking_items do |t|

    	t.integer :user_id
    	t.integer :course_id

      t.timestamps
    end
    add_index :currently_taking_items, :user_id
    add_index :currently_taking_items, :course_id
    add_index :currently_taking_items, [:user_id, :course_id], unique: true

  end
end
