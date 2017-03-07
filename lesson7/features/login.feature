Feature: Loging in
	Scenario: Loging with correct credentials
	Given I am at site
	Given I enter vladimir.bukvic@live.com for email and blogpass for password
	Then Page should have link Edit