class AddTitleToManagers < ActiveRecord::Migration
  def self.up
    add_column :managers, :title, :string
  end

  def self.down
    remove_column :managers, :title
  end
end
