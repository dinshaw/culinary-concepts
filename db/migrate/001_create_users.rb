class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      t.column :activation_code, :string, :limit => 40
      t.column :activated_at, :datetime
      t.column :password_reset_code, :string
      t.column :state, :string, :null => :no, :default => 'passive'
      t.column :deleted_at, :datetime
    end
    execute "INSERT into users (email, crypted_password, salt, activated_at, state) values ('info@dinshawdesign.com', '1dd361037e0c84a46f5f9d5f0cb5fd029c72d432', 'd8b58c297a86cc62f7a2a507c65012adc7645ad9',now(),'active');"
    
  end

  def self.down
    drop_table "users"
  end
end
