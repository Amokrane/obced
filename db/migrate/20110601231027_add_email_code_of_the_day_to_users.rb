class AddEmailCodeOfTheDayToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :email_code_of_the_day, :boolean
  end

  def self.down
    remove_column :users, :email_code_of_the_day
  end
end
