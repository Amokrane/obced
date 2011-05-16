class CodesController < ApplicationController
	#before_filter :find_user

	def index
		@search = Code.search(params[:search])
		@codes = @search.all
	end

	def new
		@code = Code.new(:user_id => current_user.id)
	end

	def create
		@code = Code.new(params[:code].merge(:user_id => current_user.id))
		
		if @code.save
			@code.tag!(params[:tags])
			flash[:notice] = "Code has been submitted."
			redirect_to @code
		else
			flash[:notice] = "Code has not been submitted."
			redirect :action => "new"
		end
	end

	def show
		@code = Code.find(params[:id])
	end

	def vote_up
		@code = Code.find(params[:code_id])
		@code.score += 1

		respond_to do |format|
			if @code.save
				format.html {
					redirect_to(codes_path, :notice => "Voted up")
				}
			else
				format.html {
					render :action => "vote_up"
				}
			end			
		end
	end

	private
	def find_user
		@user = User.find(params[:user_id])
	end
end
