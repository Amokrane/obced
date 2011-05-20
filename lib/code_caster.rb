module Jobs
	class CodeCaster
		include ScheduledJob

		run_every 24.hours

		def perform
			puts "performing..."
		end
	end
end