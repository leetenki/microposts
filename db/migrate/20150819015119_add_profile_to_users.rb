class AddProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile, :text, :default => ""
  end
end
