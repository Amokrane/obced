require 'active_support/core_ext'
require File.dirname(__FILE__) + "/jobs.rb"

module Jobs
	class CodeCaster
		include ScheduledJob
		run_every 5.seconds

		def perform
			puts "performing..."
		end
	end
end