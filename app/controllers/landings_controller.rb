class LandingsController < ApplicationController
	def index
		@selected_codes = Code.where(:code_state_id => CodeState::SELECTED)
		@recent_codes = Code.recent
		@recent_users = User.recent
	end
end
