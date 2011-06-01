class UserMailer < ActionMailer::Base
  default :from => "amokrane.chentir@gmail.com"

  def welcome_email(user)
  		@user = user
		if !user.nickname.nil?
			mail(:to => user.email,
			 	 :from => '"Amokrane from Hello Code" <amokrane.chentir@gmail.com>',
			 	 :subject => "Hello #{@user.nickname}, welcome to Hello Code!")
	 	else
	 		mail(:to => user.email,
			 	 :from => '"Amokrane from Hello Code" <amokrane.chentir@gmail.com>',
			 	 :subject => "Hello #{@user.email}, welcome to Hello Code!")

		end
	end

	def code_selected_email(user)
		@user = user
		if !user.nickname.nil?
			mail(:to => user.email,
			 	 :from => '"Amokrane from Hello Code" <amokrane.chentir@gmail.com>',
			 	 :subject => "#{@user.nickname}, your code has been selected!")
	 	else
	 		mail(:to => user.email,
			 	 :from => '"Amokrane from Hello Code" <amokrane.chentir@gmail.com>',
			 	 :subject => "#{@user.email}, your code has been selected!")
		end
	end

	def code_of_the_day_email(user, code)
		@user = user
		@code = code
		if !user.nickname.nil?
			mail(:to => user.email,
			 	 :from => '"Amokrane from Hello Code" <amokrane.chentir@gmail.com>',
			 	 :subject => "#{@user.nickname}, go read the code of the day!")
	 	else
	 		mail(:to => user.email,
			 	 :from => '"Amokrane from Hello Code" <amokrane.chentir@gmail.com>',
			 	 :subject => "#{@user.email}, go read the code of the day")
		end
	end
end
