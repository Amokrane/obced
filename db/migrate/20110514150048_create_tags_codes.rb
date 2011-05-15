class CreateTagsCodes < ActiveRecord::Migration
  def self.up
  	create_table :codes_tags, :id => false do |t|
  		t.integer :code_id, :tag_id
  	end
  end

  def self.down
  	drop_table :codes_tags
  end
end
