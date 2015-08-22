class AddMicropostTypeToMicropost < ActiveRecord::Migration
  def change
    add_column(:microposts, :micropost_type, :string, :default => "tweet")
  end
end
