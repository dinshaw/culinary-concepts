class CreateMenuSections < ActiveRecord::Migration
  def self.up
    create_table :menu_sections do |t|
      t.string :title
      t.integer :position
      t.integer :concept_id

      t.timestamps
    end
  end

  def self.down
    drop_table :menu_sections
  end
end
