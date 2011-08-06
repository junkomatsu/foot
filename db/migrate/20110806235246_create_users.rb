class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :screen_name
      t.integer :status
      t.integer :rank
      t.integer :point
      t.string :data

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
