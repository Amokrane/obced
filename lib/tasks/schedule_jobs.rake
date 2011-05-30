namespace :jobs do
	desc "Archive the latest selected code"
	task :schedule_code_archiver => :environment do 
		begin
			Delayed::Job.enqueue Jobs::CodeArchiver.new
		rescue => e
			STDERR.puts "Error enqueuing the code_archiver job: #{e}"
		end
	end

	desc "Cast the code of the day"
	task :schedule_code_caster => :environment do
		begin
			Delayed::Job.enqueue Jobs::CodeCaster.new
		rescue => e
			STDERR.puts "Error enqueuing the code_caster job: #{e}"
		end
	end

	desc "Desactivate the codes that has not been selected for 3 days"
	task :schedule_code_cleaner => :environment do
		begin
			Delayed::Job.enqueue Jobs::CodeCleaner.new
		rescue => e
			STDERR.puts "Error enqueuing the code_cleaner job: #{e}"
		end
	end

end