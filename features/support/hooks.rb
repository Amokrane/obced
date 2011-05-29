Before do
	["Active", "Selected", "Archived", "Inactive"].each do |cs|
		Factory(:code_state, :name => cs)
	end
end