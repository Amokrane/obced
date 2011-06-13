class UserMailer < ActionMailer::Base
  default :from => "admin@OhTheCode!.com"

  def welcome_email user
  		@user = user
		if !user.nickname.nil?
			mail(:to => user.email,
			 	 :from => '"Amokrane from OhTheCode!" <admin@OhTheCode!.com>',
			 	 :subject => "Hello #{@user.nickname}, welcome to OhTheCode!!")
	 	else
	 		mail(:to => user.email,
			 	 :from => '"Amokrane from OhTheCode!" <admin@ohthecode.com>',
			 	 :subject => "Hello #{@user.email}, welcome to OhTheCode!!")

		end
	end

	def code_selected_email user
		@user = user
		if !user.nickname.nil?
			mail(:to => user.email,
			 	 :from => '"Amokrane from OhTheCode!" <admin@ohthecode.com>',
			 	 :subject => "#{@user.nickname}, your code has been selected!")
	 	else
	 		mail(:to => user.email,
			 	 :from => '"Amokrane from OhTheCode!" <admin@ohthecode.com>',
			 	 :subject => "#{@user.email}, your code has been selected!")
		end
	end

	def code_of_the_day_email user, code
		@user = user
		@code = code
		if !user.nickname.nil?
			mail(:to => user.email,
			 	 :from => '"Amokrane from OhTheCode!" <admin@ohthecode.com>',
			 	 :subject => "#{@user.nickname}, go read the code of the day!")
	 	else
	 		mail(:to => user.email,
			 	 :from => '"Amokrane from OhTheCode!" <admin@ohthecode.com>',
			 	 :subject => "#{@user.email}, go read the code of the day")
		end
	end

	def code_to_external_user_email user, name, email, code
		@user = user
		@to_name = name
		@to_email = email
		@code = code
		if !user.nickname.nil?
			mail(:to => @to_email,
			 	 :from => '"Amokrane from OhTheCode!" <admin@ohthecode.com>',
			 	 :subject => "#{@to_name}, #{@user.nickname} wanted to share a beautiful code with you today!")
	 	else
	 		mail(:to => @to_email,
			 	 :from => '"Amokrane from OhTheCode!" <admin@ohthecode.com>',
			 	 :subject => "#{@to_name}, #{@user.email} wanted to share a beautiful code with you today!")
		end
	end
end
