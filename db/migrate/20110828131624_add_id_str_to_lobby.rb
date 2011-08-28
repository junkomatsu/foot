class AddIdStrToLobby < ActiveRecord::Migration
  def self.up
    add_column :lobbies, :id_str, :string
  end

  def self.down
    remove_column :lobbies, :id_str
  end
end
