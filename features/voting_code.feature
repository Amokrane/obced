Feature: Voting codes
	In order to select the most beautiful code of the day
	As a User
	I want to be able to vote for a particular code

Background:
	Given there are the following users:
		| nickname   | email 					 | password | unconfirmed |
		| Amokrane   | amokrane.chentir@gmail.com | password | false 	  |
		| AmokraneSub| amokrane@submate.com       | password | false       |
	And I am signed in as them
	Given there are the following codes:
		| title 	  | language | content          | description             | user_id | score |
		| Hello World | Ruby 	 | puts Hello World | very simple hello world | 1 		| 1     |
Scenario: Voting up a code
	Given I am on the codes page
	And I press "up" 
  Then the code "Hello World" should have a score of 2
  And I press "up"
  Then the code "Hello World" should have a score of 3
