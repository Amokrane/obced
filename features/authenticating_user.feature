Feature: Authenticating user
 	In order to use the site
 	As a User
 	I should be able to register 

Scenario: Signing up to the site
	Given I am on the signup page
	And I fill in "user[nickname]" with "Test"
	And I fill in "user[email]" with "test@test.com"
	And I fill in "user[password]" with "password"
	And I fill in "user[password_confirmation]" with "password"
	And I press "Sign up"
	Then I should be on the homepage
	And I should see "Welcome! You have signed up successfully."