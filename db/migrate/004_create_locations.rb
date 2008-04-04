class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :title
      t.integer :parent_id
      t.integer :position
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
