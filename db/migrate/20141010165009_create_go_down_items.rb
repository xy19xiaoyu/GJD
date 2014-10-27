class CreateGoDownItems < ActiveRecord::Migration
  def change
    create_table :go_down_items do |t|
      t.integer :Order_id
      t.integer :GoDowinId
      t.integer :Item_id
      t.date :CreateTime
      t.integer :ShelfLife
      t.integer :Sum
      t.string :BatchId
      t.string :MadeIn
      t.date :InTime
      t.string :Execer
      t.string :State

      t.timestamps
    end
  end
end
