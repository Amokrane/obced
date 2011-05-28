namespace :jobs do
	desc "Schedule the jobs to be runned by DJ."
	task :schedule_code_caster => :environment do
		begin
			Delayed::Job.enqueue Jobs::CodeCaster.new
		rescue => e
			puts "Error: #{e}"
		end
	end
end