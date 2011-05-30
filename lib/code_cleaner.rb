require 'active_support/core_ext'
require File.dirname(__FILE__) + "/jobs.rb"

module Jobs
	class CodeCleaner
		#include ScheduledJob
		#run_every 24.hours

		def perform
			abcs = ActiveRecord::Base.configurations
      		ActiveRecord::Base.establish_connection(abcs[::Rails.env])
      		begin
      			active_codes = Code.where(:code_state_id => 1)
                        active_codes.each do |ac|
                              if Time.now > ac.created_at + 3.days
                                    ac.code_state = CodeState.find_by_name("Inactive")
                                    ac.save
                              end
                        end
      		rescue => e
      			STDERR.puts "Error archiving the code: #{e}"
      		end
		end
	end
end