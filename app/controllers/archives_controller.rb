class ArchivesController < ApplicationController
	def index
    @archives = Code.build_archive(Time.now.year)
	end
end
