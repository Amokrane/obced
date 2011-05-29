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
	Then there should be 1 entries in "Delayed::Job"
	Given jobs are being dispatched
	Then there should be 0 entries in "Delayed::Job"
	And the code "Using Proc" should be "Selected"