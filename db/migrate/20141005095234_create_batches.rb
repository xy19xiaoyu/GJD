class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :Batchid
      t.string :Date

      t.timestamps
    end
  end
end
