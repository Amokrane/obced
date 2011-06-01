class TagsController < ApplicationController
	def index
		@tags = Tag.all
	end
	
	def show
		@tag = Tag.find(params[:id])
	end

	def related_tags
		tags = Tag.find_related_tags params[:current_tag]
		render :text => tags
	end
end
