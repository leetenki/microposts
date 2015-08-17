class AddCountryStateToUser < ActiveRecord::Migration
  def change
    add_column(:users, :country_code, :string, :default => "JP")
    add_column(:users, :state_code, :string, :default => "13")
  end
end
