Feature: Creating codes
	In order to publish my beautiful code
	As a User
	I want to be able to create a new code


Background:
	Given there are the following users:
		| nickname | email 					    | password | unconfirmed |
		| Amokrane | amokrane.chentir@gmail.com | password | false 	     |
	And I am signed in as them

Scenario: Create a new code
	Given I am on the homepage
	When I follow "New Code"
	And I fill in "Title" with "My first beautiful code"
	And I fill in "Content" with "puts Hello World"
	And I select "Ruby" from "languages-select"
	And I fill in "Description" with "This is a very simple hello world, but its beautiful!"
	And I press "Submit This Shiny Beautiful Code"
	Then I should see "Code has been submitted."
	And the code "My first beautiful code" should be "Active"

