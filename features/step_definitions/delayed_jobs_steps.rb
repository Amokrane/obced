When /^delayed_job runs all pending jobs$/ do
	Delayed::Job.all.map{|j| j.payload_object.perform}
end

Given /^jobs are being dispatched$/ do 
	Delayed::Worker.new.work_off
	set_speed(:slow)
end