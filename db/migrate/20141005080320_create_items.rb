class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :ItemId
      t.string :Name
      t.integer :CategoryId
      t.string :CategoryName
      t.integer :subCategoryid
      t.string :subCategoryName
      t.string :Type

      t.timestamps
    end
  end
end
