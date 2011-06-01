class AddEmailSelectedCodeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :email_selected_code, :boolean
  end

  def self.down
    remove_column :users, :email_selected_code
  end
end
