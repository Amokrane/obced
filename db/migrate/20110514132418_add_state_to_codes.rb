class AddStateToCodes < ActiveRecord::Migration
  def self.up
    add_column :codes, :state, :string
  end

  def self.down
    remove_column :codes, :state
  end
end
