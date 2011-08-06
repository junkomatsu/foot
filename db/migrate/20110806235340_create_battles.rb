class CreateBattles < ActiveRecord::Migration
  def self.up
    create_table :battles do |t|
      t.integer :user_id1
      t.integer :user_id2
      t.integer :status
      t.string :data

      t.timestamps
    end
  end

  def self.down
    drop_table :battles
  end
end
