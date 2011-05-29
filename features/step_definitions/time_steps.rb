require 'rake'

Given /^it is the ending of the voting day$/ do
	rake = Rake::Application.new
	Rake.application = @rake
	 begin
	  @rake["jobs:work"]
	  set_speed(:medium)
      @rake["jobs:schedule_code_caster"].invoke
      set_speed(:slow)
    rescue => e
      RAILS_DEFAULT_LOGGER.error "The task jobs:schedule_code_caster failed: #{e}"    
    end
end
