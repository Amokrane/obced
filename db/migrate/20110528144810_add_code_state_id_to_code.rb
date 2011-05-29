class AddCodeStateIdToCode < ActiveRecord::Migration
  def self.up
    add_column :codes, :code_state_id, :integer
  end

  def self.down
    remove_column :codes, :code_state_id
  end
end
