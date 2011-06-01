Feature: Viewing tags
	In order to read the codes that belong to a certain category
	As a User
	I should be able to view tags

Background:
	Given there are the following users:
		| nickname | email 					    | password | unconfirmed |
		| Amokrane | amokrane.chentir@gmail.com | password | false 	     |
	And I am signed in as them
	Given there are the following tags:
		| name |
		| ruby  |
		| c++   |
		| rails |
	Given there are the following codes:
		| title 	  | language | content          | description             | user_id | score |
		| Hello World | Ruby 	 | puts Hello World | very simple hello world | 1 		| 1     |
	Given there are the following codes_tags:
		| code_id | tag_id |
		| 1       | 1      |

Scenario: Viewing all the tags
	Given I am on the homepage
	And I follow "Tags"
	Then I should see "ruby"
	And I should see "c++"
	And I should see "rails"

Scenario: Following a tag
	Given I am on the homepage
	And I follow "Tags"
	And I follow "ruby"
	Then I should see "Hello World"
		