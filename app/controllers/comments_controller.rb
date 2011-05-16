class CommentsController < ApplicationController
	def create
		@code = Code.find(params[:code_id])
		@comment = @code.comments.create(params[:comment].merge(:user_id => current_user.id))
		flash[:notice] = "Your comment has been sent."
		redirect_to code_path(@code)
	end
end
