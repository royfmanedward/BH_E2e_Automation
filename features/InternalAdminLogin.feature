Feature: Internal Admin Login

  @RegressionTest
  Scenario Outline: IA5: Login & Logout Functionality (C137827)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I go to the InternalAdminLogin page
    Then The loginSubmit element is disabled
    When I login with <invalidUsername> username and <invalidPassword> password
    Then I should see <error> text in alertBanner field
    When I clear the usernameInput field
      And I clear the passwordInput field
      And I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click the firstAppNumberLink element
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn is visible
    When I click the logoutBtn in the InternalAdminHeader component
    Then I should be on the InternalAdminLogin page
      And I report test passing test status
    Examples:
      | client        | username  | password  | invalidUsername | invalidPassword | error                     | testCaseId |
      | internaladmin | Reeves35  | TReeves1  | invalidUsername | WrongPassword1  | Invalid login credentials | 112599     |

  @RegressionTest
  Scenario Outline: IA5: Login Page and Footer (C137398)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I go to the InternalAdminLogin page
    Then title should be <title>
      And The loginSubmit element is disabled
      And The loginLogoImage is visible
      And The rememberMeLabel element is present
      And The copyright element is present
      And The privacyPolicy element is present
      And The termsConditions element is present
      And The trademarks element is present
    When I click the privacyPolicy element
    Then The url should be https://www.brighthorizons.com/privacy
    When I navigate to previous page
    Then I should be on the InternalAdminLogin page
    When I click the termsConditions element
    Then The url should be https://www.brighthorizons.com/text-pages/terms-use
    When I navigate to previous page
    Then I should be on the InternalAdminLogin page
    When I click the trademarks element
    Then The url should be https://www.brighthorizons.com/trademarks
    When I navigate to previous page
    Then I should be on the InternalAdminLogin page
      And I report test passing test status
    Examples:
      | client        | title                     | testCaseId |
      | internaladmin | Internal Admin - EdAssist | 114202     |

  @RegressionTest
  Scenario Outline: IA5: Remember Me Functionality (C149229)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I go to the InternalAdminLogin page
    Then the rememberMeCheckbox is not selected
    When I enter <username> in usernameInput textfield
      And I enter <password> in passwordInput textfield
      And I click the rememberMeLabel element
    Then the rememberMeCheckbox is selected
    When I click the loginSubmit element
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click the logoutBtn in the InternalAdminHeader component
    Then I should be on the InternalAdminLogin page
      And the rememberMeCheckbox is selected
      And The exact text in usernameInput field should be Reeves30
      And I report test passing test status
    Examples:
      | client        | username  | password  | testCaseId |
      | internaladmin | Reeves30  | TReeves1  | 120097     |
