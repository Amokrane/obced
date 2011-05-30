class AddSelectedAtToCode < ActiveRecord::Migration
  def self.up
    add_column :codes, :selected_at, :datetime
  end

  def self.down
    remove_column :codes, :selected_at
  end
end
