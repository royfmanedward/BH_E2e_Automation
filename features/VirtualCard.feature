Feature: Virtual Card

  @SmokeTest
  Scenario Outline: TU5 Step 2: Verify user is able to submit VCard application - VCard Issued Status (C60075)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The currentDependentDropdownValue element is enabled
    When I select You from the selectDependentDropdown
      And I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Virtual Card radio dial from the programsRadioGroup
      And The educationProviderEditButton is visible
      And I click the educationProviderEditButton element
      And I enter Boston University in providerName textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | Math101       |
      | amountInput       | 1             |
      | creditHoursInput  | 1             |
      And I select Online from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test7 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And I verify the text below is present on the page
      #| Element                        | Text to verify      |
      | employeeProgramText             | Virtual Card        |
      | coursesExpensesRequested        | $1.00               |
      | coursesExpensesApproved         | $0.00               |
      | totalBenefitText                | $1.00               |
      | grantsScholarshipsDiscountsText | None $0.00          |
    When I enter Test Comment in summaryCommentInput textfield
      And I click the submitApplicationButton element
    Then I should be on the Submission page
      And The exact text in submissionStatusText should be Your application has been approved and a Virtual Credit Card has been issued.
      And The submissionConfirmationDescription is visible
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And I capture the current application ID from the url
      And The exact text in applicationStatus should be VIRTUAL CREDIT CARD ISSUED
      And The exact text in appStatusHistoryVirtualCreditCardIssued in the first appSummaryHistoryStatus should be VIRTUAL CREDIT CARD ISSUED
    When I scroll to coursesAndExpensesHeader element
    Then I verify the text below is present on the page
      #| Element                        | Text to verify      |
      | coursesExpensesRequested        | $1.00               |
      | coursesExpensesApproved         | $1.02               |
      | totalBenefitText                | $1.02               |
      | grantScholarshipDiscount        | None $0.00          |
    When I click on submittedApplicationActionMenuButton using jsExecutor
    Then The seeCreditCardDetailsButton is visible
      And The editApplicationButton is visible
      And The cancelApplicationButton is visible
    When I click the seeCreditCardDetailsButton element
    Then I should be on the VirtualCards page
      And I verify the text below is present on the page
      #| Element            | Text to verify   |
      | creditCardOwner     | Auto Test7       |
      | creditLineAmount    | $1.02            |
      | availableAmount     | $1.02            |
      | transactionsAmount  | $0.00            |
      And I verify No Transactions text is displayed
    When I navigate to previous page
    Then I should be on the Application page
      And The exact text in applicationStatus should be VIRTUAL CREDIT CARD ISSUED
    When I cancel an application from the Application Page Actions menu
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client  | username | password | stgTestCaseId | uatTestCaseId |  prodTestCaseId |
      | tu5demo | atest7   | Welcome1 | 122180        | 122190        |  126600         |

  @RegressionTest
  Scenario Outline: TU5 Virtual Card: Verify Unauthorized Transaction Display (C70151)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I click the appLinkNumber in first appActionNeededTile
    Then I should be on the Application page
      And The exact text in applicationStatus should be VIRTUAL CREDIT CARD ISSUED
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
      And I click the seeCreditCardDetailsButton element
    Then I should be on the VirtualCards page
      And I verify the text below is present on the page
      #| Element            | Text to verify   |
      | creditCardOwner     | Auto Test11      |
      | creditLineAmount    | $1.02            |
      | transactionsAmount  | $1.00            |
      | availableAmount     | $0.02            |
      And I verify cell 1 of fifthRow in table contains NOT AUTHORIZED
      And I verify cell 2 of fifthRow in table contains 5948624
      And I verify cell 3 of fifthRow in table contains 5844
      And I verify cell 4 of fifthRow in table contains American Airlines
      And I verify cell 5 of fifthRow in table contains $0.25
    When I hover on the element 1 of the list notAuthorizedTransactions
    Then The toolTip is visible
      And I validate content attribute value of toolTip is equal to The virtual account has expired.
    When I click the viewMoreLink element
    Then I verify number of notAuthorizedTransactions on the page should be 2
      And I verify cell 1 of sixthRow in table contains NOT AUTHORIZED
      And I verify cell 2 of sixthRow in table contains 5948624
      And I verify cell 3 of sixthRow in table contains 5844
      And I verify cell 4 of sixthRow in table contains Staples Promotional Prdct
      And I verify cell 5 of sixthRow in table contains $8.03
    When I hover on the element 2 of the list notAuthorizedTransactions
    Then The toolTip is visible
      And I validate content attribute value of toolTip is equal to The authorization amount exceeds the current amount on the virtual account.
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId  |
      | tu5demo    | atest11  | Welcome1 | 130837      |

  @LocalTest
  # NOTE: Moved to LocalTest as this relies on data outside of our control (AMEX API)
  Scenario Outline: TU5 Edit VC Application that is in Status 130 & Resubmit so it goes to Status 930 (C111455)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Virtual Card radio dial from the programsRadioGroup
      And I click the educationProviderEditButton element
    Then The providerName is visible
      And The providerSearchButton is visible
    When I enter Boston University in providerName textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
      And I wait until the providerSearchResultsTable is not visible
    Then I should be on the EducationInformation page
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 57 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 1             |
      | creditHoursInput  | 3             |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click on eligibleGrantsNoRadioLabel using jsExecutor
      And I click on agreement1Label using jsExecutor
      And I enter Auto Test7 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The submitApplicationButton element is enabled
    When I enter Test Required Comment in summaryCommentInput textfield
      And I click the submitApplicationButton element
    Then I should be on the Submission page
      And The appNumberSubmissionConfirmationPage element is enabled
    When I click the appNumberSubmissionConfirmationPage element
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be VIRTUAL CREDIT CARD ISSUED
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
      And I click the editApplicationButton element
      And I click the confirm element
      And I wait until the confirm is not visible
    Then The exact text in requestedText should be $1.00
      And The exact text in coursesExpensesApproved should be $0.00
      And The exact text in totalBenefitText should be $1.00
    When I click the programseEditButton element
    Then I should be on the EducationInformation page
      And The educationProviderEditButton is visible
    When I click the educationProviderEditButton element
    Then The providerName is visible
      And The providerSearchButton is visible
    When I enter Academy of Creative Hair Design in providerName textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
      And I wait until the providerSearchResultsTable is not visible
    Then I should be on the EducationInformation page
    When I click the continueButton element
    Then I should be on the Courses page
      And The editFirstCourseButton is visible
    When I click the continueButton element
    Then I should be on the Agreement page
      And The agreement1Label is visible
    When I click the agreement1Label element
      And I enter Auto Test7 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The exact text in requestedText should be $1.00
      And The exact text in coursesExpensesApproved should be $0.00
      And The exact text in totalBenefitText should be $1.00
      And The exact text in providerNameText should be Academy of Creative Hair Design
      And The submitApplicationButton element is enabled
    When I enter Test Required Comment in summaryCommentInput textfield
      And I click the submitApplicationButton element
    Then I should be on the Submission page
      And The appNumberSubmissionConfirmationPage element is enabled
    When I click on appNumberSubmissionConfirmationPage using jsExecutor
    Then I should be on the Application page
      And The exact text in applicationStatus should be DENIED
      And The exact text in providerNameText should be Academy of Creative Hair Design
      And The exact text in requestedText should be $1.00
      And The exact text in coursesExpensesApproved should be $0.00
      And The exact text in totalBenefitText should be $1.00
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
      And I click the seeCreditCardDetailsButton element
    Then I should be on the VirtualCards page
      And The creditLineAmount is not visible
      And The availableAmount is not visible
      And The transactionsAmount is not visible
      And The ccDeactivated is visible
      And The exact text in ccDeactivated should be DEACTIVATED
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest7   | Welcome1 | 112289     |

  @LocalTest
  # NOTE: Moved to LocalTest as this relies on data outside of our control (AMEX API)
  Scenario Outline: TU5 Edit VC Application that is in Status 130 & Resubmit so it goes to Status 100 (C111453)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value          |
      | Program                           | Virtual Card   |
      | Session Start Date from Today     | 0              |
      | Session End Date from Today       | 10             |
      | Comments                          | True           |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatus should be VIRTUAL CREDIT CARD ISSUED
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
      And I click the editApplicationButton element
      And I click the confirm element
      And I wait until the confirm is not visible
    Then I should be on the Application page
      And The exact text in requestedText should be $1.00
      And The exact text in coursesExpensesApproved should be $0.00
      And The exact text in totalBenefitText should be $1.00
      And The programseEditButton element is enabled
    When I click the programseEditButton element
    Then I should be on the EducationInformation page
      And The modalChangeProgButton element is enabled
    Then I click the modalChangeProgButton element
      And I wait until the modalChangeProgButton is not visible
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select Other from the FieldOfStudyDropdown
      And I enter Other in otherCourseOfStudyInput textfield
      And I check Virtual Card radio dial from the programsRadioGroup
      And I click the educationProviderEditButton element
      And I enter <provider> in searchProviderNameInput textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 1 days in sessionStartDateInput
      And I enter current date plus 20 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | Math101       |
      | amountInput       | 1             |
      | creditHoursInput  | 1             |
      And I select Online from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test5 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And I verify the text below is present on the page
      #| Element                        | Text to verify      |
      | coursesExpensesRequested        | $1.00               |
      | coursesExpensesApproved         | $0.00               |
      | totalBenefitText                | $1.00               |
      | grantsScholarshipsDiscountsText | None $0.00          |
    When I enter Test Comment in summaryCommentInput textfield
      And I click the submitApplicationButton element
    Then I should be on the Submission page
      And The exact text in submissionStatusText should be Your application has been Submitted - Pending Review
      And The appNumberSubmissionConfirmationPage is visible
      And The submissionIdLink is visible
    When I capture the application number submissionIdLink from the submission page
      And I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The exact text in applicationStatus should be SUBMITTED — PENDING REVIEW
    When I scroll to coursesAndExpensesHeader element
    Then I verify the text below is present on the page
      #| Element                        | Text to verify      |
      | coursesExpensesRequested        | $1.00               |
      | coursesExpensesApproved         | $0.00               |
      | totalBenefitText                | $1.00               |
      | grantScholarshipDiscount        | None $0.00          |
    When I scroll to submittedApplicationActionMenuButton element
      And I click the submittedApplicationActionMenuButton element
      And I click the seeCreditCardDetailsButton element
    Then I should be on the virtualCards page
      And I verify the text below is present on the page
      #| Element            | Text to verify   |
      | creditCardOwner     | Auto Test5       |
      | ccDeactivated       | DEACTIVATED      |
      | creditLineAmount    | $1.00            |
      | availableAmount     | $1.00            |
      | transactionsAmount  | $0.00            |
    When I navigate to previous page
    Then I should be on the Application page
    When I cancel an application from the Application Page Actions menu
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client  | username | password | provider        | testCaseId  |
      | tu5demo | atest5   | Welcome1 | Boston College  | 112290      |

  @RegressionTest
  Scenario Outline: TU5 Step 2: Verify user is able to submit VCard application - Denied Status (C60639)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Virtual Card radio dial from the programsRadioGroup
      And I click the educationProviderEditButton element
      And I enter <provider> in searchProviderNameInput textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 1             |
      | creditHoursInput  | 1             |
      And I select Online from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test5 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And I verify the text below is present on the page
      #| Element                        | Text to verify      |
      | employeeProgramText             | Virtual Card        |
      | coursesExpensesRequested        | $1.00               |
      | coursesExpensesApproved         | $0.00               |
      | totalBenefitText                | $1.00               |
      | grantsScholarshipsDiscountsText | None $0.00          |
    When I enter Test Comment in summaryCommentInput textfield
      And I click the submitApplicationButton element
    Then I should be on the Submission page
      And The exact text in submissionStatusText should be Your application has been Denied
      And The submissionConfirmationDescription is visible
      And The submissionIdLink element is enabled
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The exact text in applicationStatus should be DENIED
      And The exact text in appStatusHistoryDenied in the first appSummaryHistoryStatus should be DENIED
    When I scroll to coursesAndExpensesHeader element
    Then I verify the text below is present on the page
      #| Element                        | Text to verify      |
      | coursesExpensesRequested        | $1.00               |
      | coursesExpensesApproved         | $0.00               |
      | totalBenefitText                | $1.00               |
      | grantScholarshipDiscount        | None $0.00          |
      And I report test passing test status
    Examples:
      | client    | username  | password | provider               | testCaseId |
      | tu5demo   | atest5    | Welcome1 | Creations Hair Academy | 128629     |

  @RegressionTest
  Scenario Outline: TU5 Verify AppSummary & VCard page for VC app in Submitted Pending Review status with no transactions and cancel app (C60638)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select Other from the FieldOfStudyDropdown
      And I enter Other in otherCourseOfStudyInput textfield
      And I check Virtual Card radio dial from the programsRadioGroup
      And I click the educationProviderEditButton element
      And I enter <provider> in searchProviderNameInput textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 1 days in sessionStartDateInput
      And I enter current date plus 20 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Introduction to Math |
      | courseNumberInput | Math101              |
      | amountInput       | 1                    |
      | creditHoursInput  | 1                    |
      And I select Online from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test5 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And I verify the text below is present on the page
      #| Element                        | Text to verify      |
        | employeeProgramText             | Virtual Card        |
        | coursesExpensesRequested        | $1.00               |
        | coursesExpensesApproved         | $0.00               |
        | totalBenefitText                | $1.00               |
        | grantsScholarshipsDiscountsText | None $0.00          |
    When I enter Test Required Comment in summaryCommentInput textfield
      And I click the submitApplicationButton element
    Then I should be on the Submission page
      And The exact text in submissionStatusText should be Your application has been Submitted - Pending Review
      And The appNumberSubmissionConfirmationPage is visible
      And The submissionIdLink is visible
    When I capture the application number submissionIdLink from the submission page
      And I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The exact text in applicationStatus should be SUBMITTED — PENDING REVIEW
    When I scroll to coursesAndExpensesHeader element
    Then I verify the text below is present on the page
      #| Element                        | Text to verify      |
      | coursesExpensesRequested        | $1.00               |
      | coursesExpensesApproved         | $0.00               |
      | totalBenefitText                | $1.00               |
      | grantScholarshipDiscount        | None $0.00          |
    When I scroll to submittedApplicationActionMenuButton element
      And I click the submittedApplicationActionMenuButton element
      And I click the seeCreditCardDetailsButton element
    Then I should be on the virtualCards page
      And I verify the text below is present on the page
      #| Element         | Text to verify     |
      | creditCardOwner  | Auto Test5         |
      | ccPending        | APPROVAL PENDING   |
      And The application number is present within virtualCardApplicationsDropdown element
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And The appHistoryViewMoreApps is visible
    When I click the appNumberLink in first appHistoryTile
    Then I should be on the Application page
      And The exact text in applicationStatus should be SUBMITTED — PENDING REVIEW
    When I cancel an application from the Application Page Actions menu
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client    | username  | password | provider        | testCaseId |
      | tu5demo   | atest5    | Welcome1 | Boston College  | 112359     |

  @RegressionTest
  Scenario Outline: TU5: Verify user is able to submit VCard application - Submitted Incomplete (C60640)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The emailHomeRadio is not visible
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Virtual Card radio dial from the programsRadioGroup
      And I click the educationProviderEditButton element
      And I enter <provider> in searchProviderNameInput textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 100 days in sessionStartDateInput
      And I enter current date plus 160 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to OS   |
      | courseNumberInput | OS101         |
      | amountInput       | 1             |
      | creditHoursInput  | 1             |
      And I select Online from the instructionTypeDropdown
      And I click on taxAcknowledgement using jsExecutor
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click on eligibleGrantsNoRadioLabel using jsExecutor
      And I click on agreement1Label using jsExecutor
      And I enter Auto Test5 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And I verify the text below is present on the page
      #| Element                        | Text to verify      |
      | employeeProgramText             | Virtual Card        |
      | coursesExpensesRequested        | $1.00               |
      | coursesExpensesApproved         | $0.00               |
      | totalBenefitText                | $1.00               |
      | grantsScholarshipsDiscountsText | None $0.00          |
    When I enter Test Comment in summaryCommentInput textfield
      And I click the submitApplicationButton element
    Then I should be on the Submission page
      And I capture the current application ID from the url
      And The exact text in submissionStatusText should be Your application has been Submitted - Incomplete
      And The submissionConfirmationDescription is visible
      And The submissionIdLink element is enabled
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The submittedApplicationActionMenuButton is not visible
      And The appSummaryViewAllStatusHistoryBtn element is enabled
    When I click the appSummaryViewAllStatusHistoryBtn element
    Then The exact text in appStatusHistorySubmittedIncomplete in the first appSummaryHistoryStatus should be SUBMITTED — INCOMPLETE
      And The messageFromAutTest is visible
      And The exact text in messageFromAutTest should be From Program Rules
      And The statusHistoryMsg0 is visible
    When I scroll to expensesHeaderText element
    Then I verify the text below is present on the page
      #| Element                        | Text to verify      |
      | coursesExpensesRequested        | $1.00               |
      | coursesExpensesApproved         | $0.00               |
      | totalBenefitText                | $1.00               |
      | grantsScholarshipsDiscountsText | None $0.00          |
      And I report test passing test status
    Examples:
      | client  | username  | password | provider       | testCaseId |
      | tu5demo | atest5    | Welcome1 | Boston College | 128488     |

  @RegressionTest
  Scenario Outline: TU5 Step 5: Edit Virtual Card Application (that is NOT YET submitted) (C60898)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Work Address text from the addressRadioGroup group
      And I select the radio dial with Use Work Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Virtual Card radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
    When I clear the sessionStartDateInput field
      And I enter current date plus 0 days in sessionStartDateInput
      And I clear the sessionEndDateInput field
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
        #| Element          | Text to enter |
        | courseNameInput   | Intro to Math |
        | courseNumberInput | math101       |
        | amountInput       | 2             |
        | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
      And I wait until the addCourseButton is not visible
      And I click on continueButton using jsExecutor
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test1 in signatureInput textfield
      And I click on continueButton using jsExecutor
    Then I should be on the Application page
    #Edit to Step 1 (Contact)
    When I click the contactInformationEditButton element
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I click the continueButton element
    Then I should be on the EducationInformation page
    When I check Virtual Card radio dial from the programsRadioGroup
      And I click on continueButton using jsExecutor
    Then I should be on the Courses page
      And The editFirstCourseButton is visible
    When I click on continueButton using jsExecutor
    Then I should be on the Agreement page
    When I click on eligibleGrantsNoRadioLabel using jsExecutor
      And I click on agreement1Label using jsExecutor
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    #Verify Info Change from Contact page
    Then I should be on the Application page
      And The programseEditButton is visible
      And The exact text in phoneText should be 6178675309
    #Edit to step 2 (Program)
    When I click the programseEditButton element
    Then I should be on the EducationInformation page
    When I select Accounting and Finance from the FieldOfStudyDropdown
      And I check Virtual Card radio dial from the programsRadioGroup
      And I click on continueButton using jsExecutor
    Then I should be on the Courses page
      And I click on continueButton using jsExecutor
    Then I should be on the Agreement page
    When I click on eligibleGrantsNoRadioLabel using jsExecutor
      And I click on agreement1Label using jsExecutor
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    #Verify changes made during edit on Programs page reflect on Review & Submit page
    Then I should be on the Application page
      And The coursesAndExpensesEditButton is visible
      And The exact text in specialityText should be Accounting and Finance
    #Edit to step 3 (Courses and Expenses)
    When I click the coursesAndExpensesEditButton element
    Then I should be on the Courses page
      And The sessionEndDateInput is visible
      And The editFirstCourseButton is visible
    When I click the editFirstCourseButton element
      And I clear the amountInput field
      And I enter 3 in amountInput textfield
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
      And I click on continueButton using jsExecutor
    Then I should be on the Agreement page
    When I click on eligibleGrantsNoRadioLabel using jsExecutor
      And I click on agreement1Label using jsExecutor
      And I enter Auto Test1 in signatureInput textfield
      And I click on continueButton using jsExecutor
    Then I should be on the Application page
    #Verify changes made during edit on Courses Expenses page reflect on Review & Submit page
      And The agreementsEditButton is visible
      And The exact text in requestedText should be $3.00
    When I click the agreementsEditButton element
    Then I should be on the Agreement page
      And The eligibleGrantsYesRadioLabel is visible
    When I click on eligibleGrantsYesRadioLabel using jsExecutor    
      And I select GI Bill from the financialAidDropdown      
    Then The financialAidAmountInput is visible
      And I enter 4 in financialAidAmountInput textfield
      And I click on agreement1Label using jsExecutor
      And I enter Auto Test1 in signatureInput textfield
    When I click on continueButton using jsExecutor
    Then I should be on the Application page
    #Verify changes made during edit on Agreements page reflect on Review & Submit page
    When The agreementsEditButton is visible
    Then I verify the text below is present on the page
      #| Element                        | Text to verify                |
      | phoneText                       | 6178675309                    |
      | emailText                       | tamssupport@edassist.com      |
      | employeeProgramText             | Virtual Card                  |
      | educationProgramText            | Associate's Degree            |
      | specialityText                  | Accounting and Finance        |
      | providerNameText                | Boston University             |
      | providerCodeText                | T22768                        |
      | requestedText                   | $3.00                         |
      | totalBenefitText                | $3.00                         |
      | grantsScholarshipsDiscountsText | GI Bill $4.00                 |
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112360     |

  @LocalTest
  # NOTE: Moved to LocalTest as this relies on data outside of our control (AMEX API)
  Scenario Outline: TU5 Virtual Card details - Verify Application drop-down and managed content (C64112)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value           |
      | Program                           | Virtual Card    |
      | Session Start Date from Today     | 0               |
      | Session End Date from Today       | 60              |
      | Comments                          | true            |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And I capture the current application ID from the url
      And The submittedApplicationActionMenuButton is visible
    When I click the submittedApplicationActionMenuButton element
      And I click the seeCreditCardDetailsButton element
    Then I should be on the VirtualCards page
      And The exact text in headerLabel should be Application
      And The virtualCardBenefitPeriodDropdown is visible
      And The virtualCardApplicationsDropdown is visible
      And The creditCardOwner is visible
      And I should see Use this virtual card for education purchases made online, in the mail, or over the phone. Check with your vendor to see if it will be accepted at a physical store or other point of sale. text in creditCardDetailSummaryText field
      And The creditCardCompanyImage is visible
    When I click the virtualCardApplicationsDropdown element
      And I click the thirdVcardAppSelect element
    Then I should be on the VirtualCards page
      And The creditCardOwner is visible
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112361     |

  @LocalTest
  # NOTE: Moved to LocalTest as this relies on data outside of our control (AMEX API)
  Scenario Outline: TU5 Step 2: Virtual Card - Verify Approved Amount with buffer (C64113)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Work Address text from the addressRadioGroup group
      And I select the radio dial with Use Work Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Virtual Card radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
      And The sessionStartDateInput is visible
      And I clear the sessionStartDateInput field
    When I enter current date plus 0 days in sessionStartDateInput
    Then The sessionEndDateInput is visible
    When I clear the sessionEndDateInput field
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
        #| Element          | Text to enter |
        | courseNameInput   | Intro to Math |
        | courseNumberInput | math101       |
        | amountInput       | 2             |
        | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
    When I scroll to continueButton element
      And I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
    When I verify the text below is present on the page
      #| Element                        | Text to verify                |
      | employeeProgramText             | Virtual Card                  |
      | educationProgramText            | Associate's Degree            |
      | providerNameText                | Boston University             |
      | requestedText                   | $2.00                         |
      | totalBenefitText                | $2.00                         |
    When I enter Test Required Comment in summaryCommentInput textfield
      And I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
    And The submittedApplicationActionMenuButton is visible
    When I click the submittedApplicationActionMenuButton element
    Then The seeCreditCardDetailsButton is visible
    When I click the seeCreditCardDetailsButton element
    Then I should be on the VirtualCards page
      And The creditLineAmount is visible
      And The exact text in creditLineAmount should be <bufferamount>
      And The transactionsAmount is visible
      And The availableAmount is visible
      And The exact text in availableAmount should be <bufferamount>
      And I report test passing test status
    Examples:
      | client    | username  | password | bufferamount | testCaseId |
      | tu5demo   | atest1    | Welcome1 | $2.04        | 112377     |

  @LocalTest
  # NOTE: Moved to LocalTest as this relies on data outside of our control (AMEX API)
  Scenario Outline: TU5 Virtual Card: Edit VC Application in Status 130 & Resubmit so it goes to 130 Status (C73142)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the EducationInformation page
    When I select You from the selectDependentDropdown
      And I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Virtual Card radio dial from the programsRadioGroup
      And I click the educationProviderEditButton element
    Then The providerName is visible
      And The providerSearchButton is visible
    When I enter Boston University in providerName textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
      And I wait until the providerSearchResultsTable is not visible
    Then I should be on the EducationInformation page
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 57 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 1             |
      | creditHoursInput  | 3             |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test7 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The submitApplicationButton element is enabled
    When I enter Test Required Comment in summaryCommentInput textfield
      And I click the submitApplicationButton element
    Then I should be on the Submission page
      And The appNumberSubmissionConfirmationPage element is enabled
    When I click the appNumberSubmissionConfirmationPage element
    Then I should be on the Application page
      And The exact text in applicationStatus should be VIRTUAL CREDIT CARD ISSUED
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
      And I click the editApplicationButton element
      And I click the confirm element
      And I wait until the confirm is not visible
      And The exact text in requestedText should be <requestedAmount>
      And The exact text in coursesExpensesApproved should be $0.00
      And The exact text in totalBenefitText should be <requestedAmount>
    Then I click the programseEditButton element
      And I should be on the EducationInformation page
      And I clear the studentIDInput field
      And I enter <studentID> in studentIDInput textfield
      And I click the continueButton element
      And I should be on the Courses page
      And The editFirstCourseButton is visible
    When I click the editFirstCourseButton element
      And I clear the amountInput field
      And I enter 2.00 in amountInput textfield
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
      And I click the continueButton element
    Then I should be on the Agreement page
      And The agreement1Label is visible
    When I click the agreement1Label element
      And I enter Auto Test7 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The exact text in requestedText should be $2.00
      And The exact text in coursesExpensesApproved should be $0.00
      And The exact text in totalBenefitText should be $2.00
      And The submitApplicationButton element is enabled
      And I enter Test Required Comment in summaryCommentInput textfield
      And I click the submitApplicationButton element
      And I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The exact text in applicationStatus should be VIRTUAL CREDIT CARD ISSUED
      And The exact text in requestedText should be $2.00
      And The exact text in coursesExpensesApproved should be $2.04
      And The exact text in totalBenefitText should be $2.04
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
      And I click the seeCreditCardDetailsButton element
    Then I should be on the VirtualCards page
      And The exact text in creditLineAmount should be $2.04
      And The exact text in availableAmount should be $2.04
      And The exact text in transactionsAmount should be <transactions>
    When I navigate to previous page
    Then I should be on the Application page
    When The submittedApplicationActionMenuButton element is enabled
      And I click the submittedApplicationActionMenuButton element
      And I click the cancelApplicationButton element
      And I enter cancel application in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client  | username | password | studentID | requestedAmount | transactions  | testCaseId |
      | tu5demo | atest7   | Welcome1 | 3456      | $1.00           | $0.00         | 112384     |

  @RegressionTest
  Scenario Outline: TU5 Verify Participant Name Dropdown functionality on VCard page Client Admin Application (C125583)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The adminNav in the header component is enabled
    When I click the adminNav in the Header component
    Then I should be on the ClientAdminUsageOverview page
    When I click the link with text Search Users & Applications
    Then I should be on the ClientAdmin page
    When I enter atest1 in clientAdminIdSearchInput textfield
      And I click on clientAdminAdvanceSearchButton using jsExecutor
      And I select Virtual Credit Card Issued from the clientAdminAppStatusDropdown
      And I click on clientAdminSearchButton using jsExecutor
    Then The dataTable is visible
      And The vcPageLink is visible
    When I click the vcPageLink element
    Then I should be on the VirtualCards page
      And The exact text in participantTypeaheadInput field should be Auto Test3 (ATest3)
    When I click the participantTypeaheadInput element
    Then I should not see Auto Test3 (ATest3) text in participantTypeaheadInput element
      And I report test passing test status
    Examples:
      | client  | username  | password | testCaseId |
      | tu5demo | atest3    | Welcome1 | 133579     |

  @RegressionTest
  Scenario Outline: Virtual Credit Card button display for VC App < 130 status (C108828)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The currentDependentDropdownValue element is enabled
    When I select You from the selectDependentDropdown
    Then I should see Select text in degreeObjectiveButton field
    When I select Certification/Designation from the educationProgramDropdown
      And I select Other from the FieldOfStudyDropdown
      And I enter Ocs in otherCourseOfStudyInput textfield
      And I check Virtual Card Certification program radio dial from the programsRadioGroup
      And I click the examLabel element
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
    When I fillout specified text fields with the following text
      #| Element   | Text to enter |
      | examName   | Weird Science |
      | examAmount | 1.00          |
      And I enter current date plus 15 days in examDate
      And I click the taxAcknowledgement element
      And I click the addExamButton element
      And I wait until the addExamButton is not visible
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test9 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The exact text in applicationStatusHeaderStatus should be SUBMITTED — PENDING REVIEW
    When I click the submittedApplicationActionMenuButton element
      And The seeCreditCardDetailsButton element is enabled
    Then The cancelApplicationButton element is enabled
    When I click the editApplicationButton element
    Then I should be on the Application page
    When I click the programseEditButton element
    Then I should be on the EducationInformation page
      And I select Accounting from the FieldOfStudyDropdown
      And I check Virtual Card Certification program radio dial from the programsRadioGroup
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | agreement1Label            |
      And I enter Auto Test9 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
    When I click the submitApplicationButton element
    Then I should be on the Submission page
      And The submissionConfirmationDescription is visible
      And The submissionIdLink element is enabled
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
    When I click the submittedApplicationActionMenuButton element
    Then I should be on the Application page
    When I click on submittedApplicationActionMenuButton using jsExecutor
    Then The cancelApplicationButton is visible
      And The editApplicationButton is not visible
      And I report test passing test status
    Examples:
      | client    | username  | password |  testCaseId  |
      | tu5demo   | atest9    | Welcome1 |  T144291     |
