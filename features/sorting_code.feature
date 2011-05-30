Feature: Sorting code
	In order to be able to read the hot codes
	As a User
	I should be able to sort the codes by: popularity, score and date

Background:
	Given there are the following codes:
		| title 	  | language | content          	| description              | user_id | score |
		| Hello World | Ruby 	 | puts Hello World 	| very simple hello world  | 1 		 | 1     |
		| Using Proc  | Ruby 	 | p.capitalize(&:name) | Using a Proc in Ruby 	   | 1 		 | 2     |


Scenario: Sorting code by date
	Given I am on the codes page
	And I follow "Sort by date"

Scenario: Sorting code by popularity
	Given I am on the codes page
	And I follow "Sort by popularity"

Scenario: Sorting code by score
	Given I am on the codes page
	And I follow "Sort by score"