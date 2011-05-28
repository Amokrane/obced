["Active", "Selected", "Archived", "Inactive"].each do |cs|
	CodeState.find_or_create_by_name(cs)
end