require 'active_support/core_ext'
require File.dirname(__FILE__) + "/jobs.rb"

module Jobs
	class CodeCaster
		#include ScheduledJob
		#run_every 24.hours

		def perform
			abcs = ActiveRecord::Base.configurations
      		ActiveRecord::Base.establish_connection(abcs[::Rails.env])
      		unless !Code.where(:code_state_id => CodeState::SELECTED).empty?
            begin
              selected_code = Code.where(:code_state_id => CodeState::ACTIVE).order("score DESC").first
              #raise selected_code.inspect
              unless selected_code.nil?
                selected_code.selected_at ||= Time.now
                # Changing the state of the code to 'Selected'
                selected_code.code_state = CodeState.find_by_name("Selected")
                selected_code.save
                selected_code.email_as_selected_to_author
                selected_code.email_as_selected_to_subscribers
              end
            rescue => e
              STDERR.puts "Error when selecting a code #{e}"
            end
          end
		end
	end
end
