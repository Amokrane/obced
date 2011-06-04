class CodesController < ApplicationController
	#before_filter :find_user

	def index
		if params[:criteria] == 'sort_by_date'
			@search = Code.recent.search(params[:search])
		elsif params[:criteria] == 'sort_by_score'
			@search = Code.best.search(params[:search])	
		else
			@search = Code.search(params[:search])	
		end
		@codes = @search
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

	def vote_down
		@code = Code.find(params[:code_id])
		@code.score -= 1

		respond_to do |format|
			if @code.save
				format.html {
					redirect_to(codes_path, :notice => "Voted down")
				}
			else
				format.html {
					render :action => "vote_down"
				}
			end			
		end
	end

	def share_by_email
		code = Code.find(params[:code_id])
		user = User.find(params["current_user"].to_i)
		code.email_to_external_user(user, params[:to_name], params[:to_email])
		redirect_to(codes_path, :notice => "Email sent, thanks!")
	end

	def import_gist
		@gists, @gists_contents = Code.import_gist_by_user current_user
	end

	private
	def find_user
		@user = User.find(params[:user_id])
	end
end
