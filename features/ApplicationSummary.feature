Feature: Application Summary (Tuition)

  @RegressionTest
  Scenario Outline: TU5 App Summary: Verify Program Modal, Course data and deny application with comments (C2063)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The actionNeededSection is visible
    When I click the reviewApplicationButton in first actionNeededCard
    Then I should be on the Application page
      And The employeeProgramModalButton is visible
    When I click the employeeProgramModalButton element
    Then Text in programModelTitleText in the ProgramModal component is present
    When I click the programDescriptionOkButton in the ProgramModal component
    Then I should be on the Application page
    When I click the denyApplicationButton element
      And I click the denyApplicationWithCommentsButton element
    Then I should be on the Application page
    When I enter test application deny comment in denyApplicationCommentTextInput textfield
      And I click the denyApplicationWithCommentsButton element
    Then The appSummaryViewAllStatusHistoryBtn is visible
      And The exact text in applicationStatus should be DENIED
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest2   | Welcome1 | 112447     |

  @RegressionTest
  Scenario Outline: TU5 App Summary: Verify visible buttons in Approved status for Level 1 Approver and Participant (C79508)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the home page
      When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And I wait until the loadingSpinner is not visible
    When I select Your Team from the teamMemberDropdown
      And The appHistorySortByDropdown element is enabled
      And I click the appHistorySortByDropdown element
      And I click the appHistorySoryByApplicationStatus element
      And The viewMoreLessButton element is enabled
      And I verify applicationStatusText is APPROVED and click appNumberLink
    Then I should be on the Application page
      And The submittedApplicationActionMenuButton is not visible
      And The selectFileLink is not visible
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
      And I should be on the Login page
      And I login with <participantUsername> username and <participantPassword> password
    Then I should be on the home page
      When I navigate to History web page
    Then I should be on the ApplicationHistory page
    When I click the appHistorySortByDropdown element
      And I click the appHistorySoryByApplicationStatus element
      And I verify applicationStatusText is APPROVED and click appNumberLink
    Then I should be on the Application page
      And The submittedApplicationActionMenuButton is visible
    When I click the submittedApplicationActionMenuButton element
    Then The cancelApplicationButton is visible
      And The selectFileLink is visible
      And I report test passing test status
    Examples:
      | client  | username | password | participantUsername | participantPassword | testCaseId |
      | tu5demo | atest2   | Welcome1 | atest1              | Welcome1            | 112448     |

  @RegressionTest
  Scenario Outline: TU5 Step 3: Allow Appeal = YES  (C94214)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the home page
    When I Update the tuition API request
      #| Attribute                        | Value                         |
      | Program                           | Tuition Reimbursement Program |
      | Session Start Date from Today     | -300                          |
      | Session End Date from Today       | -200                          |
      | Comments                          | True                          |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
    When I click the submittedApplicationActionMenuButton element
      And I click the appealDenyButton element
      And The appealDenyButton is not visible
    Then I should be on the Appeal page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112450     |

  @RegressionTest
  Scenario Outline: TU5 Step 3: Allow Appeal = NO (C94545)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value              |
      | Program                           | Virtual Card       |
      | Session Start Date from Today     | -300               |
      | Session End Date from Today       | -250               |
      | Comments                          | True               |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is not visible
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112451     |

  @RegressionTest
  Scenario Outline: TU5 Verify AppealDeniedApplication option not displayed for Supervisor1 viewing his team's application (C100853)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                               |
      | Program                           | Tuition Reimbursement Program       |
      | Session Start Date from Today     | -300                                |
      | Session End Date from Today       | -200                                |
      | Comments                          | True                                |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is visible
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I'm on the <client> site
    When I login with <supervisor> username and <supervisorPw> password
    Then I should be on the home page
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And The teamMember element is enabled
    When I click the appHistoryTeamMemberDropdown element
      And I clear the teamMemberSearch field
      And I enter Auto Test6 in teamMemberSearch textfield
      And I click the firstTeamMemberInList element
    Then I should be on the ApplicationHistory page
      And The appNumberLink in the first appHistoryTile is visible
    When I click the viewMoreButton in first appHistoryTile
    Then The viewFullApplicationButton in the first appHistoryTile is visible
    When I click the viewFullApplicationButton in first appHistoryTile
    Then I should be on the Application page
      And The exact text in applicationStatus should be DENIED
      And The submittedApplicationActionMenuButton is not visible
      And I report test passing test status
    Examples:
      | client  | username | password | supervisor | supervisorPw | testCaseId |
      | tu5demo | atest6   | Welcome1 | atest2     | Welcome1     | 112452     |

  @RegressionTest
  Scenario Outline: TU5 App Summary: Level 2 Approver: When Supervisor1 denies application directly (C2072)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And The tuitionProgramManagement element is enabled
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The edGoalsTile is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the EducationInformation page
    When I click the firstEdGoal element
    Then The programsRadioGroup element is enabled
    When I check Direct Bill radio dial from the programsRadioGroup
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 15 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter    |
      | courseNameInput   | Computer Science |
      | courseNumberInput | CompSci 101      |
      | amountInput       | 76.19            |
      | creditHoursInput  | 1                |
      And I select Blended from the instructionTypeDropdown
      And I click the addCourseButton element
    Then I should be on the Courses page
      And The continueButton is visible
    When I scroll to continueButton element
      And I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I click the agreement1Label element
      And I enter Auto Test10 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And I capture the current application ID from the url
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <approver1> username and <approver1pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
      And The denyApplicationButton is visible
      And The approveApplicationButton is visible
    When I click the denyApplicationButton element
      And The denyApplicationCommentTextInput is visible
      And I click the denyApplicationWithCommentsButton element
    Then I verify This field is required text is displayed
      And The denyApplicationWithCommentsButton is visible
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
    When I enter Denied by Automation in denyApplicationCommentTextInput textfield
      And I click the denyApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
    When I verify Denied by Automation text is displayed
      And I capture the current application ID from the url
      And The statusHistoryHeaderText is visible
    Then The exact text in applicationStatus should be DENIED
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <approver2> username and <approver2pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And I verify Reviewing Application text is not displayed
      And The statusHistoryHeaderText is visible
      And The exact text in applicationStatus should be DENIED
    When I scroll to statusHistoryHeaderText element
    Then I verify Denied by Automation text is displayed
      And The denyApplicationButton is not visible
      And The approveApplicationButton is not visible
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And I wait until the firstTeamMemberInList is not visible
      And I click the teamMember element
    When I enter Auto Test10 in teamMemberSearch textfield
    Then The firstTeamMemberInList element is enabled
    When I click the firstTeamMemberInList element
      And I wait until the firstTeamMemberInList is not visible
      And I verify applicationStatusText is Denied and click appNumberLink
    Then I should be on the Application page
      And The exact text in applicationStatus should be DENIED
      And I report test passing test status
    Examples:
      | client     | username | password | approver1 | approver1pw  | approver2  | approver2pw | testCaseId |
      | lr5tu5demo | atest10  | Welcome1 | atest2    | Welcome1     | atest14    | Welcome1    | 112453     |

  @RegressionTest
  Scenario Outline: TU5 App Summary: Level 2 Approver: When Supervisor1 approves but Supervisor2 denies the application (C119361)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The firstEdGoal element is enabled
    When I click the firstEdGoal element
    Then The programsRadioGroup element is enabled
    When I check Direct Bill radio dial from the programsRadioGroup
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 15 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter    |
      | courseNameInput   | Computer Science |
      | courseNumberInput | CompSci 101      |
      | amountInput       | 76.19            |
      | creditHoursInput  | 1                |
      And I select Blended from the instructionTypeDropdown
      And I click the addCourseButton element
      And I wait until the courseNameInput is not visible
      And I wait until the creditHoursInput is not visible
    Then I should be on the Courses page
      And The continueButton is visible
      And I scroll to continueButton element
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test10 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
    When I click the submitApplicationButton element
      And I wait until the submitApplicationButton is not visible
    Then I should be on the Submission page
      And The submissionIdLink is visible
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And I capture the current application ID from the url
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <approver1> username and <approver1pw> password
    Then The tuitionProgramManagement element is enabled
    When I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
      And The denyApplicationButton is visible
      And The approveApplicationButton is visible
    When I click the approveApplicationButton element
      And The approveApplicationCommentTextInput is visible
      And I click the approveApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
      And The exact text in applicationStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
      And I verify Auto Test14 (Level 2 approver) has been Notified for this application by the Program Administrator. text is displayed
      And I capture the current application ID from the url
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <approver2> username and <approver2pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
      And The denyApplicationButton is visible
      And The approveApplicationButton is visible
    When I click the denyApplicationButton element
      And The denyApplicationCommentTextInput is visible
      And I click the denyApplicationWithCommentsButton element
    Then I verify This field is required text is displayed
      And The denyApplicationWithCommentsButton is visible
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
    When I enter Denied by Automation in denyApplicationCommentTextInput textfield
      And I click the denyApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
      And The statusHistoryHeaderText is visible
      And The exact text in applicationStatus should be DENIED
      And I verify Denied by Automation text is displayed
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And I wait until the firstTeamMemberInList is not visible
    When I click the teamMember element
    Then The teamMemberSearch element is enabled
    When I clear the teamMemberSearch field
      And I click the teamMemberSearch element
      And I enter Auto Test10 in teamMemberSearch textfield
      And I click the firstTeamMemberInList element
      And I wait until the firstTeamMemberInList is not visible
      And The firstAppNumber is visible
      And I verify applicationStatusText is Denied and click appNumberLink
    Then I should be on the Application page
      And The exact text in applicationStatus should be DENIED
      And I report test passing test status
    Examples:
      | client     | username | password | approver1 | approver1pw  | approver2  | approver2pw | testCaseId |
      | lr5tu5demo | atest10  | Welcome1 | atest2    | Welcome1     | atest14    | Welcome1    | 112454     |

  @RegressionTest
  Scenario Outline: TU5 Level 2 Approver: All Course Data shows correctly for supervisor review, including fees (C2069)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The scheduleFreeAdvisingLink is visible
      And The NewApplicationButton in the Header component is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Home Address text from the addressRadioGroup group
      And I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Home Email text from the emailRadioGroup group
      And I click the continueButton element
    Then I should be on the EducationInformation page
    When I click the firstEdGoal element
    Then The programsRadioGroup element is enabled
    When I check Direct Bill radio dial from the programsRadioGroup
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And The instructionTypeDropdown element is enabled
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 125           |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the addExpenseButton element
      And I fillout specified text fields with the following text
      #| Element      | Text to enter |
      | expenseAmount | 1             |
      And I click the saveExpenseButton element
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the continueButton element
    Then I should see Please select scholarship/grant type text in grantsEligibleRadioGroupValidationText field
      And The eligibleGrantsYesRadioLabel element is enabled
    When I click the eligibleGrantsYesRadioLabel element
      And The financialAidDropdown element is enabled
      And I select GI Bill from the financialAidDropdown
      And I enter 175 in financialAidAmountInput textfield
      And I click the agreement1Label element
    Then I should see To accept agreement(s), you must type your name exactly as it appears above text in signatureValidationText field
    When I enter Auto Test10 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The signedAgreementDate is visible
      And The current date is present in signedAgreementDate field with format MMM dd yyyy
    When I capture the current application ID from the url
      And I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <approver1> username and <approver1Pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The approveApplicationButton is visible
    When I click the approveApplicationButton element
      And The approveApplicationCommentTextInput is visible
      And I click the approveApplicationWithCommentsButton element
      And I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <approver2> username and <approver2Pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And I should see Intro to Math text in courseAndExpensesName field
      And I should see , (math101) text in coursesExpensesCourseNumber field
      And I should see 1 text in creditsText field
      And I should see NA text in gradeText field
      And I should see N/A text in verifiedText field
      And I should see $126.00 text in requestedText field
    When I click the coursesViewMoreButton element
    Then I should see $125.00 text in tuitionAmt field
      And I should see $1.00 text in requestedBooksAmt field
      And I should see N/A text in discountAmt field
      And I should see $126.00 text in coursesRequestedAmt field
      And I should see $0.00 text in coursesApprovalAmt field
      And I should see $0.00 text in coursesPaidAmt field
      And I should see $126.00 text in coursesExpensesRequested field
      And I should see $0.00 text in coursesExpensesApproved field
      And I should see $126.00 text in totalBenefitText field
      And The grantScholarshipDiscount is not visible
      And I report test passing test status
    Examples:
      | client     | username  | password | approver1 | approver1Pw | approver2  | approver2Pw | testCaseId |
      | lr5tu5demo | atest10   | Welcome1 | atest2    | Welcome1    | atest14    | Welcome1    | 112455     |

  @RegressionTest
  Scenario Outline: TU5 App Summary: Level 2 Approver: Approve application with comment (C2070)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
      And I wait until the tuitionProgramManagement is not visible
    Then I should be on the Home page
    When The NewApplicationButton in the Header component is visible
      And I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The firstEdGoal element is enabled
    When I click the firstEdGoal element
    Then The programsRadioGroup element is enabled
    When I check Direct Bill radio dial from the programsRadioGroup
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 15 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter    |
      | courseNameInput   | Computer Science |
      | courseNumberInput | CompSci 101      |
      | amountInput       | 76.19            |
      | creditHoursInput  | 1                |
      And I select Blended from the instructionTypeDropdown
      And I click the addCourseButton element
    Then I should be on the Courses page
      And The continueButton is visible
    When I scroll to continueButton element
      And I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I click the agreement1Label element
      And I enter Auto Test10 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The paymentPreferenceHeader is not visible
      And The submitApplicationButton is visible
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And I capture the current application ID from the url
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <approver1> username and <approver1pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatusHeaderStatus is visible
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
      And I scroll to approveApplicationButton element
    When I click the approveApplicationButton element
      And The approveApplicationCommentTextInput is visible
      And I click the approveApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
      And I capture the current application ID from the url
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <approver2> username and <approver2pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
      And The denyApplicationButton is visible
      And The approveApplicationButton is visible
    When I click the approveApplicationButton element
      And The approveApplicationCommentTextInput is visible
      And The approveApplicationWithCommentsButton is visible
      And I enter Approved by Automation in approveApplicationCommentTextInput textfield
      And I click the approveApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
      And The statusHistoryHeaderText is visible
      And The exact text in applicationStatus should be LETTER OF CREDIT (LOC) ISSUED
      And I verify Approved by Automation text is displayed
      And I verify Reviewing Application text is not displayed
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And The appHistoryTeamMemberDropdown element is enabled
    When I click the appHistoryTeamMemberDropdown element
      And I enter Auto Test10 in teamMemberSearch textfield
      And I click the firstTeamMemberInList element
      And I wait until the loadingSpinner is not visible
      And I wait until the firstTeamMemberInList is not visible
      And The firstAppNumber is visible
      And I verify applicationStatus is LETTER OF CREDIT (LOC) ISSUED and click appNumberLink
    Then I should be on the Application page
      And The exact text in applicationStatus should be LETTER OF CREDIT (LOC) ISSUED
      And I report test passing test status
    Examples:
      | client     | username | password | approver1 | approver1pw  | approver2  | approver2pw | testCaseId |
      | lr5tu5demo | atest10  | Welcome1 | atest2    | Welcome1     | atest14    | Welcome1    | 112456     |

  @RegressionTest
  Scenario Outline: TU5 App Summary: Level 2 Approver: Approve application without comment (C119529)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
      And I wait until the tuitionProgramManagement is not visible
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the EducationInformation page
    When I click the firstEdGoal element
    Then The programsRadioGroup element is enabled
    When I check Direct Bill radio dial from the programsRadioGroup
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 15 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter    |
      | courseNameInput   | Computer Science |
      | courseNumberInput | CompSci 101      |
      | amountInput       | 76.19            |
      | creditHoursInput  | 1                |
      And I select Blended from the instructionTypeDropdown
      And I click the addCourseButton element
    Then I should be on the Courses page
      And The continueButton is visible
      And I scroll to continueButton element
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I click the agreement1Label element
      And I enter Auto Test10 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The paymentPreferenceHeader is not visible
      And The submitApplicationButton is visible
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And I capture the current application ID from the url
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
    Then The logOutButton in the Header component is visible
    When I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <approver1> username and <approver1pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
    When I click the approveApplicationButton element
      And The approveApplicationCommentTextInput is visible
      And I click the approveApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
      And The exact text in applicationStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
      And I capture the current application ID from the url
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <approver2> username and <approver2pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
      And The denyApplicationButton is visible
      And The approveApplicationButton is visible
    When I click the approveApplicationButton element
      And The approveApplicationCommentTextInput is visible
      And I click the approveApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
      And The statusHistoryHeaderText is visible
      And The exact text in applicationStatus should be LETTER OF CREDIT (LOC) ISSUED
      And I verify Reviewing Application text is not displayed
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And The appHistoryTeamMemberDropdown element is enabled
    When I click the appHistoryTeamMemberDropdown element
      And I enter Auto Test10 in teamMemberSearch textfield
      And I click the firstTeamMemberInList element
      And I wait until the loadingSpinner is not visible
      And I wait until the firstTeamMemberInList is not visible
      And The firstAppNumber is visible
      And I verify applicationStatus is LETTER OF CREDIT (LOC) ISSUED and click appNumberLink
    Then I should be on the Application page
      And The exact text in applicationStatus should be LETTER OF CREDIT (LOC) ISSUED
      And I report test passing test status
    Examples:
      | client     | username | password | approver1 | approver1pw  | approver2  | approver2pw | testCaseId |
      | lr5tu5demo | atest10  | Welcome1 | atest2    | Welcome1     | atest14    | Welcome1    | 112457     |

  @RegressionTest
  Scenario Outline: TU5 When level 2 supervisor is not client admin (C2059)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Home Address text from the addressRadioGroup group
      And I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Master's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
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
    When I enter 03/02/2020 in sessionStartDateInput textfield
      And I enter 03/03/2020 in sessionEndDateInput textfield
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Test |
      | courseNumberInput | Test 202      |
      | amountInput       | 1.11          |
      | creditHoursInput  | 2             |
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
      And I enter Auto Test17 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And I should see Mar 2, 2020 - Mar 3, 2020 text in sessionDatesText field
    When I click the submitApplicationButton element
      And I wait until the contactInformationEditButton is not visible
      And I wait until the cancelApplicationButton is not visible
    Then I should be on the Submission page
      And The submissionIdLink is visible
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And I capture the current application ID from the url
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <approver2> username and <approver2Pw> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And I should see FORWARDED TO SUPERVISOR FOR REVIEW text in applicationStatus field
      And I verify denyApplicationButton text is not displayed
      And I verify approveApplicationButton text is not displayed
      And I report test passing test status
    Examples:
      | client  | username | password | approver2 | approver2Pw | testCaseId |
      | tu5demo | atest17  | Welcome1 | atest10   | Welcome1    | 112458     |

  @RegressionTest
  Scenario Outline: TU5 Direct Bill: Disable Letter of Credit button when the App is in Saved Not Submitted, Submitted Incomplete or Denied status (C2050)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
      And I wait until the tuitionProgramManagement is not visible
    Then I should be on the Home page
      And The newApplicationButton in the Header component is visible
    When I click the newApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The firstEdGoal is visible
    When I click the firstEdGoal element
    Then The programsRadioGroup element is enabled
    When I check Direct Bill radio dial from the programsRadioGroup
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
      And The sessionStartDateInput is visible
    When I enter current date plus 91 days in sessionStartDateInput
      And I enter current date plus 95 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter    |
      | courseNameInput   | Computer Science |
      | courseNumberInput | CompSci 101      |
      | amountInput       | 76.19            |
      | creditHoursInput  | 1                |
      And I select Blended from the instructionTypeDropdown
      And I click the addCourseButton element
      And I wait until the cancelEditsButton is not visible
    Then I should be on the Courses page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Agreement page
      And I capture the current application ID from the url
      And The continueButton is visible
    When I click the cancelButton element
      And I click the saveApplicationForLaterButton in the SaveAppForLaterOrDelete component
      And I navigate to the current application summary page
    Then I should be on the Application page
      And The submittedApplicationActionMenuButton is not visible
    When I click the agreementsEditButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I click the agreement1Label element
      And I enter Auto Test5 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The submitApplicationButton element is enabled
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The exact text in appActionNeededStatus should be SUBMITTED — INCOMPLETE
      And The submittedApplicationActionMenuButton is not visible
    When I click coursesAndExpensesEditButton to go to Courses page
    Then I should be on the Courses page
    When I clear the sessionStartDateInput field
      And I enter 10/31/2018 in sessionStartDateInput textfield
      And I clear the sessionEndDateInput field
      And I enter 11/05/2018 in sessionEndDateInput textfield
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I click the agreement1Label element
      And I enter Auto Test5 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The submitApplicationButton element is enabled
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The exact text in appActionNeededStatus should be DENIED
      And The submittedApplicationActionMenuButton is not visible
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest5  | Welcome1  | 112459     |

  @SmokeTest
  Scenario Outline: Direct Bill and Book application submission(C125418)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
      And I wait until the tuitionProgramManagement is not visible
    Then I should be on the Home page
      And The newApplicationButton in the Header component is visible
    When I click the newApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
    When I click the firstEdGoal element
    Then The programsRadioGroup element is enabled
    When I check Direct Bill radio dial from the programsRadioGroup
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
      And The sessionStartDateInput is visible
    When I enter current date plus -10 days in sessionStartDateInput
      And I enter current date plus -5 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Weird Science |
      | courseNumberInput | GryWyt 1985   |
      | amountInput       | 1.10          |
      | creditHoursInput  | 1             |
      And I select Blended from the instructionTypeDropdown
      And I click the addCourseButton element
      And I wait until the cancelEditsButton is not visible
    Then I should be on the Courses page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Agreement page
      And I capture the current application ID from the url
    When I click the eligibleGrantsNoRadioLabel element
      And I click on agreement1Label using jsExecutor
      And I enter Auto Test10 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The submitApplicationButton is visible
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <approver1> username and <approver1pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I click the approveApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
      And The exact text in applicationStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <approver2> username and <approver2pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The approveApplicationButton is visible
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I click the approveApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
    And The statusHistoryHeaderText is visible
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatus should be LETTER OF CREDIT (LOC) ISSUED
      And The submittedApplicationActionMenuButton is visible
    When I click the submittedApplicationActionMenuButton element
    Then The accessLetterOfCreditButton is visible
      And The submittedAppAddOtherExpenseBtn is visible
    When I click the submittedAppAddOtherExpenseBtn element
      And I wait until the submittedAppAddOtherExpenseBtn is not visible
    Then I should be on the Application page
      And The addCourseRelatedExpenseButton element is enabled
    When I click the addCourseRelatedExpenseButton element
      And I enter 2 in numberOfBooks textfield
      And I enter 10 in expenseRequestedAmount textfield
      And I click the saveEditCourseRelatedExpenseButton element
    Then The editFirstCourseExpense element is enabled
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test10 in signatureInput textfield
      And I click the approveApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The exact text in requestedText should be $10.00
    When I click the submittedApplicationActionMenuButton element
      And I click the cancelApplicationButton element
      And I enter cancel application in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I should be on the home page
    When I navigate to the current application summary page
    Then I should be on the Application page
    When I click the submittedApplicationActionMenuButton element
      And I click on cancelApplicationButton using jsExecutor
      And I enter cancel application in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I report test passing test status
    Examples:
      | client     | username  | password | approver1 | approver1pw | approver2 | approver2pw |  stgTestCaseId |  uatTestCaseId | prodTestCaseId  |
      | lr5tu5demo | atest10   | Welcome1 | atest2    | Welcome1    | atest14   | Welcome1    |  105757        |  122195        | null            |

  @RegressionTest
  Scenario Outline: TU5 View Status History: Verify Display Logic for Submitted - Incomplete status (C94220)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                               |
      | Program                           | Tuition Reimbursement Program       |
      | Session Start Date from Today     | 93                                  |
      | Session End Date from Today       | 95                                  |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in appActionNeededStatus should be SUBMITTED — INCOMPLETE
      And The appSummaryViewAllStatusHistoryBtn is visible
    When I click the appSummaryViewAllStatusHistoryBtn element
    Then The exact text in appStatusHistorySubmittedIncomplete list should be
      #| Text                   |
      | SUBMITTED — INCOMPLETE |
      And The exact text in appStatusHistoryPendingReview list should be
      #| Text                       |
      | SUBMITTED — PENDING REVIEW |
      And The exact text in appReasonText should be Application has been submitted more than 90 days prior to the course start date. This application may be resubmitted for review within the appropriate time frame.
    When I click coursesAndExpensesEditButton to go to Courses page
    Then I should be on the Courses page
    When I clear the sessionStartDateInput field
      And I enter current date plus 15 days in sessionStartDateInput
      And I clear the sessionEndDateInput field
      And I enter current date plus 60 days in sessionEndDateInput
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the agreement1Label element
      And I enter Auto Test5 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The submitApplicationButton element is enabled
    When I click the submitApplicationButton element
    Then I should be on the Submission page
      And The exact text in submissionStatusText should be Your application has been Forwarded to Supervisor For Review
      And The appNumberSubmissionConfirmationPage element is enabled
    When I click the appNumberSubmissionConfirmationPage element
    Then I should be on the Application page
      And The exact text in appActionNeededStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
    When I click the appSummaryViewAllStatusHistoryBtn element
    Then The exact text in appSummaryStatus1Text list should be
      #| Text                              |
      | FORWARDED TO SUPERVISOR FOR REVIEW |
      And The exact text in appStatusHistoryPendingReview list should be
      #| Text                       |
      | SUBMITTED — PENDING REVIEW |
      | SUBMITTED — PENDING REVIEW |
      And The exact text in appStatusHistorySubmittedIncomplete list should be
      #| Text                       |
      | SUBMITTED — INCOMPLETE     |
      And The exact text in appStatusHistorySavedNotSubmitted list should be
      #| Text                      |
      | SAVED — NOT SUBMITTED     |
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest5   | Welcome1 | 112461     |

  @RegressionTest
  Scenario Outline: TU5 Book Application: Verify that Other Expense applications are saved automatically (C16238)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                         |
      | Program                           | Tuition Reimbursement Program |
      | Session Start Date from Today     | 20                            |
      | Session End Date from Today       | 30                            |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And I capture the current application ID from the url
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <approver> username and <approverpw> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The approveApplicationButton element is enabled
    When I click the approveApplicationButton element
      And The approveApplicationCommentTextInput is visible
      And I click the approveApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
      And The exact text in applicationStatus should be APPROVED
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
      And I click the addOtherExpenseButton element
    Then The addCourseRelatedExpenseButton element is enabled
      And The agreementsHeaderText is visible
      And I capture the current application ID from the url
    When I click the navigateToParentAppLink element
    Then I should be on the Application page
      And The appSummaryLinkedAppBtn is visible
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
    When I verify applicationStatus is Saved — Not Submitted and click appNumberLink
    Then I should be on the Application page
      And I confirm current application page matches the captured application ID from the url
      And The cancelApplicationButton is visible
    When I click the cancelApplicationButton element
      And I click the deleteApplicationButton element
    Then I should be on the Application page
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
      And I click the cancelApplicationButton element
      And I enter cancel application in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client  | username | password | approver | approverpw | testCaseId |
      | tu5demo | atest1   | Welcome1 | atest2   | Welcome1   | 112462     |

  @RegressionTest
  Scenario Outline: TU5 DirectBill Level 2 Approver: Verify LOC Issued Button (C108646)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
      And I wait until the tuitionProgramManagement is not visible
    Then I should be on the Home page
      And The newApplicationButton in the Header component is visible
    When I click the newApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
    When I click the firstEdGoal element
    Then The programsRadioGroup element is enabled
    When I check Direct Bill radio dial from the programsRadioGroup
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
      And The sessionStartDateInput is visible
    When I enter current date plus 31 days in sessionStartDateInput
      And I enter current date plus 35 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Weird Science |
      | courseNumberInput | GryWyt 1985   |
      | amountInput       | 1.10          |
      | creditHoursInput  | 1             |
      And I select Blended from the instructionTypeDropdown
      And I click the addCourseButton element
      And I wait until the cancelEditsButton is not visible
    Then I should be on the Courses page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Agreement page
      And I capture the current application ID from the url
    When I click the eligibleGrantsNoRadioLabel element
      And I click the agreement1Label element
      And I enter Auto Test10 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The submitApplicationButton is visible
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <approver1> username and <approver1pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I click the approveApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
      And The exact text in applicationStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <approver2> username and <approver2pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
      And The approveApplicationButton is visible
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I click the approveApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
      And The statusHistoryHeaderText is visible
      And The exact text in applicationStatus should be LETTER OF CREDIT (LOC) ISSUED
      And I verify submittedApplicationActionMenuButton text is not displayed
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <approver1> username and <approver1pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I verify submittedApplicationActionMenuButton text is not displayed
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatus should be LETTER OF CREDIT (LOC) ISSUED
    When I click the submittedApplicationActionMenuButton element
    Then The letterOfCreditButton is visible
      And I report test passing test status
    Examples:
      | client     | username | password | approver1 | approver1pw | approver2 | approver2pw | testCaseId |
      | lr5tu5demo | atest10  | Welcome1 | atest2    | Welcome1    | atest14   | Welcome1    | 112464     |

  @RegressionTest
  Scenario Outline: TU5 Book Application: Cancel Other Expense application rather than submitting (C2002)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                          |
      | Program                           | Tuition Reimbursement Program  |
      | Session Start Date from Today     | 20                             |
      | Session End Date from Today       | 30                             |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And I capture the current application ID from the url
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <approver> username and <approverpw> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The approveApplicationButton element is enabled
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I click the approveApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
      And The exact text in applicationStatus should be APPROVED
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
      And I click the addOtherExpenseButton element
    Then The addCourseRelatedExpenseButton element is enabled
      And The signatureInput element is present
    When I click the addCourseRelatedExpenseButton element
    Then The relatedCourseDropdown element is enabled
      And I wait until the addCourseRelatedExpenseButton is not visible
    When I select None from the relatedCourseDropdown
      And I select Administrative Fee from the expenseTypeNameDropdown
      And I enter 5.12 in expenseRequestedAmount textfield
      And I click the saveEditCourseRelatedExpenseButton element
    Then The agreementsHeaderText is visible
    When I click the eligibleGrantsNoRadioLabel element
      And I click the agreement1Label element
      And I enter Auto Test1 in signatureInput textfield
      And I click the cancelApplicationButton element
    Then The exact text in overlayTitle should be Delete this reimbursement application?
      And The modalCloseButton element is enabled
    When I click the modalCloseButton element
      And I wait until the modalCloseButton is not visible
    Then I should be on the Application page
      And I verify Administrative Fee text is displayed
      And I verify $5.12 text is displayed
      And The signatureInput element is present
      And The cancelApplicationButton element is enabled
    When I click the cancelApplicationButton element
    Then The exact text in overlayTitle should be Delete this reimbursement application?
    When I click the deleteApplicationButton element
      And The submittedApplicationActionMenuButton element is enabled
    Then I confirm current application page matches the captured application ID from the url
    When I click the submittedApplicationActionMenuButton element
    Then The addOtherExpenseButton element is enabled
      And The cancelApplicationButton element is enabled
    When I click the cancelApplicationButton element
      And I enter Cancelled by Automation in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client  | username | password | approver | approverpw | testCaseId |
      | tu5demo | atest1   | Welcome1 | atest2   | Welcome1   | 112465     |

  @RegressionTest
  Scenario Outline: TU5 Add Other Expense button does not appear on parent app if other expense application exists for that app (C2004)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                         |
      | Program                           | Tuition Reimbursement Program |
      | Session Start Date from Today     | 20                            |
      | Session End Date from Today       | 30                            |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And I capture the current application ID from the url
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <approver> username and <approverpw> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The approveApplicationButton element is enabled
    When I click the approveApplicationButton element
      And The approveApplicationCommentTextInput is visible
      And I click the approveApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
      And The exact text in applicationStatus should be APPROVED
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
      And I click the addOtherExpenseButton element
    Then The addCourseRelatedExpenseButton element is enabled
      And The agreementsHeaderText is visible
      And I capture the current application ID from the url
    When I click the navigateToParentAppLink element
    Then I should be on the Application page
      And The appSummaryLinkedAppBtn is visible
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
    Then The addOtherExpenseButton is not visible
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
    When I verify applicationStatus is Saved — Not Submitted and click appNumberLink
    Then I should be on the Application page
      And I confirm current application page matches the captured application ID from the url
      And The cancelApplicationButton element is enabled
    When I click the cancelApplicationButton element
      And I click the deleteApplicationButton element
    Then I should be on the Application page
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
      And I click the cancelApplicationButton element
      And I enter cancel application in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client  | username | password | approver | approverpw | testCaseId |
      | tu5demo | atest1   | Welcome1 | atest2   | Welcome1   | 112467     |

  @RegressionTest
  Scenario Outline: TU5 AppealDeniedApplication option is displayed for ClientAdmin viewing his own submitted application (C122482)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                  |
      | Program                           | Certification Program  |
      | Session Start Date from Today     | -360                  |
      | Session End Date from Today       | -350                  |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton element is enabled
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest3   | Welcome1 | 114236     |

  @RegressionTest
  Scenario Outline: TU5 Verify AppealDeniedApplication option not displayed for Supervisor2 viewing his team's application (C119363)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The scheduleFreeAdvisingLink is visible
    When I Update the tuition API request
      #| Attribute                        | Value                     |
      | Program                           | Direct Bill Program       |
      | Session Start Date from Today     | -360                     |
      | Session End Date from Today       | -350                     |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And I capture the current application ID from the url
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is visible
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I'm on the <client> site
    When I login with <S2Username> username and <S2Password> password
    Then I should be on the home page
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And The teamMember element is enabled
    When I click the appHistoryTeamMemberDropdown element
    And I clear the teamMemberSearch field
    And I enter Auto Test1 in teamMemberSearch textfield
    And I click the appHistoryYourCompanyOption element
    Then I should be on the ApplicationHistory page
      And The appNumberLink in the first appHistoryTile is visible
    When I click the appNumberLink in first appHistoryTile
    Then I should be on the Application page
      And The exact text in applicationStatus should be DENIED
      And The submittedApplicationActionMenuButton is not visible
      And I report test passing test status
    Examples:
      | client  | username | password | S2Username | S2Password | testCaseId |
      | tu5demo | atest1   | Welcome1 | atest10    | Welcome1   | 116061     |

  @RegressionTest
  Scenario Outline:TU5 Verify AppealDeniedApplication option is displayed for Supervisor viewing his own denied application (C122481)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                       |
      | Program                           | Certification Program       |
      | Session Start Date from Today     | -300                       |
      | Session End Date from Today       | -350                       |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton element is enabled
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest2   | Welcome1 | 116333     |

  @RegressionTest
  Scenario Outline:TU5 Verify Status History - Verify Display Logic for Denied Status 930 (C134485)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                         |
      | Program                           | Tuition Reimbursement Program |
      | Session Start Date from Today     | -360                         |
      | Session End Date from Today       | -350                         |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
    When I scroll to statusHistoryHeaderText element
    Then The exact text in appReasonText should be Application exceeds the submission deadline. Applications must be submitted within 90 days after the course end date.
    And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 120147     |

  @RegressionTest
  Scenario Outline:TU5 Verify Certification App information displayed correctly through application flow on PPT view & on Supervisor Action Needed list (C64111)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Certification/Designation from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Virtual Card Certification program radio dial from the programsRadioGroup
      And I click the examLabel element
      And I enter current date plus 15 days in certificationEndDateInput
      And I convert certificationEndDateInput date format from MM/dd/yy to MMM d, yyyy
      And I enter current date plus 10 days in certificationStartDateInput
      And I convert certificationStartDateInput date format from MM/dd/yy to MMM d, yyyy
      And I click the examLabel element
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
    When I fillout specified text fields with the following text
      #| Element   | Text to enter |
      | examName   | Weird Science |
      | examAmount | 1.00          |
      And I enter current date plus 15 days in examDate
      And I convert examDate date format from MM/dd/yy to MMM d, yyyy
      And I click the taxAcknowledgement element
      And I click the addExamButton element
      And I wait until the addExamButton is not visible
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Agreement page
      And I capture the current application ID from the url
    When I click the eligibleGrantsNoRadioLabel element
      And I enter Auto Test2 in signatureInput textfield
      And I click the agreement1Label element
      And I click the continueButton element
    Then I should be on the Application page
      And I validate sessionDatesText date is equal to examDate date
      And I should see Weird Science text in courseAndExpensesName field
      And I should see $1.00 text in requestedText field
      And The submitApplicationButton is visible
    When I click the submitApplicationButton element
    Then I should be on the Submission page
      And I capture the application number submissionIdLink from the submission page
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
    Then The logOutButton in the Header component is visible
    When I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <approver1> username and <approver1pw> password
    Then I should be on the Home page
    When I navigate to page with current application under action needed
    Then I should see FORWARDED TO SUPERVISOR FOR REVIEW in current Application's tile in action needed section
      And I should see Auto Test2 in current Application's tile in action needed section
      And I should see Review Application in current Application's tile in action needed section
      And I should see examDate in current Application's tile in action needed section
      And I should see appNumber in current Application's tile in action needed section
    When I click Review Application button in action needed tile for current application
    Then I should be on the Application page
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
      And I validate sessionDatesText date is equal to examDate date
      And The exact text in courseAndExpensesName should be Weird Science
      And The exact text in requestedText should be $1.00
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I click the approveApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
      And The exact text in applicationStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
    Then The logOutButton in the Header component is visible
    When I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <approver2> username and <approver2pw> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatusHeaderStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
      And I validate sessionDatesText date is equal to examDate date
      And The exact text in courseAndExpensesName should be Weird Science
      And The exact text in requestedText should be $1.00
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I click the approveApplicationWithCommentsButton element
    Then The applicationHasBeenSavedBanner is visible
      And The statusHistoryHeaderText is visible
      And The exact text in applicationStatus should be VIRTUAL CREDIT CARD ISSUED
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
    Then The logOutButton in the Header component is visible
    When I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatus should be VIRTUAL CREDIT CARD ISSUED
      And I validate sessionDatesText date is equal to examDate date
      And I report test passing test status
    Examples:
      | client  | username | password | approver1 | approver1pw | approver2 | approver2pw | testCaseId |
      | tu5demo | atest2   | Welcome1 | atest3    | Welcome1    | atest10   | Welcome1    | 131137     |

  @RegressionTest
  Scenario Outline:TU5 Verify Supervisor Review Page for Dependent & Spouse Applications (C155961)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And I wait until the firstTeamMemberInList is not visible
    When I click the teamMember element
      And I enter Auto Test19 in teamMemberSearch textfield
      And I click the firstTeamMemberInList element
      And The viewMoreLessButton element is enabled
    Then I should be on the ApplicationHistory page
      And The exact text in dependentName list should be
      #|   Text                 |
      |  (for Dependent1 test1) |
      |  (for Spouse1 Test1)    |
    When I click on the element 1 of the list appNumberLink
    Then I should be on the Application page
      And The exact text in sessionStartDate should be Dec 26, 2019
      And The exact text in sessionEndDate should be Dec 28, 2019
      And The exact text in academicCalendar should be Summer
      And The exact text in term should be Semesters
      And I should see $1.00 text in totalBenefitText field
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And I wait until the firstTeamMemberInList is not visible
    When I click the teamMember element
      And I enter Auto Test19 in teamMemberSearch textfield
      And I click the firstTeamMemberInList element
      And The viewMoreLessButton element is enabled
    Then I should be on the ApplicationHistory page
    When I click on the element 2 of the list appNumberLink
    Then I should be on the Application page
      And The exact text in sessionStartDate should be Dec 24, 2019
      And The exact text in sessionEndDate should be Dec 26, 2019
      And The exact text in academicCalendar should be Fall
      And The exact text in term should be Annual
      And The exact text in credits should be 2
      And I should see $10.00 text in totalBenefitText field
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest2   | Welcome1 | 122246     |
