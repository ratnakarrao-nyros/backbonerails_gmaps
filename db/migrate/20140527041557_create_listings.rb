class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :owner
      t.integer :rent
      t.string :contact
      t.string :location

      t.timestamps
    end
  end
end
