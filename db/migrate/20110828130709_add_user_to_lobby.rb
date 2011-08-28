class AddUserToLobby < ActiveRecord::Migration
  def self.up
    add_column :lobbies, :user_id, :id
  end

  def self.down
    remove_column :lobbies, :user_id
  end
end
