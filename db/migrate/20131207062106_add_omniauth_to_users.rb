class AddOmniauthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string, :null => false, :default => ""
    add_column :users, :uid, :string, :null => false, :default => ""
    add_column :users, :nickname, :string, :null => false, :default => ""
    add_column :users, :name, :string, :null => false, :default => ""
    add_column :users, :first_name, :string, :null => false, :default => ""
    add_column :users, :last_name, :string, :null => false, :default => ""
    add_column :users, :image, :string, :null => false, :default => ""
    add_column :users, :urls, :string, :null => false, :default => ""
    add_column :users, :location, :string, :null => false, :default => ""
    add_column :users, :verified, :string, :null => false, :default => ""
    add_column :users, :token, :string, :null => false, :default => ""
    add_column :users, :expires_at, :datetime, :null => false, :default => ""
    add_column :users, :expires, :string, :null => false, :default => ""
    add_column :users, :gender, :string, :null => false, :default => ""
    add_column :users, :timezone, :string, :null => false, :default => ""
    add_column :users, :locale, :string, :null => false, :default => ""
    add_column :users, :hometown, :string, :null => false, :default => ""
  end
end
