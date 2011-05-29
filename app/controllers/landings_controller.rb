class LandingsController < ApplicationController
	def index
		@selected_codes = Code.where(:code_state_id => 2)
	end
end
