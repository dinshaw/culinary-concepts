class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table "roles" do |t|
      t.column :name, :string
    end
    
    # generate the join table
    create_table "roles_users", :id => false do |t|
      t.column "role_id", :integer
      t.column "user_id", :integer
    end
    add_index "roles_users", "role_id"
    add_index "roles_users", "user_id"
    
    # adminize first user
    execute "INSERT into roles (name) values ('name');"
    execute "INSERT into roles_users (user_id, role_id) values ('1','1');"
  end

  def self.down
    drop_table "roles"
    drop_table "roles_users"
  end
end