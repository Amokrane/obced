require 'active_support/core_ext'
require File.dirname(__FILE__) + "/jobs.rb"

module Jobs
	class CodeCaster
		#include ScheduledJob
		#run_every 24.hours

		def perform
			abcs = ActiveRecord::Base.configurations
      		ActiveRecord::Base.establish_connection(abcs[RAILS_ENV])
      		selected_code = Code.order("score DESC").first
      		selected_code.code_state = CodeState.find_by_name("Selected")
		end
	end
end