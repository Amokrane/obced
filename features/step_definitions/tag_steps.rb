Given /^there are the following tags:$/ do |table|
  table.hashes.each do |attributes|
  	@tag = Tag.create! attributes
  end
end
