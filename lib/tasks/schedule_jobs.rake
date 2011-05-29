namespace :jobs do
	desc "Schedule the jobs to be runned by DJ."
	task :schedule_code_caster => :environment do
		begin
			Delayed::Job.enqueue Jobs::CodeCaster.new
		rescue => e
			STDERR.puts "Error: #{e}"
		end
	end
end