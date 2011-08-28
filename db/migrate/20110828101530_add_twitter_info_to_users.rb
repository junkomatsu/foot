class AddTwitterInfoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :icon_url, :string
    add_column :users, :twitter_access_token, :string
    add_column :users, :twitter_access_token_secret, :string
  end

  def self.down
    remove_column :users, :twitter_access_token_secret
    remove_column :users, :twitter_access_token
    remove_column :users, :icon_url
  end
end
