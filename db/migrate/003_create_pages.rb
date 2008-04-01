class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
    
    # create base pages
    execute "INSERT into pages (title) values ('Home');"
    execute "INSERT into pages (title) values ('About Us');"
    execute "INSERT into pages (title) values ('Contact Us');"
    execute "INSERT into pages (title) values ('Jean-Georges');"
    execute "INSERT into pages (title) values ('Careers');"            
  end

  def self.down
    drop_table :pages
  end
end
