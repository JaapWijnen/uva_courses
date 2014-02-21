class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
    execute "create index on staffs using gin(to_tsvector('dutch', name));"
  end
end
