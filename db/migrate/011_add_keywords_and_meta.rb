class AddKeywordsAndMeta < ActiveRecord::Migration
  def self.up
    add_column :pages, :meta_description, :text
    add_column :pages, :meta_keywords, :text
    add_column :concepts, :meta_description, :text
    add_column :concepts, :meta_keywords, :text
  end

  def self.down
    remove_column :pages, :meta_description
    remove_column :pages, :meta_keywords
    remove_column :concepts, :meta_description
    remove_column :concepts, :meta_keywords
  end
end
