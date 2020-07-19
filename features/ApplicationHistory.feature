Feature: Application History (Tuition)

  @SmokeTest
  Scenario Outline: TU5 App History: Verify page elements, App Number linked to full application and View More/Less button (C67469)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The historyNav in the Header component is visible
    When I click the historyNav in the Header component
    Then I should be on the ApplicationHistory page
      And The appHistoryViewMoreApps is visible
    When I click the viewMoreButton in first appHistoryTile
    Then The viewLessButton in the first appHistoryTile is visible
      And The totalRequestedAmt in the first appHistoryTile is visible
      And The totalApprovedAmt in the first appHistoryTile is visible
      And The totalPaidAmt in the first appHistoryTile is visible
      And The totalRefundAmt in the first appHistoryTile is visible
      And The totalBenefitPaidAmt in the first appHistoryTile is visible
      And I should not see Loan text in one of the programName fields
      And I should not see Education Goal text in one of the programName fields
    When I click the appNumberLink in first appHistoryTile
    Then I should be on the Application page
      And I report test passing test status
    Examples:
      | client  | username | password | stgTestCaseId | uatTestCaseId | prodTestCaseId |
      | tu5demo | atest1   | Welcome1 | 73576         | 122191        | 126601         |

  @RegressionTest
  Scenario Outline: TU5 App History: Verify Application History page display and only tuition apps are present (C71889)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the home page
      When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And The viewMoreLessButton element is enabled
      And I verify number of appHistoryTile on the page should be 10
    When The exact text in sortByDropDownButton should be Application Number
    Then I verify sorting worked for appNumber according to descending order
    When I click the appHistoryViewMoreApps element
      And I wait until the loadingSpinner is not visible
    Then I verify number of appHistoryTile on the page should be 11
    When I scroll to teamMember element
      And I click the teamMember element
      And I enter Auto Test3 in teamMemberSearch textfield
      And I click the firstTeamMemberInList element
      And The viewMoreLessButton element is enabled
    Then I should not see Loan text in one of the programName fields
      And I should not see Education Goal text in one of the programName fields
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest9   | Welcome1 | 112370     |

  @LocalTest
  Scenario Outline: TU5 PPT View of Application Summary page along with support documents download(when started from History tab) (C13734)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                          |
      | Program                           | Tuition Reimbursement Program  |
      | Session Start Date from Today     | 1                              |
      | Session End Date from Today       | 60                             |
    Then I create tuition application using API
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And The appHistoryViewMoreApps is visible
    When I click the viewMoreButton in first appHistoryTile
    Then The viewLessButton in the first appHistoryTile is visible
    When I click the viewFullApplicationButton in first appHistoryTile
    Then I should be on the Application page
      And I should see FORWARDED TO SUPERVISOR FOR REVIEW text in one of the appSummaryHistoryStatus fields
      And The selectFileLink is visible
    When I upload TestFile2.pdf file using the sharedFileUpload component
      And I select Corrections from the documentTypeDropdown
      And I enter Test:To Delete uploaded Document. in commentText textfield
      And I click the submitDocumentButton element
    Then I wait until the submitDocumentButton is not visible
    When The supportingDocument1 is visible
      And I click the supportingDocument1 element
    Then I verify file is downloaded with name Corrections.pdf
    # comment functionality
    When I click the appSummaryAddNewCommentBtn element
      And I enter test comment on application summary page in appSummaryCommentInput textfield
      And I click the appSummaryCancelBtn element
    Then I should be on the Application page
    When I click the appSummaryAddNewCommentBtn element
      And I enter test comment on application summary page in appSummaryCommentInput textfield
      And I click the appSummarySaveCommentBtn element
      And I click the appSummaryDeleteCommentBtn element
    Then I should be on the Application page
    When I click the viewMoreAgreementButton element
    Then The agreementHeader is visible
      And The exact text in agreementHeader should be FERPA Agreement
      And Text in agreementText field is present
      And The agreementCheckboxLabel is visible
    # Program Modal functionality
      And I scroll to appSummaryProgramModalBtn element
      And The appSummaryProgramModalBtn element is enabled
    When I click the appSummaryProgramModalBtn element
    Then Text in programModelTitleText in the ProgramModal component is present
    When I click the programDescriptionOkButton in the ProgramModal component
    Then I should be on the Application page
      And The submittedApplicationActionMenuButton is visible
      And The appSummarywhatDocumentTypesAreSupportedBtn is visible
    When I scroll to appSummarywhatDocumentTypesAreSupportedBtn element
      And I click the appSummarywhatDocumentTypesAreSupportedBtn element
    Then Text in ModalTitleText in the ProgramModal component is present
    When I click the closeSupportedDocumentsButton in the ProgramModal component
    Then I should be on the Application page
      And I cancel an application from the Application Page Actions menu
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1_210   | Welcome1 | 112369     |

  @RegressionTest
  Scenario Outline: TU5 App History: Ensure applications shown match what PPT view has (C2076)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the home page
      And The NewApplicationButton in the Header component is visible
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And The appNumberLink in the first appHistoryTile is visible
      And The exact text in applicationCount should be 5 Applications Found
      And The exact text in appNumberLink in the first appHistoryTile should be #5660556
      And The exact text in applicationName in the first appHistoryTile should be Auto Test8
      And The exact text in applicationStatus in the first appHistoryTile should be PAYMENT REVIEW
      And The exact text in programName in the first appHistoryTile should be Tuition Reimbursement Program
      And The exact text in applicationSchool in the first appHistoryTile should be George Washington University-EngineeringApp Sci
      And The exact text in applicationDegree in the first appHistoryTile should be Master's Degree - Accounting
      And The exact text in courseDate in the first appHistoryTile should be Apr 19, 2019 - Jul 26, 2019
      And The exact text in appAmount in the first appHistoryTile should be $400.00
    When I click the viewMoreButton in first appHistoryTile
    Then The viewFullApplicationButton in the first appHistoryTile is visible
      And The exact text in requestedCourseAmt in the first appHistoryTile should be $100.00
      And The exact text in courseRelatedAmount in the first appHistoryTile should be $200.00
      And The exact text in nonCourseRelatedAmount in the first appHistoryTile should be $100.00
      And The exact text in totalRequestedAmt in the first appHistoryTile should be $400.00
      And The exact text in totalPaidAmt in the first appHistoryTile should be $400.00
      And The exact text in totalRefundAmt in the first appHistoryTile should be ($0.00)
      And The exact text in totalBenefitPaidAmt in the first appHistoryTile should be $400.00
    When I log out
    Then I should be on the Login page
    When I login with <supervisor> username and <supervisorPw> password
    Then I should be on the home page
      When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And I wait until the firstTeamMemberInList is not visible
    When I click the teamMember element
      And I enter Auto Test8 in teamMemberSearch textfield
      And I click the firstTeamMemberInList element
    Then I should be on the ApplicationHistory page
      And The appNumberLink in the first appHistoryTile is visible
      And The exact text in applicationCount should be 5 Applications Found
      And The exact text in appNumberLink in the first appHistoryTile should be #5660556
      And The exact text in applicationName in the first appHistoryTile should be Auto Test8
      And The exact text in applicationStatus in the first appHistoryTile should be PAYMENT REVIEW
      And The exact text in programName in the first appHistoryTile should be Tuition Reimbursement Program
      And The exact text in applicationSchool in the first appHistoryTile should be George Washington University-EngineeringApp Sci
      And The exact text in applicationDegree in the first appHistoryTile should be Master's Degree - Accounting
      And The exact text in courseDate in the first appHistoryTile should be Apr 19, 2019 - Jul 26, 2019
      And The exact text in appAmount in the first appHistoryTile should be $400.00
    When I click the viewMoreButton in first appHistoryTile
    Then The viewFullApplicationButton in the first appHistoryTile is visible
      And The exact text in requestedCourseAmt in the first appHistoryTile should be $100.00
      And The exact text in courseRelatedAmount in the first appHistoryTile should be $200.00
      And The exact text in nonCourseRelatedAmount in the first appHistoryTile should be $100.00
      And The exact text in totalRequestedAmt in the first appHistoryTile should be $400.00
      And The exact text in totalPaidAmt in the first appHistoryTile should be $400.00
      And The exact text in totalRefundAmt in the first appHistoryTile should be ($0.00)
      And The exact text in totalBenefitPaidAmt in the first appHistoryTile should be $400.00
      And I report test passing test status
    Examples:
      | client  | username | password | supervisor | supervisorPw | testCaseId |
      | tu5demo | atest8_210   | Welcome1 | atest2     | Welcome1     | 112367     |

  @RegressionTest
  Scenario Outline: TU5 App History: Verify Level 1 Approver and Sort by Team Member, Self and Team (C2077)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the home page
      When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And The viewMoreLessButton is visible
    When I click the teamMember element
      And I enter Auto Test2 in teamMemberSearch textfield
      And I click the firstTeamMemberInList element
      And I wait until the firstTeamMemberInList is not visible
    Then I should be on the ApplicationHistory page
      And I validate Auto Test2 text is present in all the applicationName list elements
    When I click the teamMember element
      And I clear the teamMemberSearch field
      And I enter Auto Test1 in teamMemberSearch textfield
      And I click the firstTeamMemberInList element
      And I wait until the firstTeamMemberInList is not visible
    Then I should be on the ApplicationHistory page
      And I validate Auto Test1 text is present in all the applicationName list elements
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest2_210   | Welcome1 | 112368     |

  @RegressionTest
  Scenario Outline: TU5 Verify Fax Cover Sheet = Yes (C1993)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And The firstRadioButton element is enabled
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
      | amountInput       | 1             |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
    Then I wait until the addCourseButton is not visible
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The submitApplicationButton element is enabled
    When I click the appSummarywhatDocumentTypesAreSupportedBtn element
    Then The printFaxCoverSheetButton is visible
      And The printFaxCoverSheetButton element is enabled
    When I click the printFaxCoverSheetButton element
    Then The faxCoverSheetApplicationNumberHeading in the FaxCoverSheet component is visible
      And The faxCoverSheetApplicationNumber in the FaxCoverSheet component is visible
      And The faxCoverSheetDate in the FaxCoverSheet component is visible
      And The faxCoverSheetApplicantName in the FaxCoverSheet component is visible
      And The faxCoverSheetEmployeeId in the FaxCoverSheet component is visible
      And The faxCoverSheetFaxNumber in the FaxCoverSheet component is visible
      And The faxCoverSheetSubjectName in the FaxCoverSheet component is visible
      And The faxCoverSheetPagesInput in the FaxCoverSheet component is visible
      And The faxCoverSheetCommentsTextArea in the FaxCoverSheet component is visible
      And The faxCoverSheetPrintButton in the FaxCoverSheet component is visible
      And The faxCoverSheetCloseBtn in the FaxCoverSheet component is visible
    When I click the following elements in a component
      #| Element                                | Component     |
      | faxCoverSheetCorrectionsCheckbox        | FaxCoverSheet |
      | faxCoverSheetGradesCheckbox             | FaxCoverSheet |
      | faxCoverSheetProofOfEnrollmentCheckbox  | FaxCoverSheet |
      | faxCoverSheetProofOfPaymentCheckbox     | FaxCoverSheet |
      | faxCoverSheetOtherCheckbox              | FaxCoverSheet |
    Then Text in faxCoverSheetHeaderDocumentTypeId in the FaxCoverSheet component is present
      And The exact text in faxCoverSheetHeaderDocumentTypeId from the FaxCoverSheet component should be DT#575, DT#505, DT#885, DT#506,  DT#999
      And The faxCoverSheetCloseBtn in the FaxCoverSheet component is visible
    When I click the faxCoverSheetCloseBtn in the FaxCoverSheet component
      And The ModalTitleText in the ProgramModal component is visible
      And The printFaxCoverSheetButton element is enabled
    Then Text in ModalTitleText in the ProgramModal component is present
    When I click the closeSupportedDocumentsButton in the ProgramModal component with jsExecutor
    Then I should be on the Application page
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112365     |

  @RegressionTest
  Scenario Outline: Verify document upload button is disabled until grade is entered for a "Grade" document and user can delete documents that have not been reviewed (C87641)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                               |
      | Program                           | Virtual Card Certification program  |
      | Session Start Date from Today     | 1                                   |
      | Session End Date from Today       | 60                                  |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatus is visible
    When I upload TestFile.pdf file using the sharedFileUpload component
      And I select Grades from the documentTypeDropdown
    Then The submitDocumentButton element is disabled
    When I click on cancelDocumentButton using jsExecutor
    Then The submitDocumentButton is not visible
    When I upload TestFile2.pdf file using the sharedFileUpload component
      And I select Corrections from the documentTypeDropdown
      And I enter Test:To Delete uploaded Document. in commentText textfield
      And I click the submitDocumentButton element
    Then I wait until the submitDocumentButton is not visible
      And I verify the number of supportingDocuments before deletion
      And The documentDelete is visible
      And The exact text in statusOfDocumentUploaded should be Pending
    When I click the documentDelete element
      And I click the confirm element
    Then I wait until the confirm is not visible
      And I verify the number of supportingDocuments after deletion
    When I cancel an application from the Application Page Actions menu
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112372     |

  @RegressionTest
  Scenario Outline: TU5 App History: Application Number directs you to full application - Saved Not Submitted status (C1883)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
      And The actionNeededSection is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the EducationInformation page
    When I check Tuition Reimbursement radio dial from the programsRadioGroup
      And The continueButton element is enabled
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 15 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter            |
      | courseNameInput   | Saved Not Submitted Test |
      | courseNumberInput | SNS 101                  |
      | amountInput       | 2586.64                  |
      | creditHoursInput  | 42                       |
      And I select Online from the instructionTypeDropdown
      And I click the courseRelatedTaxNoOption element
      And I click the addCourseButton element
    Then I should be on the Courses page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the cancelButton element
      And I click the saveApplicationForLaterButton element
      And I wait until the saveApplicationForLaterButton is not visible
    Then I should be on the Home page
      When I navigate to History web page
    Then I should be on the ApplicationHistory page
    When I verify applicationStatusText is Saved — Not Submitted and click appNumber
    Then I should be on the Application page
      And The submitApplicationButton element is enabled
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest5   | Welcome1 | 112364     |

  @RegressionTest
  Scenario Outline: TU5 App History: Level 2 Approver: Your Team Application history Section (C2074)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And The exact text in applicationHistoryHeader should be Application History
      And The appNumberLink in the first appHistoryTile is visible
      And The exact text in applicationCount should be 5 Applications Found
      And The exact text in applicationStatus list should be
      #|        Text                         |
      | LETTER OF CREDIT (LOC) ISSUED        |
      | PAYMENT REVIEW                       |
      | FORWARDED TO SUPERVISOR FOR REVIEW   |
      | DENIED                               |
      | FORWARDED TO SUPERVISOR FOR REVIEW   |
      And The exact text in appNumberLink list should be
      #|   Text      |
      |  #5703156    |
      |  #5703050    |
      |  #5702851    |
      |  #5702846    |
      |  #5697627    |
    When I log out
    Then I should be on the Logout page
    When I login with <supervisor2> username and <supervisor2Pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the home page
      When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And I wait until the firstTeamMemberInList is not visible
    When I click the teamMember element
      And I enter Auto Test19 in teamMemberSearch textfield
      And I click the firstTeamMemberInList element
      And The viewMoreLessButton element is enabled
    Then I should be on the ApplicationHistory page
      And The exact text in applicationHistoryHeader should be Application History
      And The appNumberLink in the first appHistoryTile is visible
      And The exact text in applicationCount should be 5 Applications Found
      And The exact text in applicationStatus list should be
      #|       Text                          |
      |  LETTER OF CREDIT (LOC) ISSUED       |
      |  PAYMENT REVIEW                      |
      |  FORWARDED TO SUPERVISOR FOR REVIEW  |
      |  DENIED                              |
      |  FORWARDED TO SUPERVISOR FOR REVIEW  |
      And The exact text in appNumberLink list should be
      #|   Text      |
      |  #5703156    |
      |  #5703050    |
      |  #5702851    |
      |  #5702846    |
      |  #5697627    |
      And I report test passing test status
    Examples:
      | client     | username | password | supervisor2  | supervisor2Pw | testCaseId |
      | lr5tu5demo | atest19  | Welcome1 | atest3       | Welcome1      | 112366     |

  @RegressionTest
  Scenario Outline: TU5 Verify Status History Section on Supervisor's Application Review Page (C73616)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the home page
    When I retrieve session token and participantID after login
      And I Update the JSON file before doing a API request
      #| Attribute                        | Value       |
      | Program                           | Direct Bill |
      | Session Start Date from Today     | 1           |
      | Session End Date from Today       | 60          |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the application page
    When I log out
    Then I should be on the Logout page
    When I login with <approver1> username and <approver1pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
    When I click the appSummaryViewAllStatusHistoryBtn element
    Then I should see FORWARDED TO SUPERVISOR FOR REVIEW text in one of the appSummaryHistoryStatus fields
      And I should see SUBMITTED — PENDING REVIEW text in one of the appSummaryHistoryStatus fields
      And The approveApplicationButton element is enabled
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I click the approveApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
      And The exact text in applicationStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
    When I log out
    Then I should be on the Logout page
    When I login with <approver2> username and <approver2pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
      And The appSummaryViewAllStatusHistoryBtn is visible
    When I click the appSummaryViewAllStatusHistoryBtn element
    Then I should see FORWARDED TO SUPERVISOR FOR REVIEW text in one of the appSummaryHistoryStatus fields
      And I should see SUBMITTED — PENDING REVIEW text in one of the appSummaryHistoryStatus fields
      And I report test passing test status
    Examples:
      | client     | username | password | approver1 | approver1pw  | approver2  | approver2pw | testCaseId |
      | lr5tu5demo | atest10  | Welcome1 | atest2    | Welcome1     | atest3     | Welcome1    | 112371     |

  @RegressionTest
  Scenario Outline: TU5 Benefit Period drop-down functionality (C1881)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And I should see All text in BenefitPeriod field
      And I wait until the loadingSpinner is not visible
    When I click the BenefitPeriod element
    Then The BenefitPeriodFirstOption is visible
      And The BenefitPeriodSecondOption is visible
    When I click the BenefitPeriodFirstOption element
      And I click the BenefitPeriodZeroOption element
      And I click on BenefitPeriod using jsExecutor
    Then I wait until the loadingSpinner is not visible
      And I should see any of the below text is displayed in the courseDate fields
      #| Text |
      | 2020  |
      And I should not see 2018 text in one of the courseDate fields
      And I should not see 2019 text in one of the courseDate fields
    When I click the BenefitPeriod element
      And I click the BenefitPeriodSecondOption element
      And I click on BenefitPeriod using jsExecutor
    Then I wait until the loadingSpinner is not visible
      And I should see any of the below text is displayed in the courseDate fields
      #| Text |
      | 2019  |
      | 2020  |
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest5   | Welcome1 | 112363     |

  @RegressionTest
  Scenario Outline: TU5 Enable Application Comments Before Submission = Required Purpose Statement (C120879)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select SM from the FieldOfStudyDropdown
      And I click the educationProviderEditButton element
    Then The providerName is visible
      And The providerSearchButton is visible
    When I enter Boston University in providerName textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
    Then I should be on the EducationInformation page
    When I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 15 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the degreeCompleteNoRadio element
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 125           |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the addCourseButton element
      And I wait until the courseNameInput is not visible
    Then I should be on the Courses page
    When I click on continueButton using jsExecutor
    Then I should be on the Agreement page
      And I click the eligibleGrantsNoRadioLabel element
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The applicationConfirmationCommentInput is visible
    When I click the submitApplicationButton element
    Then The placeholderPurposeStmt is visible
      And I validate placeholder attribute value of placeholderPurposeStmt is equal to Required
      And I verify requiredMessage contains This field is required text
    When I enter Required Purpose Statement in applicationConfirmationCommentInput textfield
      And I click the submitApplicationButton element
    Then I should be on the Submission page
    When I scroll to submissionIdLink element
      And I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And I should see Required Purpose Statement text in purposeComment field
    When I click the submittedApplicationActionMenuButton element
      And I click the cancelApplicationButton element
      And I enter cancel application in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 124563     |

  @RegressionTest
  Scenario Outline: TU5 View All Status History button functionality (C1889)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the home page
      And The NewApplicationButton in the Header component is visible
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
    When I click the viewMoreButton in first appHistoryTile
    Then The viewFullApplicationButton in the first appHistoryTile is visible
    When I click the viewFullApplicationButton in first appHistoryTile
    Then I should be on the Application page
      And The appSummaryViewAllStatusHistoryBtn is visible
    When I click the appSummaryViewAllStatusHistoryBtn element
    Then The statusHistoryHeaderText is visible
      And I should see PAYMENT REVIEW text in one of the appSummaryHistoryStatus fields
      And I should see PAYMENT/REIMBURSEMENT IN PROGRESS text in one of the appSummaryHistoryStatus fields
      And I should see APPROVED text in one of the appSummaryHistoryStatus fields
      And I should see FORWARDED TO SUPERVISOR FOR REVIEW text in one of the appSummaryHistoryStatus fields
      And I should see DENIED text in one of the appSummaryHistoryStatus fields
      And I should see SUBMITTED — PENDING REVIEW text in one of the appSummaryHistoryStatus fields
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest8   | Welcome1 | 131104     |
