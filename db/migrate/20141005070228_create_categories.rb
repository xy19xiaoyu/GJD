class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :Name
      t.string :Type
      t.integer :Parentid

      t.timestamps
    end
  end
end
