class Tag < ActiveRecord::Base
	has_and_belongs_to_many :codes

	def self.find_related_tags current_tag
	    related_tags = []
	    tags = Tag.all
	    regex = /^#{current_tag}/
	    tags.each do |t|
	      if regex.match(t.name) 
	        related_tags << t.name
	      end
	    end

	    return related_tags
  	end
end
