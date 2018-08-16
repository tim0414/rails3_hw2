class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.references :camera
      t.references :subscribe

      t.timestamps
    end
    add_index :shares, :camera_id
    add_index :shares, :subscribe_id
  end
end
