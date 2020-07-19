Feature: Agreements (Tuition Step 4)

  @RegressionTest
  Scenario Outline: TU5 Agreements Step 4: Grants, Scholarship, Discount-Yes-Others, Discount-No, Checkbox, Signature (C1976)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                         |
      | Program                           | Tuition Reimbursement Program |
      | Session Start Date from Today     | 1                             |
      | Session End Date from Today       | 60                            |
    Then I create tuition application until ExpenseInformationStep using API
    When I navigate to Agreements Information web page
    Then I should be on the Agreement page
      And I should see Enter your name exactly as it appears above text in agreementInstructionText field
    When I click the continueButton element
    Then I should see Please select scholarship/grant type text in grantsEligibleRadioGroupValidationText field
      And I should see Response Required text in sampleAgreementCheckboxValidationText field
      And I should see To accept agreement(s), you must type your name exactly as it appears above text in signatureValidationText field
    When I click the eligibleGrantsYesRadioLabel element
    Then I should see This field is required text in financialAidAmountValidationText field
    When I select Other from the financialAidDropdown
    Then I should see This field is required text in otherFinancialAidValidationText field
      And I enter Out Of Space Technology in otherFinancialAidInput textfield
      And I enter 175 in financialAidAmountInput textfield
    Then The exact text in otherFinancialAidInput field should be Out Of Space Technology
    When I click the following elements
      #| Element to click           |
      | eligibleGrantsYesRadioLabel |
      | agreement1Label             |
      And I select GI Bill from the financialAidDropdown
    Then The financialAidAmountInput is visible
    When I enter Auto Test2 in signatureInput textfield
    Then I should see To accept agreement(s), you must type your name exactly as it appears above text in signatureValidationText field
      And I refresh the page
    When I click the eligibleGrantsYesRadioLabel element
      And I select Discount from the financialAidDropdown
      And I enter 175 in financialAidAmountInput textfield
      And I click the following elements
      #| Element to click           |
      | eligibleGrantsYesRadioLabel |
      | agreement1Label             |
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112357     |
