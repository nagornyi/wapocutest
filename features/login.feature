Feature: Login
	In order to login
	I need to enter valid credentials
	In order to logout
	I need to click 'Sign Out' link

Scenario: Check credentials
	Given I have successfully logged in as "test" user using "pass1" password
	When the current page on Php Login site has fully loaded
	When I signout
	Then I should return to Login Page

Scenario: Search in Google
	When I search for "Ruby"
	When the current page on Google site has fully loaded
	Then I should see "A dynamic, interpreted, open source programming language" text on the search results page
	And now I close the Google site

Scenario: Check credentials alternatively
	Given I have alternatively logged in as "test" user using "pass" password
	When I signout
	Then I should return to Login Page
	And now I close the PhpLogin site

