Feature: Profiles users
	In order to share information about me
	As a User
	I should be able to have a profile

Background:
	Given there are the following users:
		| nickname | email 					 	| password | unconfirmed |
		| amokrane | amokrane.chentir@gmail.com | password | false 	  	 |
	And I am signed in as them

Scenario: Filling up profile information
	Given I am on the homepage
	And I follow "My Profile"
	And I fill in "user_website" with "http://www.chentir.com"
	And I fill in "user_biography" with "Student, intern & rails developer"
	And I press "Update"
	Then I should see "You updated your account successfully."

