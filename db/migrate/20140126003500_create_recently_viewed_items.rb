class CreateRecentlyViewedItems < ActiveRecord::Migration
  def change
    create_table :recently_viewed_items do |t|

    	t.integer :user_id
    	t.integer :course_id

      t.timestamps
    end
    add_index :recently_viewed_items, :user_id
    add_index :recently_viewed_items, :course_id
    add_index :recently_viewed_items, [:user_id, :course_id], unique: true
	end
end
