Feature: Voting users
	In order to be able to recognize the valuable members of the community
	As a User
	I should be able to vote for a given user

Background:
	Given there are the following users:
		| nickname | email 		    | password | unconfirmed | website             | biography | score |
		| test     | test@obced.com | password | false 	     | http://www.test.com | Tester    | 0     |
	And I am signed in as them
	Given there are the following users:
		| nickname | website 			  | biography   | email 	   | password | unconfirmed | score |
		| Ninja    | http://www.ninja.com | Rails Ninja | ninja@obced.com   | password | false 	| 0  |

Scenario: Voting up a user
	Given I am on the user page for "Ninja"
	Then I should see "Score=0"
	When I press "Up"
	Then I should see "Score=1"
