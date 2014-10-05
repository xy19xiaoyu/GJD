class CreateGoDowns < ActiveRecord::Migration
  def change
    create_table :go_downs do |t|
      t.string :GoDownId
      t.string :Name
      t.string :Address
      t.string :Admin
      t.string :Tel

      t.timestamps
    end
  end
end
