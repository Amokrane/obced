class LandingsController < ApplicationController
	def index
		@selected_codes = Code.where(:code_state_id => 2)
		@recent_codes = Code.recent
		@recent_users = User.recent
	end
end
