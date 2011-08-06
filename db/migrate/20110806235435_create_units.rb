class CreateUnits < ActiveRecord::Migration
  def self.up
    create_table :units do |t|
      t.integer :user_id
      t.integer :status
      t.string :icon
      t.string :data

      t.timestamps
    end
  end

  def self.down
    drop_table :units
  end
end
