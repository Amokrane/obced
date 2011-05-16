Feature: Commenting code
	In order to be able to give my opinon on a given code
	As a registered User
	I should be able to comment a code

Background:
	Given there are the following users:
		| email 					 | password | unconfirmed |
		| amokrane.chentir@gmail.com | password | false 	  |
	And I am signed in as them
	Given there are the following codes:
		| title 	  | language | content          | description              | user_id | score |
		| Hello World | Ruby 	 | puts Hello World | very simple hello world  | 1 		 | 0     |
Scenario:
	Given I am on the homepage
	And I follow "Hello World"
	Then I should be on the code page for "Hello World"
	When I fill in "Comment" with "Good one!"
	And I press "Comment"
	Then I should see "Your comment has been sent."
	And I should see "Good one!"