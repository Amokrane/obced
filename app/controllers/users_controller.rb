class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def vote_up
		@user = User.find(params[:user_id])
		@user.score ||= 0
		@user.score += 1

		respond_to do |format|
			if @user.save
				format.html {
					redirect_to(user_path(@user), :notice => "Voted up")
				}
			else
				format.html {
					render :action => "vote_up"
				}
			end			
		end
	end
end