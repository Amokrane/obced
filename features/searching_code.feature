Feature: Searching Code
 	In Order to look for a code quickly
 	As a registered user
 	I should be able to search a code

Background:
   Given there are the following users:
		| email 					 | password | unconfirmed |
		| amokrane.chentir@gmail.com | password | false 	  |
   And I am signed in as them
   Given there are the following codes:
   		| title 	  | language | content          	| description              | user_id | score |
		| Hello World | C++ 	 |  #include <iostream> | very simple hello world  | 1 		 | 0     |
		| Using Proc  | Ruby 	 | p.capitalize(:&name) | Using a Proc in Ruby 	   | 1 		 | 0     |

Scenario: Search Code By Language
	Given I am on the codes page
	And I fill in "search-by-language" with "Ruby"
	And I press "Search"
	Then I should see "Using Proc"
	And I should not see "Hello World"