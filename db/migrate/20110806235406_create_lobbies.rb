class CreateLobbies < ActiveRecord::Migration
  def self.up
    create_table :lobbies do |t|
      t.integer :status
      t.string :data

      t.timestamps
    end
  end

  def self.down
    drop_table :lobbies
  end
end
