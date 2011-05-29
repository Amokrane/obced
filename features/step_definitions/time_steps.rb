require 'rake'

Given /^it is the ending of the voting day$/ do
	rake = Rake::Application.new
	Rake.application = rake
	#Dir[Rails.root + "/lib/tasks/**/*.rake" ].each { |ext| load ext }
	Rake.application.rake_require "tasks/schedule_jobs"
	Rake::Task.define_task(:environment)
	begin
      rake["jobs:schedule_code_caster"].invoke
    rescue => e
      STDERR.puts "The task jobs:schedule_code_caster failed: #{e}"    
    end
end
