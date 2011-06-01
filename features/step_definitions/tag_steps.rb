Given /^there are the following tags:$/ do |table|
  table.hashes.each do |attributes|
  	@tag = Tag.create! attributes
  end
end


Given /^there are the following codes_tags:$/ do |table|
  table.hashes.each do |attributes|
  	@code_tag = CodesTag.create! attributes
  end
end
