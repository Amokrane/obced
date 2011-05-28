Feature: Selecting Code
	In order to be able view the code of the day
	As a Code
	I should be selected if I have the more votes


Background:
	Given there are the following codes:
		| title 	  | language | content              | description              | user_id | score |
		| Hello World | Ruby 	 | puts Hello World     | very simple hello world  | 1 		 | 2     |
		| Using Proc  | Ruby 	 | p.capitalize(:&name) | Using a Proc in Ruby     | 1 		 | 5     |
Scenario: Selecting code of the day
	Given it is the ending of the voting day
	Then the code "Using Proc" should be "Selected"