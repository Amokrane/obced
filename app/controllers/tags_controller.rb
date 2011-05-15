class TagsController < ApplicationController
	def related_tags
		tags = Tag.find_related_tags params[:current_tag]
		render :text => tags
	end
end
