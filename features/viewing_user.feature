Feature: Viewing users
	In order to interact with other users on the site
	As a User
	I should be able to check their profile page


Background:
	Given there are the following users:
		| nickname | email 		    | password | unconfirmed | website             | biography |
		| test     | test@obced.com | password | false 	     | http://www.test.com | Tester    |
	And I am signed in as them
	Given there are the following users:
		| nickname | website 			  | biography   | email 			  | password | unconfirmed |
		| Ninja    | http://www.ninja.com | Rails Ninja | ninja@obced.com     | password | false 	   |
	Given there are the following codes:
		| title 	  | language | content          | description              | user_id | score |
		| Hello World | Ruby 	 | puts Hello World | very simple hello world  |       2 | 0     |     

Scenario: Viewing the profile page
	Given I am on the homepage
	And I follow "users"
	And I follow "Ninja"
	Then I should be on the user page for "Ninja"
	And I should see "Ninja"
	And I should see "Rails Ninja"
	And I should see "http://www.ninja.com"
	And I should see "Hello World"