class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.integer :CategoryId
      t.string :CategoryName
      t.string :Name

      t.timestamps
    end
  end
end
