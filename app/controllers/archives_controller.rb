class ArchivesController < ApplicationController
	def index
		@archives = Code.where(:code_state_id => 3)
	end
end
