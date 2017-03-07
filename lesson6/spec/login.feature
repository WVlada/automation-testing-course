Feature: Loging in
	Scenario: Loging in with correct data
		Given I am on the login page
		And I should set email and password and check remember credentials
		Then I should be logged in

	Scenario: Remembering login
		Given I am logged in
		And I close and open browser
		Then I should be logged in

	Scenario: Loging in with incorrect data
		Given I am on the login page
		And I should set incorrect email and password and check remember credentials
		Then I should not be logged in