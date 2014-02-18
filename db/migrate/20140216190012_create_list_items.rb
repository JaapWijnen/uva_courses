class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :list_type

      t.timestamps
    end
    add_index :list_items, :user_id
    add_index :list_items, :course_id
    add_index :list_items, [:user_id, :course_id, :list_type], unique: true
  end
end
