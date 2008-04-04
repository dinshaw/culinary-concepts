class CreateConcepts < ActiveRecord::Migration
  def self.up
    create_table :concepts do |t|
      t.string :title
      t.string :slug      
      t.text :quote
      t.text :body
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :concepts
  end
end
