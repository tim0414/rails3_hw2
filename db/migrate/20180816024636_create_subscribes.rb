class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.references :owner
      t.references :subscriber
      t.string :nickname

      t.timestamps
    end
    add_index :subscribes, :owner_id
    add_index :subscribes, :subscriber_id
  end
end
