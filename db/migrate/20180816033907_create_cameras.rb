class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :cameras, :user_id
  end
end
