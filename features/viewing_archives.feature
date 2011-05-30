Feature: Viewing the archives
	In order to read former most beautiful codes of the day
	As a User
	I should be able to access to the archives

Background:
	Given there are the following users:
		| nickname | email 					 | password | unconfirmed |
		| Amokrane | amokrane.chentir@gmail.com | password | false 	  |
	And I am signed in as them
	Given there are the following codes:
		| title 	    | language | code_state_id | user_id | score  | selected_at               |
		| Hello World   | Ruby 	   |      3        | 1 		 | 14     | 2011-05-30 00:32:53 +0200 |
		| Using Proc    | Ruby 	   |      3        | 1 		 | 74     | 2011-05-29 00:32:53 +0200 |
		| This is Java  | Java 	   |      2 	   | 1 		 | 0      |                           |


Scenario: View the archive
	Given I am on the homepage
	And I follow "Archives"
	Then I should be on the archives page
	Then I should see "Hello World"
	And I should see "Using Proc"
	But I should not see "This is Java"