Feature: New Application (Tuition)

  @RegressionTest
  Scenario Outline: TU5 User can create a new Tuition Assistance Program and without document - upload optional (C53801)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I submit a new application: program = Tuition Reimbursement Program, expense type = NA, user = Auto Test1, start date from today = 1, end date from today = 60, comment = false and upload = false
    Then I should be on the Submission page
      And The submissionIdLink is visible
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
    When I cancel an application from the Application Page Actions menu
    Then I should be on the Home page
    When I log out
    Then I should be on the Login page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 122179     |

  @SmokeTest
  Scenario Outline: TU5  Application submission with a comment and a document upload ( document upload optional) and Supervisor approval(C41705)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I submit a new application: program = Tuition Reimbursement Program, expense type = NA, user = Auto Test1, start date from today = 1, end date from today = 60, comment = true and upload = true
    Then I should be on the Submission page
      And The submissionIdLink element is enabled
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The signedAgreementDate is visible
      And The current date is present in signedAgreementDate field with format MMM dd yyyy
      And The supportingDocument1 is visible
    When I capture the current application ID from the url
      And I log out
    Then I should be on the login page
    When I login with <supervisor> username and <supervisorPw> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The approveApplicationButton element is enabled
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I enter Test Comment by Supervisor in approveApplicationCommentTextInput textfield
      And I click the approveApplicationWithCommentsButton element
      And I wait until the approveApplicationWithCommentsButton is not visible
    Then I should be on the Application page
      And The applicationStatus element is enabled
      And The exact text in applicationStatus should be APPROVED
    When I log out
    Then I should be on the Login page
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The selectFileLink is visible
    When I upload TestFile.pdf file using the sharedFileUpload component
    Then Text in uploadDocSuccessMessage field is present
    When I select Grades from the documentTypeDropdown
    Then The gradeListBox is visible
    When I select B from the gradeListBox
      And I enter Test:Uploaded grade document. in commentText textfield
      And I click the submitDocumentButton element
    Then The supportingDocument1 is visible
      And The exact text in supportingDocument1 should be Grades
      And I should be on the Application page
    When I cancel an application from the Application Page Actions menu
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client  | username | password | supervisor | supervisorPw | stgTestCaseId | uatTestCaseId | prodTestCaseId |
      | tu5demo | atest1   | Welcome1 | atest2     | Welcome1     | 112584        | 122186        | 126596         |

  @RegressionTest
  Scenario Outline: TU5 User can complete a Saved Not Submitted application (C1902)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Home Address text from the addressRadioGroup group
      And I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
      And I capture the current application ID from the url
      And The cancelButton element is enabled
      And I click the cancelButton element
      And I click the saveApplicationForLaterButton element
    Then I should be on the Home page
      And I navigate to the current application summary page
    Then I should be on the Application page
    When I click the coursesAndExpensesEditButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 125           |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
    When I click the submitApplicationButton element
    Then I should be on the Submission page
      And The submissionIdLink element is enabled
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
    When The viewMoreAgreementButton element is enabled
      And I click the viewMoreAgreementButton element
    Then The agreement1Label is visible
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112404     |

  @RegressionTest
  Scenario Outline: TU5 Step 2: Verify popup for "Warn of Ineligible Accreditation" as indicated in program setup (C1780)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Home Address text from the addressRadioGroup group
      And I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the educationProviderEditButton element
      And I enter <provider> in searchProviderNameInput textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
    Then I click the studentIDModalCloseButton element
      And I report test passing test status
    Examples:
      | client  | username | password | provider                   | testCaseId |
      | tu5demo | atest1   | Welcome1 | A Cut Above Beauty College | 112405     |

  @RegressionTest
  Scenario Outline: TU5 Step 2: Verify the Accreditation listed in drop-down are as indicated in program setup (C1781)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Home Address text from the addressRadioGroup group
      And I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the educationProviderEditButton element
      And I select AABI from the providerAccreditationDropdown
      And I select BAE Systems, Inc from the providerAccreditationDropdown
      And I select Cone Health from the providerAccreditationDropdown
      And I select EMC from the providerAccreditationDropdown
      And I select Houston Methodist from the providerAccreditationDropdown
      And I select Kettering Health Network from the providerAccreditationDropdown
      And I select NCA from the providerAccreditationDropdown
      And I select The University of Wisconsin Hospitals & Clinics from the providerAccreditationDropdown
      And I select Toyota from the providerAccreditationDropdown
      And I select WS from the providerAccreditationDropdown
    Then I should not see USG text in one of the providerAccreditationDropdowns fields
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112406     |

  @RegressionTest
  Scenario Outline: TU5 Step 3: Verify Program Completion doesn't show when it's disabled (C37386)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And The yourAddressHeaderText is visible
    When I select the radio dial with Use Home Address text from the addressRadioGroup group
      And I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
    Then The degreeCompleteYesLabel is not visible
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112417     |

  @RegressionTest
  Scenario Outline: TU5 Verify Eligible Document Types dropdown matches what is indicated in program setup (C1792)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And The yourAddressHeaderText is visible
      And I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 125           |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
    Then I wait until the addCourseButton is not visible
      And The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
      And I scroll to continueButton element
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
    When I upload TestFile.pdf file using the sharedFileUpload component
      And The uploadDocSuccessMessage is visible
    Then Text in uploadDocSuccessMessage field is present
      And The cancelDocumentButton is visible
    When I select Corrections from the documentTypeDropdown
      And I select Grades from the documentTypeDropdown
      And I select Proof of Payment from the documentTypeDropdown
      And I select Proof of Enrollment from the documentTypeDropdown
      And I select Invoice from the documentTypeDropdown
      And I click the cancelButton element
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112439     |

  @RegressionTest
  Scenario Outline: TU5 Verify that Degree Comparison Company Approval Bypass is not active (C34348)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                         |
      | Program                           | Tuition Reimbursement Program |
      | Session Start Date from Today     | 1                             |
      | Session End Date from Today       | 60                            |
      | Comments                          | true                          |
    Then I create tuition application using API
    When I navigate to the current application summary page
      And I capture the current application ID from the url
      And I log out
    Then I should be on the Login page
    When I login with <supervisor> username and <supervisorPw> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And I wait until the coursesAndExpensesEditButton is not visible
      And The approveApplicationButton is visible
      And I should see $ text in requestedText field
      And I should see $ text in coursesExpensesRequested field
      And I should see $ text in coursesExpensesApproved field
      And I should see $ text in totalBenefitText field
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I click the approveApplicationWithCommentsButton element
    Then I should be on the Application page
    When I log out
    Then I should be on the Login page
      And I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Home Address text from the addressRadioGroup group
      And I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 125           |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
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
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
    When I click the submitApplicationButton element
    Then I should be on the Submission page
      And The submissionStatusText is visible
      And I should see Your application has been Forwarded to Supervisor For Review text in submissionStatusText field
      And I report test passing test status
    Examples:
      | client  | username | password | supervisor | supervisorPw | testCaseId |
      | tu5demo | atest1   | Welcome1 | atest2     | Welcome1     | 112440     |

  @RegressionTest
  Scenario Outline: TU5 Verify Client Admin can approve application on behalf of Approver 1(C82680)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                          |
      | Program                           | Tuition Reimbursement Program  |
      | Session Start Date from Today     | 1                              |
      | Session End Date from Today       | 10                             |
      | Comments                          | true                           |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And I should see FORWARDED TO SUPERVISOR FOR REVIEW text in one of the appSummaryHistoryStatus fields
      And The signedAgreementDate is visible
      And The current date is present in signedAgreementDate field with format MMM dd yyyy
    When I capture the current application ID from the url
      And I log out
    Then I should be on the Login page
    When I login with <clientAdmin> username and <clientAdminPw> password
    Then I should be on the Home page
      And The scheduleFreeAdvisingLink is visible
      And The adminNav in the Header component is visible
    When I click the adminNav in the Header component
      And I click the link with text Search Users & Applications
    Then I should be on the ClientAdmin page
    When The adminPageAdvancedSearch element is enabled
      And I click the adminPageAdvancedSearch element
      And I enter atest6 in clientAdminIdSearchInput textfield
      And I select Forwarded to Supervisor For Review from the clientAdminAppStatusDropdown
      And I click the clientAdminSearchButton element
    Then The dataTable is visible
    When The appHistoryLink element is enabled
      And I click the appHistoryLink element
    Then I should be on the ApplicationHistory page
      And The exact text in applicationHistoryHeader should be Application History
      And The appNumberLink in the first appHistoryTile is visible
    When I click the appNumberLink in first appHistoryTile
    Then I should be on the Application page
      And I should see FORWARDED TO SUPERVISOR FOR REVIEW text in one of the appSummaryHistoryStatus fields
      And The denyApplicationButton element is enabled
      And I scroll to approveApplicationButton element
    When The approveApplicationButton element is enabled
      And I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I click the approveApplicationWithCommentsButton element
      And I wait until the approveApplicationWithCommentsButton is not visible
    Then I should be on the Application page
      And The submittedApplicationSavedBanner is visible
      And The exact text in applicationStatus should be APPROVED
      And The exact text in statusHistoryMsg1 should be Client Admin bypassing Approver #1 and approving the application
    When I log out
    Then I should be on the Login page
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And I wait until the loadingSpinner is not visible
      And I should see APPROVED text in one of the appSummaryHistoryStatus fields
      And The exact text in statusHistoryMsg1 should be Client Admin bypassing Approver #1 and approving the application
      And I report test passing test status
    Examples:
      | client  | username | password | clientAdmin | clientAdminPw | testCaseId |
      | tu5demo | atest6   | Welcome1 | atest3      | Welcome1      | 117513     |

  @RegressionTest
  Scenario Outline: TU5 Step 3: When Currency = USD (default) (C91417)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The actionNeededHeader element is enabled
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Master's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
      And The sessionStartDateInput is visible
      And The exact text in sessionInformationHeaderText should be Session Information
    When I enter current date plus 15 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
    Then The addCourseAndExpensesButton element is enabled
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 1             |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
    Then The addCourseButton element is enabled
    When I click the addExpenseButton element
    Then The cancelExpenseButton element is enabled
      And I verify combinedExpenses contains $ text
      And I verify number of dollarSymbols on the page should be 2
    When I select Course Related from the otherExpenseType
      And I enter 1 in expenseAmount textfield
      And I click the saveExpenseButton element
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
    When I click the addExpenseButton element
      And The saveExpenseButton element is disabled
      And I select Administrative Fee from the expenseTypeDropdown
      And I enter 1 in expenseAmount textfield
    Then I verify combinedExpenses contains $ text
      And I verify number of dollarSymbols on the page should be 1
    When I click the taxAcknowledgement element
    Then The saveExpenseButton element is enabled
    When I click the saveExpenseButton element
    Then The removeFirstOtherExpenseButton is visible
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsYesRadioLabel element
    Then The financialAidDropdown is visible
    When I select Pell Grant from the financialAidDropdown
      And I enter 175 in financialAidAmountInput textfield
      And I verify number of dollarSymbols on the page should be 1
      And I click the following elements
      #| Element to click           |
      | eligibleGrantsYesRadioLabel |
      | agreement1Label             |
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
    When I click the nonCourseExpenseViewMoreBtn element
    Then I should see $1.00 text in nonCourseExpensesRequestedAmt field
      And I should see $0.00 text in nonCourseExpensesApprovalAmt field
      And I should see $0.00 text in nonCourseExpensesPaidAmt field
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 119965     |

  @RegressionTest
  Scenario Outline: TU5 Verify Client Admin can approve application on behalf of both Approver1 & Approver2 one by one (C125736)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                |
      | Program                           | Direct Bill Program  |
      | Session Start Date from Today     | -10                  |
      | Session End Date from Today       | -1                   |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And I should see FORWARDED TO SUPERVISOR FOR REVIEW text in one of the appSummaryHistoryStatus fields
      And The signedAgreementDate is visible
      And The current date is present in signedAgreementDate field with format MMM dd yyyy
    When I capture the current application ID from the url
      And I log out
    Then I should be on the Login page
    When I login with <clientAdmin> username and <clientAdminPw> password
    Then I should be on the Home page
      And The scheduleFreeAdvisingLink is visible
      And The adminNav in the Header component is visible
    When I click the adminNav in the Header component
      And I click the link with text Search Users & Applications
    Then I should be on the ClientAdmin page
    When The adminPageAdvancedSearch element is enabled
      And I click the adminPageAdvancedSearch element
      And I enter atest6 in clientAdminIdSearchInput textfield
      And I select Forwarded to Supervisor For Review from the clientAdminAppStatusDropdown
      And I click the clientAdminSearchButton element
    Then The dataTable is visible
    When The appHistoryLink element is enabled
      And I click the appHistoryLink element
    Then I should be on the ApplicationHistory page
      And The exact text in applicationHistoryHeader should be Application History
      And The appNumberLink in the first appHistoryTile is visible
    When I click the appNumberLink in first appHistoryTile
    Then I should be on the Application page
      And I should see FORWARDED TO SUPERVISOR FOR REVIEW text in one of the appSummaryHistoryStatus fields
      And The denyApplicationButton element is enabled
      And I scroll to approveApplicationButton element
    When The approveApplicationButton element is enabled
      And I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I click the approveApplicationWithCommentsButton element
      And I wait until the approveApplicationWithCommentsButton is not visible
    Then I should be on the Application page
      And The submittedApplicationSavedBanner is visible
      And The exact text in applicationStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
      And The exact text in statusHistoryMsg3 should be Client Admin bypassing Approver #1 and approving the application
    When I log out
    Then I should be on the Login page
    When I login with <clientAdmin> username and <clientAdminPw> password
    Then I should be on the Home page
      And The adminNav in the Header component is visible
    When I click the adminNav in the Header component
      And I click the link with text Search Users & Applications
    Then I should be on the ClientAdmin page
    When The adminPageAdvancedSearch element is enabled
      And I click the adminPageAdvancedSearch element
      And I enter atest6 in clientAdminIdSearchInput textfield
      And I select Forwarded to Supervisor For Review from the clientAdminAppStatusDropdown
      And I click the clientAdminSearchButton element
    Then The dataTable is visible
    When The appHistoryLink element is enabled
      And I click the appHistoryLink element
    Then I should be on the ApplicationHistory page
      And The exact text in applicationHistoryHeader should be Application History
      And The appNumberLink in the first appHistoryTile is visible
    When I click the appNumberLink in first appHistoryTile
    Then I should be on the Application page
      And The denyApplicationButton element is enabled
      And I scroll to approveApplicationButton element
    When The approveApplicationButton element is enabled
      And I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I click the approveApplicationWithCommentsButton element
      And I wait until the approveApplicationWithCommentsButton is not visible
    Then I should be on the Application page
      And The submittedApplicationSavedBanner is visible
      And The exact text in applicationStatus should be LETTER OF CREDIT (LOC) ISSUED
      And The exact text in statusHistoryMsg3 should be Client Admin bypassing Approver #1 and approving the application
      And The exact text in statusHistoryMsg1 should be Client Admin bypassing Approver #2 and approving the application
      And The exact text in statusHistoryMsg0 should be Application approved
    When I log out
    Then I should be on the Login page
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
    And I wait until the loadingSpinner is not visible
      And I should see LETTER OF CREDIT (LOC) ISSUED text in one of the appSummaryHistoryStatus fields
      And The exact text in statusHistoryMsg3 should be Client Admin bypassing Approver #1 and approving the application
      And The exact text in statusHistoryMsg1 should be Client Admin bypassing Approver #2 and approving the application
      And The exact text in statusHistoryMsg0 should be Application approved
      And I report test passing test status
    Examples:
      | client  | username | password | clientAdmin | clientAdminPw | testCaseId |
      | tu5demo | atest6   | Welcome1 | atest3      | Welcome1      | 120143     |

  @RegressionTest
  Scenario Outline: TU5 Other Reimbursement Application Creation: Payment Preference = NO (C57654)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the home page
      And The NewApplicationButton in the Header component is visible
      And The edGoalsTile is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And  The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
    When I click the firstEdGoal element
      And The educationProviderEditButton is not visible
    Then I check Direct Bill radio dial from the programsRadioGroup
    When I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus -20 days in sessionStartDateInput
      And I clear the sessionEndDateInput field
      And I enter current date plus -15 days in sessionEndDateInput
    Then The addCourseAndExpensesButton element is enabled
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 1             |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I click the agreement1Label element
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And I capture the current application ID from the url
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I log out
    Then I should be on the Logout page
    When I login with <supervisor1> username and <supervisor1Pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the home page
    When I navigate to the current application summary page
    Then I should be on the application page
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I enter Test Comment by Supervisor in approveApplicationCommentTextInput textfield
      And I click the approveApplicationWithCommentsButton element
      And I wait until the approveApplicationWithCommentsButton is not visible
    Then I should be on the Application page
    When I log out
    Then I should be on the Logout page
    When I login with <supervisor2> username and <supervisor2Pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the home page
    When I navigate to the current application summary page
    Then I should be on the application page
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I enter Test Comment by Supervisor in approveApplicationCommentTextInput textfield
      And I click the approveApplicationWithCommentsButton element
      And I wait until the approveApplicationWithCommentsButton is not visible
    Then I should be on the Application page
    When I log out
    Then I should be on the Logout page
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the home page
    When I navigate to the current application summary page
    Then I should be on the application page
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
      And I click the addOtherExpenseButton element
    Then I should be on the application page
      And The paymentPreferenceSave is not visible
      And The paymentPreferenceCheckLabel is not visible
      And The paymentPreferenceEDepositLabel is not visible
    When I click the cancelApplicationButton element
      And I click the deleteApplicationButton element
    Then I should be on the application page
      And I report test passing test status
    Examples:
      | client     | username | password | supervisor1 | supervisor1Pw | supervisor2 | supervisor2Pw | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | atest2      | Welcome1      | atest3      | Welcome1      | 130856     |

  @RegressionTest
  Scenario Outline: TU5 Verify EdAccess Learn More page (C151270)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The edAccessMoreInfo element is enabled
    When I click on edAccessMoreInfo using jsExecutor
    Then I should be on the EdAccessLearnMore page
      And I verify number of fastTrackLogoList on the page should be 1
      And Text in fastTrackDescription field is present
      And I verify number of providerLogoList on the page should be 6
      And I verify number of providerDescriptionList on the page should be 6
      And Text in providerDescription field is present
    When I click on providerLearnMore using jsExecutor
    Then The modalSubmitBtn is visible
    When I click the modalSubmitBtn element
    Then If button modalSubmitBtn text is GO TO THIS SCHOOL'S WEBSITE a click should not land on a BrightHorizons page
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 121908     |

  @RegressionTest
  Scenario Outline: TU5 Verify that users who select non-EdAccess providers can create applications (C166114)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Master's Degree from the educationProgramDropdown
      And I select Business from the FieldOfStudyDropdown
      And I click the educationProviderEditButton element
    Then The providerName is visible
      And The providerSearchButton is visible
    When I enter Walden University in providerName textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
    Then I should be on the EducationInformation page
    When I click the providerReviewCheckbox element
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
        #| Element          | Text to enter  |
        | courseNameInput   | Intro to Math  |
        | courseNumberInput | math101        |
        | amountInput       | 125            |
        | creditHoursInput  | 1              |
        | courseWebAddress  | www.google.com |
      And I select Classroom from the instructionTypeDropdown
      And I click the courseScheduleDay0 element
      And I click the courseStartTime0 element
      And I click the courseStartTime0Option0 element
      And I click the courseEndTime0 element
      And I click the courseEndTime0Option1 element
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
    When I click the degreeCompleteNoRadio element
    Then I enter current date plus 90 days in expectedGraduationDateInput
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
    When I click the submitApplicationButton element
    Then I should be on the Submission page
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 126714     |

  @RegressionTest
  Scenario Outline: Verify display of configured subscription payment amount (C151277)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Education Access - Reimbursement radio dial from the programsRadioGroup
      And I wait 500 milliseconds for an element
      And The waldenUniversityProvider is visible
      And I click the waldenUniversityProvider element
      And The providerInstructionCheckBox element is enabled
      And I click on providerInstructionCheckBox using jsExecutor
    When The continueButton element is enabled
      And I click the continueButton element
    Then I should be on the Courses page
      And The exact text in subscriptionAmount field should be 1000
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click on subscriptionTaxQ12 using jsExecutor
      And I click the addExpenseButton element
      And I enter 100 in expenseAmount textfield
      And I click the expenseRelatedTaxYesOption element
      And I click the saveExpenseButton element
      And I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And I should see $1,000.00 text in edAccessSubscriptionCost field
      And I should see $1,100.00 text in totalBenefitText field
      And I should see No text in edAccessSubscriptionTaxExempt field
    When I click the courseExpenseViewMoreBtn element
    Then I should see $100 text in nonCourseExpensesRequestedAmt field
      And I should see YES text in maintainSkillsQuestion field
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And I should see $1,000.00 text in edAccessSubscriptionCost field
      And I should see $1,100.00 text in totalBenefitText field
      And I should see No text in edAccessSubscriptionTaxExempt field
    When I click the courseExpenseViewMoreBtn element
    Then I should see $100 text in nonCourseExpensesRequestedAmt field
      And I should see YES text in maintainSkillsQuestion field
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 121936     |

  @RegressionTest
  Scenario Outline: TU5 Verify adding Amount by Course (C159195)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The actionNeededHeader is visible
      And The NewApplicationButton in the Header component is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Education Access - Reimbursement radio dial from the programsRadioGroup
      And The westernGovernorsProvider is visible
      And I click the westernGovernorsProvider element
    Then The continueButton element is enabled
    When I click on continueButton using jsExecutor
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
        #| Element          | Text to enter |
        | courseNameInput   | Intro to Math |
        | courseNumberInput | math101       |
        | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
    Then The exact text in courseRequestedAmount field should be 875
    When I click the addCourseButton element
    Then The editFirstCourseButton is visible
      And The subscriptionTaxQ1 is not visible
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
        #| Element          | Text to enter   |
        | courseNameInput   | Intro to Math 2 |
        | courseNumberInput | math101         |
        | creditHoursInput  | 1               |
      And I select Classroom from the instructionTypeDropdown
      And I select Classroom from the instructionTypeDropdown
    Then The exact text in courseRequestedAmount field should be 875
    When I click the addCourseButton element
    Then The editFirstCourseButton is visible
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The signatureInput is not visible
      And I should see $1,750.00 text in totalBenefitText field
      And I should see $875.00 text in courseRequested field
    When I click the submitApplicationButton element
    Then I should be on the Submission page
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 124307     |

  @RegressionTest
  Scenario Outline: TU5 Verify display of configured unit payment amount (C151280)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The scheduleFreeAdvisingLink is visible
    When I click the NewApplicationButtonEABanner element
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Education Access - Reimbursement radio dial from the programsRadioGroup
      And I select the radio dial with Colorado State University Global Campus text from the edAccessProvidersRadioGroup group
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
    Then The exact text in courseRequestedAmount field should be 0
    When I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | creditHoursInput  | 2             |
      And I select Classroom from the instructionTypeDropdown
    Then The exact text in courseRequestedAmount field should be 582
    When I click the addCourseButton element
    Then The editFirstCourseButton is visible
      And The subscriptionTaxQ1 is not visible
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter   |
      | courseNameInput   | Intro to Math 2 |
      | courseNumberInput | math101         |
      | creditHoursInput  | 2               |
      And I select Classroom from the instructionTypeDropdown
    Then The exact text in courseRequestedAmount field should be 582
    When I click the addCourseButton element
    Then The editFirstCourseButton is visible
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The signatureInput is not visible
      And I should see $1,164.00 text in totalBenefitText field
      And I should see $582.00 text in courseRequested field
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
    When I cancel an application from the Application Page Actions menu
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 121948     |

  @RegressionTest
  Scenario Outline: TU5 Verify NON currency properly removes currency symbol (C94544)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The programDropdown element is enabled
      And The tuitionProgramManagement is not visible
    When I select Graduate Degree Program from the programDropdown
      And The degreeDropdown element is enabled
      And I select Master's Degree from the degreeDropdown
    Then The PeriodsDropdown element is enabled
    When I select 2019 from the PeriodsDropdown
    Then I should not see $ text in programBenefitPaidAmount element
      And I should not see $ text in programBenefitRequestedAmount element
      And I should not see $ text in programBenefitRemainingAmount element
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Master's Degree from the educationProgramDropdown
      And I select Business from the FieldOfStudyDropdown
      And I click the educationProviderEditButton element
      And I enter Walden University in providerName textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
    Then I should be on the EducationInformation page
    When I click the providerReviewCheckbox element
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the degreeCompleteNoRadio element
      And The degreeCompleteNoRadio element is enabled
      And The expectedGraduationDateInput element is enabled
      And I enter current date plus 100 days in expectedGraduationDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter  |
      | courseNameInput   | Intro to Math  |
      | courseNumberInput | math101        |
      | amountInput       | 125            |
      | creditHoursInput  | 1              |
      | courseWebAddress  | www.google.com |
      And I select Classroom from the instructionTypeDropdown
      And I click the courseScheduleDay0 element
      And I click the courseStartTime0 element
      And I click the courseStartTime0Option0 element
      And I click the courseEndTime0 element
      And I click the courseEndTime0Option1 element
    Then I should not see $ text in courseAmountCurrencySymbol element
    When I click the addExpenseButton element
      And I should not see $ text in expenseAmount element
      And I enter 5 in expenseAmount textfield
      And I click the saveExpenseButton element
    Then I should not see $ text in examTotalAmount element
    When I click the addCourseButton element
      And I wait until the cancelEditsButton is not visible
    Then I should be on the Courses page
    When I click the addExpenseButton element
      And I wait until the addExpenseButton is not visible
      And I select Registration Fee from the otherExpenseType
      And I enter 5 in expenseAmount textfield
    Then The saveExpenseButton element is enabled
    When I click the saveExpenseButton element
    Then The removeFirstOtherExpenseButton is visible
      And I should not see $ text in one of the expenseRequestedAmt fields
      And I should not see $ text in firstCourseRequestedAmt element
      And I should not see $ text in firstCourseExpenseAmt element
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I enter Auto Test3 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The courseRequested is visible
      And I should not see $ text in courseRequested element
      And I should not see $ text in firstNonCourseExpenseRequestedAmt element
      And I should not see $ text in coursesExpensesApproved element
      And I should not see $ text in totalBenefitText element
      And I should not see $ text in coursesExpensesRequested element
    When I click the submitApplicationButton element
    Then I should be on the submission page
      And The submissionIdLink is visible
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The courseRequested is visible
      And I should not see $ text in courseRequested element
      And I should not see $ text in firstNonCourseExpenseRequestedAmt element
      And I should not see $ text in coursesExpensesApproved element
      And I should not see $ text in totalBenefitText element
      And I should not see $ text in coursesExpensesRequested element
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And I should not see $ text in appAmount element
    When I click the viewMoreLessButton element
      And I wait until the submissionIdLink is not visible
      And I scroll to totalBenefitAmount element
    Then I should not see $ text in firstRequestedCourseAmt element
      And I should not see $ text in amountApproved element
      And I should not see $ text in paymentAmount element
      And I should not see $ text in adjustmentAmount element
      And I should not see $ text in totalBenefitAmount element
      And I should not see $ text in amountRequested element
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest3141 | Welcome1 | 130574     |

  @RegressionTest
  Scenario Outline: TU5 Add Course Information WITHOUT Course Related Expense (C60073)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the home page
      And The NewApplicationButton in the Header component is visible
      And The edGoalsTile is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When The continueButton element is enabled
      And I click the continueButton element
    Then I should be on the EducationInformation page
    When I click the firstEdGoal element
      And The educationProviderEditButton is not visible
    When I check Tuition Reimbursement radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus -20 days in sessionStartDateInput
      And I clear the sessionEndDateInput field
      And I enter current date plus -15 days in sessionEndDateInput
    Then The addCourseAndExpensesButton element is enabled
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 1             |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
    Then The addCourseRelatedExpenseButton is not visible
    When I click the courseRelatedTaxNoOption element
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
      And The course0ExpensesAmountText is not visible
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I click the agreement1Label element
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
    When I click the coursesViewMoreButton element
    Then The tuitionAmt is visible
      And The requestedBooksAmt is not visible
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | 131089     |

  @RegressionTest
  Scenario Outline: TU5 Verify Primary and Secondary button colors (C137409)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The scheduleFreeAdvisingLink is visible
      And The NewApplicationButton in the Header component is visible
      And I verify the color of the NewApplicationButton in Header component using CssProperty:background-color should be rgba(242, 169, 0, 1)
    When I hover over NewApplicationButton in component Header
    Then I verify the color of the NewApplicationButton in Header component using CssProperty:background-color should be rgba(255, 255, 255, 1)
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And I wait until the loadingSpinner is not visible
    When I hover over iconProfile in component Header
      And I scroll to continueButton element
    Then I validate the color of the continueButton using CssProperty:background-color should be rgba(242, 169, 0, 1)
    When I hover over the element continueButton
    Then I validate the color of the continueButton using CssProperty:background-color should be rgba(255, 255, 255, 1)
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I scroll to continueButton element
    Then The continueButton element is enabled
      And I validate the color of the continueButton using CssProperty:background-color should be rgba(242, 169, 0, 1)
    When I hover over the element continueButton
    Then I validate the color of the continueButton using CssProperty:background-color should be rgba(255, 255, 255, 1)
    When I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
    Then I validate the color of the addCourseAndExpensesButton using CssProperty:background-color should be rgba(242, 169, 0, 1)
    When I hover over the element addCourseAndExpensesButton
    Then I validate the color of the addCourseAndExpensesButton using CssProperty:background-color should be rgba(255, 255, 255, 1)
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 125           |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
    Then The addExpenseButton element is enabled
      And I validate the color of the addExpenseButton using CssProperty:background-color should be rgba(242, 169, 0, 1)
    When I hover over the element addExpenseButton
    Then I validate the color of the addExpenseButton using CssProperty:background-color should be rgba(255, 255, 255, 1)
      And The addCourseButton element is enabled
      And I validate the color of the addCourseButton using CssProperty:background-color should be rgba(242, 169, 0, 1)
    When I hover over the element addCourseButton
    Then I validate the color of the addCourseButton using CssProperty:background-color should be rgba(255, 255, 255, 1)
    When I click the taxAcknowledgement element
      And I click the addCourseButton element
      And I wait until the addCourseButton is not visible
      And I scroll to continueButton element
    Then I validate the color of the continueButton using CssProperty:background-color should be rgba(242, 169, 0, 1)
    When I hover over the element continueButton
    Then I validate the color of the continueButton using CssProperty:background-color should be rgba(255, 255, 255, 1)
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test1 in signatureInput textfield
    Then I validate the color of the continueButton using CssProperty:background-color should be rgba(242, 169, 0, 1)
    When I hover over the element continueButton
    Then I validate the color of the continueButton using CssProperty:background-color should be rgba(255, 255, 255, 1)
    When I click the continueButton element
    Then I should be on the Application page
    Then I validate the color of the submitApplicationButton using CssProperty:background-color should be rgba(242, 169, 0, 1)
    When I hover over the element submitApplicationButton
    Then I validate the color of the submitApplicationButton using CssProperty:background-color should be rgba(255, 255, 255, 1)
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112339     |

  @RegressionTest
  Scenario Outline: TU5 Step 3: When Currency = any international currency except USD (C91418)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select SM from the FieldOfStudyDropdown
      And The educationProviderEditButton is visible
      And I click the educationProviderEditButton element
      And I enter Walden University in providerName textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
    Then I should be on the EducationInformation page
    When I click the providerReviewCheckbox element
    Then The continueButton element is enabled
    When I click on continueButton using jsExecutor
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the degreeCompleteNoRadio element
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter  |
      | courseNameInput   | Intro to Math  |
      | courseNumberInput | math101        |
      | amountInput       | 1              |
      | creditHoursInput  | 1              |
      And I select Classroom from the instructionTypeDropdown
      And I click the addExpenseButton element
      And I enter 1 in bookQuantity textfield
    Then I verify number of dollarSymbols on the page should be 4
      And I enter 1 in expenseAmount textfield
    When I click the saveExpenseButton element
      And I click the addCourseButton element
    Then I should see $1.00 CAD text in firstCourseRequestedAmt field
      And I should see $1.00 CAD text in firstCourseExpenseAmt field
      And I should see $2.00 CAD text in one of the totalRequestedAmt fields
      And I wait until the cancelEditsButton is not visible
    When I click the addExpenseButton element
      And I wait until the addExpenseButton is not visible
    Then I verify number of dollarSymbols on the page should be 2
    When I select Activity Fee from the otherExpenseType
      And I enter 3 in expenseAmount textfield
      And I click the expenseRelatedTaxYesOption element
    Then The saveExpenseButton element is enabled
    When I click the saveExpenseButton element
    Then The editFirstOtherExpenseButton is visible
      And I should see $3.00 CAD text in one of the expenseRequestedAmt fields
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsYesRadioLabel element
    Then The financialAidDropdown is visible
    When I select Pell Grant from the financialAidDropdown
      And I enter 175 in financialAidAmountInput textfield
      And I verify number of dollarSymbols on the page should be 2
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The courseRequested is visible
      And The exact text in courseRequested should be $2.00 CAD
      And The exact text in firstNonCourseExpenseRequestedAmt should be $3.00 CAD
      And The exact text in coursesExpensesApproved should be $0.00 CAD
      And The exact text in totalBenefitText should be $5.00 CAD
      And The exact text in coursesExpensesRequested should be $5.00 CAD
      And The exact text in grantsScholarshipsDiscountsText should be Pell Grant $175.00 CAD
    When I click the coursesViewMoreButton element
    Then I should see $1.00 CAD text in tuitionAmt field
      And I should see $1.00 CAD text in requestedBooksAmt field
      And I should see null CAD text in discountAmt field
      And I should see $2.00 CAD text in coursesRequestedAmt field
      And I should see $0.00 CAD text in coursesApprovalAmt field
      And I should see $0.00 CAD text in coursesPaidAmt field
    When I click the nonCourseExpenseViewMoreBtn element
    Then I should see $3.00 CAD text in nonCourseExpensesRequestedAmt field
      And I should see $0.00 CAD text in nonCourseExpensesApprovalAmt field
      And I should see $0.00 CAD text in nonCourseExpensesPaidAmt field
      And I enter Test comment in summaryCommentInput textfield
    When I click the submitApplicationButton element
    Then I should be on the submission page
      And The submissionIdLink is visible
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And The exact text in appAmount in the first appHistoryTile should be $5.00 CAD
    When I click the viewMoreLessButton element
      And I wait until the submissionIdLink is not visible
      And I scroll to totalBenefitAmount element
    Then The exact text in requestedCourseAmt in the first appHistoryTile should be $1.00 CAD
      And The exact text in courseRelatedAmount in the first appHistoryTile should be $1.00 CAD
      And The exact text in nonCourseRelatedAmount in the first appHistoryTile should be $3.00 CAD
      And The exact text in totalRequestedAmt in the first appHistoryTile should be $5.00 CAD
      And The exact text in totalPaidAmt in the first appHistoryTile should be $0.00 CAD
      And The exact text in totalRefundAmt in the first appHistoryTile should be ($0.00 CAD)
      And The exact text in totalBenefitPaidAmt in the first appHistoryTile should be $5.00 CAD
      And I report test passing test status
    Examples:
      | client      | username  | password | testCaseId |
      | eg5tu5demo  | ATest1141 | Welcome1 | 131103     |

  @RegressionTest
  Scenario Outline: TU5 Verify PPT with missing approver is able to submit application for program with approval level = 1 (C166272)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select Accounting from the fieldOfStudyDropdown
      And I check Education Access - Reimbursement radio dial from the programsRadioGroup
      And I select the radio dial with University of Maryland University College text from the edAccessProvidersRadioGroup group
      And I click on continueButton using jsExecutor
    Then I should be on the Courses page
    When The sessionStartDateInput element is enabled
      And I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the addCourseButton element
      And I wait until the addCourseButton is not visible
      And I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I enter Auto Test2 in signatureInput textfield
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Application page
    When I click the submitApplicationButton element
    Then I should be on the Submission page
      And I should see Your application has been Submitted - Pending Review text in submissionStatusText field
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
    When I cancel an application from the Application Page Actions menu
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest2141 | Welcome1 | 126782     |

  @RegressionTest
  Scenario Outline: TU5 Verify Actions Button is not displayed to Supervisors for LOC Issued status (C108647)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the home page
    When I Update the tuition API request
      #| Attribute                        | Value       |
      | Program                           | Direct Bill |
      | Session Start Date from Today     | 1           |
      | Session End Date from Today       | 60          |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the application page
    When I log out
    Then I should be on the Logout page
    When I'm on the <client> site
      And I login with <supervisor1> username and <supervisor1Pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the home page
    When I navigate to the current application summary page
    Then I should be on the application page
      And The submittedApplicationActionMenuButton is not visible
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I enter Test Comment by Supervisor in approveApplicationCommentTextInput textfield
      And I click the approveApplicationWithCommentsButton element
      And I wait until the approveApplicationWithCommentsButton is not visible
    Then I should be on the Application page
    When I log out
    Then I should be on the Logout page
    When I'm on the <client> site
      And I login with <supervisor2> username and <supervisor2Pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the home page
    When I navigate to the current application summary page
    Then I should be on the application page
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I enter Test Comment by Supervisor in approveApplicationCommentTextInput textfield
      And I click the approveApplicationWithCommentsButton element
      And I wait until the approveApplicationWithCommentsButton is not visible
    Then I should be on the Application page
      And The exact text in applicationStatus should be LETTER OF CREDIT (LOC) ISSUED
      And The submittedApplicationActionMenuButton is not visible
    When I log out
    Then I should be on the Logout page
    When I'm on the <client> site
      And I login with <supervisor1> username and <supervisor1Pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the home page
    When I navigate to the current application summary page
    Then The submittedApplicationActionMenuButton is not visible
      And I report test passing test status
    Examples:
      | client     | username | password | supervisor1 | supervisor1Pw | supervisor2 | supervisor2Pw | testCaseId |
      | lr5tu5demo | atest3   | Welcome1 | atest2      | Welcome1      | atest9      | Welcome1      | 133580     |
