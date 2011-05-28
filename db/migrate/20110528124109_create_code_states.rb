class CreateCodeStates < ActiveRecord::Migration
  def self.up
    create_table :code_states do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :code_states
  end
end
