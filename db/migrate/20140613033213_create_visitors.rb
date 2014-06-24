class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :name
      t.date :start
      t.date :end
      t.string :place

      t.timestamps
    end
  end
end
