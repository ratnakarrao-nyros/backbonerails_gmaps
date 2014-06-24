class AddStateAndCountryToListings < ActiveRecord::Migration
  def change
    add_column :listings, :state, :string
    add_column :listings, :country, :string
  end
end
