Given /^there are the following codes:$/ do |table|
  table.hashes.each do |attributes|
  	@code = Code.create! attributes
  end
end

Given /^the code "([^"]*)" should be "([^"]*)"$/ do |code, state|
	code = Code.find_by_title(code)
	code.code_state.should == CodeState.find_by_name(state)
end

