Feature: Managing tags
	In order to help users find codes that match their interests
	As a User
	I should be able to add tags when posting a code proposal

Background:
	Given there are the following users:
		| nickname | email 					    | password | unconfirmed |
		| Amokrane | amokrane.chentir@gmail.com | password | false 	     |
	And I am signed in as them

Scenario: Add tags when posting a new code
	Given I am on the home page
	When I follow "Post a Code"
	And I fill in "Title" with "Hello World"
	And I fill in "Content" with "puts Hello World"
	And I fill in "Description" with "A simple and beautiful hello world"
	And I select "Ruby" from "languages-select"
	And I fill in "tags" with "ruby hello-world"
	And I press "Submit This Shiny Beautiful Code"
	Then I should see "Code has been submitted."
	And I should see "ruby"
	And I should see "hello-world"
