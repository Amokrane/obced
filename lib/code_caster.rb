require 'active_support/core_ext'
require File.dirname(__FILE__) + "/jobs.rb"

module Jobs
	class CodeCaster
		#include ScheduledJob
		#run_every 24.hours

		def perform
			abcs = ActiveRecord::Base.configurations
      		ActiveRecord::Base.establish_connection(abcs[::Rails.env])
      		unless !Code.where(:code_state_id => 2).empty?
		  		selected_code = Code.order("score DESC").first
		  		selected_code.selected_at = Time.now
		  		selected_code.code_state = CodeState.find_by_name("Selected")
		  		selected_code.save
      		end
		end
	end
end