require 'active_support/core_ext'
require File.dirname(__FILE__) + "/jobs.rb"

module Jobs
	class CodeArchiver
		#include ScheduledJob
		#run_every 24.hours

		def perform
			abcs = ActiveRecord::Base.configurations
      		ActiveRecord::Base.establish_connection(abcs[::Rails.env])
      		begin
      			selected_code = Code.where(:code_state_id => 2).first
      			selected_code.code_state = CodeState.find_by_name("Archived")
      			selected_code.save
      		rescue => e
      			STDERR.puts "Error archiving the code: #{e}"
      		end
		end
	end
end