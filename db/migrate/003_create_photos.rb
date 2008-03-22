class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :title
      t.text :caption
      t.integer :parent_id    
      t.integer :position
      t.integer :size
      t.string :content_type
      t.string :filename
      t.integer :height
      t.integer :width
      t.string :thumbnail
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
