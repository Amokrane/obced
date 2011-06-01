class UserMailer < ActionMailer::Base
  default :from => "amokrane.chentir@gmail.com"

  def welcome_email(user)
		if !user.nickname.nil?
			mail(:to => user.email,
			 	 :from => '"Amokrane from Hello Code" <amokrane.chentir@gmail.com>',
			 	 :subject => "Hello #{user.nickname}, welcome to Hello Code!")
	 	else
	 		mail(:to => user.email,
			 	 :from => '"Amokrane from Hello Code" <amokrane.chentir@gmail.com>',
			 	 :subject => "Hello #{user.email}, welcome to Hello Code!")

		end
	end
end
