Feature: Signing in

Scenario: Unsuccessful signin
  Given a user visit the signin page
  When they submit invalid signin information
  Then they should see an error messega

Scenario: Successful signin
  Given a user visit the signin page
    And the user has an account
  When the user submits valid signin information
  Then they should see their profile page
    And they should see a signout link  