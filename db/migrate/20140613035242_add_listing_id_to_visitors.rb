class AddListingIdToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :listing_id, :integer
  end
end
