require 'rake'

Given /^it is the ending of the voting day$/ do
	rake = Rake::Application.new
	Rake.application = @rake
	 begin
      @rake["jobs:schedule_code_caster"].invoke
    rescue => e
      RAILS_DEFAULT_LOGGER.error "The task jobs:schedule_code_caster failed: #{e}"    
    end
end
