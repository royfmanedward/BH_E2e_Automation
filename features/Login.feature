Feature: Login Page

  @RegressionTest
  Scenario Outline: Inactive user cannot login using OneBH login credentials - Single LOB (C169851)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the EditRegistration page
      And I should see <errorText> text in errorMessage field
      And I report test passing test status
    Examples:
      | client  | username   | password | errorText                                                                                                                                                                                                                    | testCaseId |
      | lr5demo | AutoTest6  | Welcome1 | What you entered does not match the information provided by your employer. Please call us at 877-BH-CARES (877-242-2737) in the United States or Canada. (0800 247 1101) in the United Kingdom or (1800 303 547) in Ireland. | 130826     |

  @RegressionTest
  Scenario Outline: When One BH Login is enabled in 4.0, login and logout from EdAssist Application via EdAssist Login URL-Single LOB (C147614)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I go to the Login page
    Then The bhLoginHeader is visible
      And The bhUsernameInput is visible
      And The bhPasswordInput is visible
      And The bhLoginBtn is visible
      And title should be Benefits Login | Bright Horizons ®
    When I enter <username> in bhUsernameInput textfield
      And I enter <password> in bhPasswordInput textfield
      And I click the bhLoginBtn element
    Then The url should be lr5demo
      And The productSelectionIcon is not visible
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
      And The url should be Logout
      And I should see You have successfully signed out. Please Close the Browser. text in logoutText field
      And I report test passing test status
    Examples:
      | client  | username  | password | testCaseId |
      | lr5demo | AutoTest1 | Welcome1 | 119824     |

  @SmokeTest
  Scenario Outline: LR5 Verify Title, Footer Links, Keyboard Navigation and Invalid login On BH Login Page (C142593)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
    And I'm on the <client> site
    When I go to the Login page
      And I click the policyLink in the Footer component
      And I switch to second tab
    Then The url should be https://www.brighthorizons.com/privacy
    When I change focus to tab 0
      And I click the termsLink in the Footer component
      And I switch to second tab
    Then The url should be https://www.brighthorizons.com/terms-use
    When I change focus to tab 0
      And I click the trademarkLink in the Footer component
      And I switch to second tab
    Then The url should be https://www.brighthorizons.com/trademarks
    When I change focus to tab 0
    Then title should be Benefits Login | Bright Horizons ®
      And I enter <username> in bhUsernameInput textfield
      And I click TAB key in bhUsernameInput textfield
    Then I verify that bhPasswordInput element is in focus
    When I enter <password> in bhPasswordInput textfield
      And I click the bhLoginBtn element
      And I should see We can’t find that username and/or password. Not signed up yet?  Click the link below to enter your employer credentials text in invalidLoginText field
      And I report test passing test status
    Examples:
      | client  | username  | password  | stgTestCaseId | uatTestCaseId |  prodTestCaseId |
      | lr5demo | AutoTest1 | Welcome2  | 117514        | 144323        | 144324          |

  @SmokeTest
  Scenario Outline: TU5 Verify page title, form validation, client logo is present, Footer and Invalid login (C1829)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I go to the Login page
    Then title should be Login - EdAssist
      And The LoginSubmit is visible
    When I click the privacyPolicy in the Footer component
    Then Text in textArea in the Footer component is present
    When I click the closeBtn in the Footer component
      And I refresh the page
    Then The footerLogoImage in the footer component is not visible
    When I click the termsConditions in the Footer component
    Then Text in textArea in the Footer component is present
    When I click the closeBtn in the Footer component
    And I refresh the page
      And The loginSubmit element is disabled
      And The loginLogoImage is visible
    When I enter <username> in usernameInput textfield
      And I enter <password> in passwordInput textfield
      And I click the loginSubmit element
    Then I should see <error> text in errorText field
      And I report test passing test status
    Examples:
      | client  | username  | password | error                                           | stgTestCaseId | uatTestCaseId |  prodTestCaseId |
      | tu5demo | atest1000 | Melcome2 | Invalid login credentials Need help logging in? | 73226         | 122183        |  126593         |

  @RegressionTest
  Scenario Outline: Verify Forgot Password link for OneBH client-eg5demo AND non-OneBH-tu5demo client (C54814)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I go to the Login page
      And I click the forgotPassword element
    Then I should be on the <forgotPwd> page
    When I enter <email> in emailAddressInput textfield
      And I click the <sendBtn> element
    Then I should see <forgotPasswordSuccessText> text in <forgotPwdSuccessText> field
      And I report test passing test status
    Examples:
      | client  | forgotPwd         | email                     | sendBtn            |  forgotPasswordSuccessText                                                                                                                                                                                                                                                                                                                                                                    | forgotPwdSuccessText      | testCaseId |
      | tu5demo | forgotPassword    | tamssupport1@edassist.com | sendLink           |  Assuming the email address you entered matches our records, we emailed you a confirmation link. Please check your email and follow the instructions.                                                                                                                                                                                                                                         | forgotPwdSuccessText      | 112443     |
      | eg5demo | BhForgotPassword  | tamssupport1@edassist.com | resetMyPasswordBtn |  Password reset instructions have been sent to the email address you provided. If you do not receive the email in 15 minutes, please check your spam folder or try again. Note that you should be using the email address that you entered as part of the sign-up process. For additional assistance, please call 833-225-5241 (US or Canada), 0800 247 1101 (UK), or 1800 303 547 (Ireland). | oneBhForgotPwdSuccessText | 112593     |

  @RegressionTest
  Scenario Outline: TU5 Restricted user cannot access website and verify logout (C78998)
    Given I set the <testCaseId>
      Given I'm on the <client> site
    When I go to the Login page
      And I enter <username> in usernameInput textfield
      And I enter <password> in passwordInput textfield
      And I click the loginSubmit element
      And The errorText is visible
    Then I should see <error> text in errorText field
    When I clear the usernameInput field
      And I clear the passwordInput field
      And I enter <username1> in usernameInput textfield
      And I enter <password1> in passwordInput textfield
      And I click the loginSubmit element
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
      And I report test passing test status
    Examples:
      | client  | username  | password | error                                            | username1 | password1 | testCaseId  |
      | tu5demo | atest15   | Welcome1 | Credentials are restricted Need help logging in? | atest1    | Welcome1  | 112445      |
