Given /^there are the following codes:$/ do |table|
  table.hashes.each do |attributes|
  	@code = Code.create! attributes
  end
end

Given /^the code "([^"]*)" should be "([^"]*)"$/ do |code, state|
	puts "There are #{Code.count} codes..."
	code = Code.find_by_title(code)
	code.code_state.should == CodeState.find_by_name(state)
end

Given /^I should see in this order:$/ do |table|
  expected_order = table.raw
  actual_order = all('a.code').collect(&:text)
  actual_order.should == expected_order.flatten
end

Given /^the code "([^"]*)" should have a score of ([^"]*)$/ do |code, score|
  code = Code.find_by_title(code)
  code.score.to_s.should == score
end
