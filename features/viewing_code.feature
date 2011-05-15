Feature: Viewing codes
	In order to check the codes
	As a  user
	I should be able to view the codes

Background:
	Given there are the following users:
		| email 					 | password | unconfirmed |
		| amokrane.chentir@gmail.com | password | false 	  |
	And I am signed in as them
	Given there are the following codes:
		| title 	  | language | content          | description              | user_id | score |
		| Hello World | Ruby 	 | puts Hello World | very simple hello world  | 1 		 | 0     |
		| Using Proc  | Ruby 	 | p.capitalize(:&name) | Using a Proc in Ruby | 1 		 | 0     |

Scenario: View proposed codes
	Given I am on the codes page
	Then I should see "Hello World"
	And I should see "Using Proc"
