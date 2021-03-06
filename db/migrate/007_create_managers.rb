class CreateManagers < ActiveRecord::Migration
  def self.up
    create_table :managers do |t|
      t.string :name
      t.text :body
      t.integer :location_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :managers
  end
end
