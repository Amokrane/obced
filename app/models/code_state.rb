class CodeState < ActiveRecord::Base
	has_many :codes

	ACTIVE = 1
	SELECTED = 2
	ARCHIVED = 3
	INACTIVE = 4
end
