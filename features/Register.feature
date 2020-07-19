Feature: Registration

  @RegressionTest
  Scenario Outline: Given all valid credentials, verify user does not have to re-register if already registered - Single LOB (C145784)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I go to the Login page
      And I wait until the preLoader is not visible
      And I click the registerNow element
    Then I should be on the VerifyEmployer page
    When I enter <employerUsername> in employerUsername textfield
      And I enter <employerPwd> in employerPassword textfield
      And I click the verifyEmployerBtn element
    Then I should be on the Registration page
      And The exact text in employerInput field should be <employerInputText>
      And The employerInput element is disabled
      And The firstNameInput is visible
      And The lastNameInput is visible
      And The workEmailInput is visible
      And The countryDropdown is visible
      And The homeZipCodeInput is visible
      And The employeeNumberInput is visible
      And The createYourUserNameInput is visible
      And The confirmPasswordInput is visible
      And The privacyPolicyCheckBox is visible
      And The registerBtn is visible
    When I enter <firstName> in firstNameInput textfield
      And I enter <lastName> in lastNameInput textfield
      And I enter <email> in workEmailInput textfield
      And I select United States from countryDropdown dropdown
      And I enter <homeZipCode> in homeZipCodeInput textfield
      And I enter <employeeNumber> in employeeNumberInput textfield
      And I enter <userName> in createYourUserNameInput textfield
      And I enter <password> in createYourPasswordInput textfield
      And I enter <password> in confirmPasswordInput textfield
      And I click the PrivacyPolicyCheckBox element
      And I click the registerBtn element
    Then I should see Username already exists text in errorMessage field
      And I report test passing test status
    Examples:
      | client  | employerUsername | employerPwd         | employerInputText    | firstName | lastName | email                                | homeZipCode | employeeNumber | userName | password | testCaseId |
      | lr5demo | LoanDemo         | Dont_Provide_To_BEE | EA Student Loan Test | Auto      | Test1    | AutoTest1@AutomationEdAssistUser.com | 12345       | ATest1         | ATest1   | Welcome1 | 117829     |

  @RegressionTest
  Scenario Outline: Email existing in BH Admin cannot be use to register a user to OneBH Login - Single LOB (C169852)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I go to the Login page
      And I wait until the preLoader is not visible
      And I click the link with text Not signed up yet? Register Now.
    Then I should be on the VerifyEmployer page
    When I enter <employerUsername> in employerUsername textfield
      And I enter <employerPwd> in employerPassword textfield
      And I click the verifyEmployerBtn element
    Then I should be on the Registration page
    When I enter <firstName> in firstNameInput textfield
      And I enter <lastName> in lastNameInput textfield
      And I enter <existingEmail> in workEmailInput textfield
      And I select United States from countryDropdown dropdown
      And I enter <homeZipCode> in homeZipCodeInput textfield
      And I enter <employeeId> in employeeNumberInput textfield
      And I enter <userName> in createYourUserNameInput textfield
      And I enter <password> in createYourPasswordInput textfield
      And I enter <password> in confirmPasswordInput textfield
      And I click the PrivacyPolicyCheckBox element
      And I click the registerBtn element
    Then I should see A profile has previously been created for this user. Please sign-in with your existing credentials. text in errorMessage field
      And I report test passing test status
    Examples:
      | client  | employerUsername | employerPwd         | firstName | lastName | existingEmail                        | homeZipCode | employeeId | userName | password | testCaseId |
      | lr5demo | LoanDemo         | Dont_Provide_To_BEE | Auto      | ATest21  | AutoTest1@AutomationEdAssistUser.com | 12345       | ATest21    | ATest21  | Welcome1 | 130832     |