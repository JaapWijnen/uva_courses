class CreateShoppingCartItems < ActiveRecord::Migration
  def change
    create_table :shopping_cart_items do |t|

    	t.integer :user_id
    	t.integer :course_id

      t.timestamps
    end
    add_index :shopping_cart_items, :user_id
    add_index :shopping_cart_items, :course_id
    add_index :shopping_cart_items, [:user_id, :course_id], unique: true
  end
end
