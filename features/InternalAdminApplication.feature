Feature: Internal Admin Application

  @RegressionTest
  Scenario Outline: IA5: Status Bar Checks (C137406)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click the firstAppNumberLink element
    Then I should be on the InternalAdminApplication page
      And The ea-heading h1 elements contain partial text TUITION
      And The lastUpdatedDate is visible
      And Text in lastUpdatedDate field is present
      And The appHeaderAppStatus is visible
      And Text in appHeaderAppStatus field is present
      And The appHeaderParticipant is visible
      And Text in appHeaderParticipant field is present
      And The appHeaderClient is visible
      And Text in appHeaderClient field is present
      And The applicationActionsBtn is visible
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | Reeves35 | TReeves1 | 120216     |

  @RegressionTest
  Scenario Outline: IA5: Expense component checks (C150797)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click the firstAppNumberLink element
    Then I should be on the InternalAdminApplicationExpenses page
      And The darkBlueCard is visible
      And The courseRequestedHeader is visible
      And The courseApprovedHeader is visible
      And The coursePercentPayoutHeader is visible
      And The coursePaidHeader is visible
      And The coursePercentPayoutHeader is visible
      And The courseRepayDueHeader is visible
      And The grayCard is visible
      And The expenseTotals is visible
      And The expenseCurrency is visible
      And The totalsRequestedHeader is visible
      And The totalsApprovedHeader is visible
      And The totalsPercentPayoutHeader is visible
      And The totalsPaidHeader is visible
      And The totalsPercentPayoutHeader is visible
      And The totalsRepayDueHeader is visible
      And The totalsRequestedAmount is visible
      And The totalsApprovedAmount is visible
      And The totalsPaidAmount is visible
      And The totalsRefundAmount is visible
      And The totalsRepayDueAmount is visible
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | Herpel30 | THerpel1 | 120141     |

  @RegressionTest
  Scenario Outline: IA5: Add New Internal Note UI (C160972)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click the firstAppNumberLink element
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
    When I click the applicationActionsBtn element
    Then The internalNoteLocation element is enabled
    When I click the internalNoteBtn element
    Then The commentTextbox is visible
      And The ea-heading h2 elements contain partial text Internal Note
      And I verify Internal notes can only be seen by other processors and cannot be seen by the participant or application reviewers text is displayed
      And I should see Internal Note text in internalNoteCommentBoxLabel field
    When I enter Automation is adding an Internal Note using Internal Admin!! in commentTextbox textfield
      And I click the closeIcon element
    Then I wait until the commentTextbox is not visible
      And I should not see Automation is adding an Internal Note using Internal Admin!! text in one of the statusHistoryDetails fields
    When I click the internalNoteBtn element
    Then The commentTextbox is visible
    When I enter Comment should not save! in commentTextbox textfield
      And I click the commentCancelBtn element
    Then I wait until the commentTextbox is not visible
      And I should not see Comment should not save! text in one of the statusHistoryDetails fields
    When I click the internalNoteBtn element
    Then The commentTextbox is visible
      And I validate maxlength attribute value of commentTextbox is equal to 1000
      And The commentSubmitBtn element is disabled
    When I enter I am testing Internal NOTES in commentTextbox textfield
      And I click the commentSubmitBtn element
    Then I wait until the commentTextbox is not visible
      And I validate INTERNAL NOTE text is present in index 1 of list statusHistoryTitle
      And I validate class attribute contains darkBlue value in historyCardColor list at index 1
      And I validate I am testing Internal NOTES text is present in index 1 of list statusHistoryDetails
      And I validate From Test 35 Admin Herpel text is present in index 1 of list createdBy without nested statusHistoryDetails element
      And The current date is present in firstDateStamp field with format MMM dd, yyyy
      And The current time is present in firstTimeStamp field
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | Herpel35 | THerpel1 | 124682     |

  @RegressionTest
  Scenario Outline: IA: Courses- View Course Details Other FOS (C169955)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click the firstAppNumberLink element
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
    When I scroll to programEditButton element
    Then The programEditButton element is enabled
      And The fieldOfStudyHeader is visible
    When I click the programEditButton element
      And I select Management from fieldOfStudyDropdown dropdown
      And I click the programSaveButton element
    Then The fieldOfStudyHeader is visible
      And The programEditButton element is enabled
      And The otherFieldOfStudyHeader is not visible
      And The programCancelButton is not visible
      And The programSaveButton is not visible
    When I click the programEditButton element
    Then The programCancelButton is visible
      And The programSaveButton is visible
    When I click the programCancelButton element
    Then The programEditButton is visible
      And The fieldOfStudyHeader is visible
      And The otherFieldOfStudyHeader is not visible
      And The programCancelButton is not visible
      And The programSaveButton is not visible
    When I click the programEditButton element
      And I select Other from fieldOfStudyDropdown dropdown
    Then The otherFieldOfStudyHeaderInsideEdit is visible
      And The otherFieldOfStudyInput element is enabled
    When I click the programSaveButton element
    Then I should see Required text in requiredErrorText field
      And I should see Required Fields are missing, incomplete, or entered incorrectly. Correct the issues in the highlighted fields below before saving. text in alertMessage field
    When I select Accounting from fieldOfStudyDropdown dropdown
    Then The otherFieldOfStudyHeaderInsideEdit is not visible
      And The otherFieldOfStudyInput is not visible
    When I click the programSaveButton element
    Then The programEditButton is visible
      And The fieldOfStudyHeader is visible
      And I should see Accounting text in fieldOfStudyText field
    When I click the programEditButton element
      And I select Other from fieldOfStudyDropdown dropdown
    Then The otherFieldOfStudyHeaderInsideEdit is visible
      And The otherFieldOfStudyInput element is enabled
    When I enter A2345678901234567891123456789212345678931234567894B in otherFieldOfStudyInput textfield
      And I click the programSaveButton element
    Then The programEditButton element is enabled
      And The otherFieldOfStudyHeader is visible
      And I should see Other text in fieldOfStudyText field
      And I should see A2345678901234567891123456789212345678931234567894 text in otherFieldOfStudyText field
    When I click the programEditButton element
      And I select Journalism from fieldOfStudyDropdown dropdown
      And I click the programSaveButton element
    Then The otherFieldOfStudyHeader is not visible
      And I should see Journalism text in fieldOfStudyText field
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | Herpel30 | THerpel1 | 131043     |

  @RegressionTest
  Scenario Outline: IA: Edit Expenses (C173269)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink element is enabled
    When I click the firstAppNumberLink element
    Then I should be on the InternalAdminApplicationExpenses page
      And The applicationActionsBtn element is enabled
    When I scroll to programEditButton element
    Then The expensesActionsBtn element is enabled
    When I click the expensesActionsBtn element
    Then The firstExpenseCard is visible
      And The expenseActionMenuEditBtnLink element is enabled
    When I click the expenseActionMenuEditBtnLink element
    Then The programCancelButton is visible
      And The programSaveButton is visible
    When I clear the courseNameInput field
      And I clear the courseNumberInput field
      And I clear the creditHoursInput field
      And I click the programSaveButton element
    Then The programCancelButton is visible
      And The programSaveButton is visible
    When I enter Reset Name in courseNameInput textfield
      And I enter Cleared101 in courseNumberInput textfield
      And I enter 9 in creditHoursInput textfield
      And I click the programSaveButton element
    Then I should see Reset Name text in one of the expenseCourseNameOutput fields
      And  I should see Cleared101 text in one of the expenseCourseNumberOutput fields
      And I should see 9 text in one of the expenseCreditHoursOutput fields
      And The programSaveButton is not visible
      And The programCancelButton is not visible
      And The expensesActionsBtn is visible
    When I click the expensesActionsBtn element
    Then The firstExpenseCard is visible
      And The expenseActionMenuEditBtnLink element is enabled
    When I click the expenseActionMenuEditBtnLink element
    Then The programCancelButton is visible
      And The programSaveButton is visible
    When I clear the courseNameInput field
      And I clear the courseNumberInput field
      And I clear the creditHoursInput field
      And I click the programSaveButton element
    Then The programCancelButton is visible
      And The programSaveButton is visible
    When I enter New101 in courseNameInput textfield
      And I enter TestCourse in courseNumberInput textfield
      And I enter 2 in creditHoursInput textfield
      And I click the programSaveButton element
    Then I should see New101 text in one of the expenseCourseNameOutput fields
      And  I should see TestCourse text in one of the expenseCourseNumberOutput fields
      And I should see 2 text in one of the expenseCreditHoursOutput fields
      And The programSaveButton is not visible
      And The programCancelButton is not visible
      And The expensesActionsBtn is visible
    When I click the expensesActionsBtn element
    Then The firstExpenseCard is visible
      And The expenseActionMenuEditBtnLink element is enabled
    When I click the expenseActionMenuEditBtnLink element
    Then The programCancelButton is visible
      And The programSaveButton is visible
    When I enter B12345 in courseNameInput textfield
      And I enter B1234 in courseNumberInput textfield
      And I enter 1 in creditHoursInput textfield
      And I click the programCancelButton element
    Then I should see New101 text in one of the expenseCourseNameOutput fields
      And  I should see TestCourse text in one of the expenseCourseNumberOutput fields
      And I should see 2 text in one of the expenseCreditHoursOutput fields
      And The programSaveButton is not visible
      And The programCancelButton is not visible
      And The expensesActionsBtn is visible
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | King35   | TKing1   | 131118     |

  @SmokeTest
  Scenario Outline: IA5: Add New Application Comment UI (C139388)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click the firstAppNumberLink element
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
    When I click the applicationActionsBtn element
    Then The commentToParticipantLocation element is enabled
    When I click the commentToParticipantBtn element
    Then The commentTextbox is visible
      And The ea-heading h2 elements contain partial text Comment To Participant
      And I verify Comments can be seen by the participant and application reviewers. text is displayed
      And I should see Comment text in commentBoxLabel field
    When I enter Automation is adding a comment to the participant using Internal Admin!! in commentTextbox textfield
      And I click the closeIcon element
    Then I wait until the commentTextbox is not visible
      And I should not see Automation is adding a comment to the participant using Internal Admin!! text in one of the statusHistoryDetails fields
    When I click the commentToParticipantBtn element
    Then The commentTextbox is visible
      And the sendEmailForComment is selected
      And The sendEmailForCommentLabel element is enabled
    When I click the sendEmailForCommentLabel element
      And I enter Comment should not save! in commentTextbox textfield
    Then The sendEmailForCommentLabel element is enabled
      And the sendEmailForComment is not selected
    When I click the commentCancelBtn element
    Then I wait until the commentTextbox is not visible
      And I should not see Comment should not save! text in one of the statusHistoryDetails fields
    When I click the commentToParticipantBtn element
    Then The commentTextbox is visible
      And I validate maxlength attribute value of commentTextbox is equal to 1000
      And the sendEmailForComment is selected
      And The commentSubmitBtn element is disabled
    When I enter I am testing Comment to PPT in commentTextbox textfield
      And I click the commentSubmitBtn element
    Then I wait until the commentTextbox is not visible
      And I validate COMMENT text is present in index 1 of list statusHistoryTitle
      And I validate class attribute contains grayLight value in historyCardColor list at index 1
      And I validate I am testing Comment to PPT text is present in index 1 of list statusHistoryDetails
      And I validate From Test 35 Admin Herpel text is present in index 1 of list createdBy without nested statusHistoryDetails element
      And The current date is present in firstDateStamp field with format MMM dd, yyyy
      And The current time is present in firstTimeStamp field
      And I report test passing test status
    Examples:
      | client        | username | password | stgTestCaseId | uatTestCaseId | prodTestCaseId  |
      | internaladmin | Herpel35 | THerpel1 | 114410        | 133904        | 133905          |

  @RegressionTest
  Scenario Outline: IA: Application - Agreements (C173267)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click the firstAppNumberLink element
    Then I should be on the InternalAdminApplication page
    When I scroll to agreementsHeader element
    Then The agreementsHeader is visible
      And The signed is visible
      And Text in signee field is present
      And The firstAgreementsText is not visible
      And I verify the agreementsTimestamp date/time is in format MMM dd, yyyy - hh:mm a with timezone = MT
      And The viewMore element is enabled
    When I click the viewMore element
    Then The firstAgreementText is visible
      And Text in firstAgreementText field is present
      And I validate class attribute value of viewMoreViewLess is equal to fa fa-angle-down toggle-arrow toggled
      And The viewLess element is enabled
    When I click the viewLess element
    Then The firstAgreementsText is not visible
      And The viewMore element is enabled
      And I validate class attribute value of viewMoreViewLess is not equal to fa fa-angle-down toggle-arrow toggled
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | Herpel30 | THerpel1 | 131110     |

  @MockDataRegressionTest
  Scenario Outline: IA5: Actions - Status Change Button Check buttons present(C178176)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click 5381991 text in one of the appNumber fields
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see SUBMITTED — PENDING REVIEW text in appHeaderAppStatus field
    When I click the applicationActionsBtn element
    Then The approveBtn element is enabled
      And The denyBtn element is enabled
      And The incompleteBtn element is enabled
      And The cancelBtn element is enabled
      And The internalNoteLocation element is enabled
      And The commentToParticipantLocation element is enabled
      And I verify VOID text is not displayed
    When I move to homeTab xpath element and click
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click 5866021 text in one of the appNumber fields
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see SUBMITTED — INCOMPLETE text in appHeaderAppStatus field
    When I click the applicationActionsBtn element
    Then The approveBtn element is enabled
      And The denyBtn element is enabled
      And The incompleteBtn element is enabled
      And The cancelBtn element is enabled
      And The internalNoteLocation element is enabled
      And The commentToParticipantLocation element is enabled
      And I verify VOID text is not displayed
    When I move to homeTab xpath element and click
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click 4658086 text in one of the appNumber fields
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see FORWARDED TO SUPERVISOR FOR REVIEW text in appHeaderAppStatus field
    When I click the applicationActionsBtn element
    Then The approveBtn element is enabled
      And The denyBtn element is enabled
      And The incompleteBtn element is enabled
      And The cancelBtn element is enabled
      And The internalNoteLocation element is enabled
      And The commentToParticipantLocation element is enabled
      And I verify VOID text is not displayed
    When I move to homeTab xpath element and click
    Then I should be on the InternalAdminHome page
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | Kuss30   | TKuss1   | 134387     |

  @MockDataRegressionTest
  Scenario Outline: IA5: Actions - Status Change Button Check buttons absent (C178177)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click 5138571 text in one of the appNumber fields
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see CANCELLED text in appHeaderAppStatus field
    When I click the applicationActionsBtn element
    Then The approveBtn is not visible
      And The denyBtn is not visible
      And The incompleteBtn is not visible
      And The cancelBtn is not visible
      And The accessLocLocation is not visible
      And The internalNoteLocation element is enabled
      And The commentToParticipantLocation element is enabled
      And I verify VOID text is not displayed
    When I move to homeTab xpath element and click
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click 4991070 text in one of the appNumber fields
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see DENIED text in appHeaderAppStatus field
    When I click the applicationActionsBtn element
    Then The approveBtn is not visible
      And The denyBtn is not visible
      And The incompleteBtn is not visible
      And The cancelBtn is not visible
      And The accessLocLocation is not visible
      And The internalNoteLocation element is enabled
      And The commentToParticipantLocation element is enabled
      And I verify VOID text is not displayed
    When I move to homeTab xpath element and click
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click 5203499 text in one of the appNumber fields
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see PAYMENT/REIMBURSEMENT IN PROGRESS text in appHeaderAppStatus field
    When I click the applicationActionsBtn element
    Then The approveBtn is not visible
      And The denyBtn is not visible
      And The incompleteBtn is not visible
      And The cancelBtn is not visible
      And The accessLocLocation is not visible
      And The internalNoteLocation element is enabled
      And The commentToParticipantLocation element is enabled
      And I verify VOID text is not displayed
    When I move to homeTab xpath element and click
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click 5305510 text in one of the appNumber fields
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see PAYMENT REVIEW text in appHeaderAppStatus field
    When I click the applicationActionsBtn element
    Then The approveBtn is not visible
      And The denyBtn is not visible
      And The incompleteBtn is not visible
      And The cancelBtn is not visible
      And The accessLocLocation is not visible
      And The internalNoteLocation element is enabled
      And The commentToParticipantLocation element is enabled
      And I verify VOID text is not displayed
    When I move to homeTab xpath element and click
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click 5857340 text in one of the appNumber fields
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see APPROVED text in appHeaderAppStatus field
    When I click the applicationActionsBtn element
    Then The approveBtn is not visible
      And The denyBtn is not visible
      And The incompleteBtn is not visible
      And The cancelBtn is not visible
      And The accessLocLocation is not visible
      And The internalNoteLocation element is enabled
      And The commentToParticipantLocation element is enabled
      And I verify VOID text is not displayed
    When I move to homeTab xpath element and click
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click 5919581 text in one of the appNumber fields
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see LETTER OF CREDIT (LOC) ISSUED text in appHeaderAppStatus field
    When I click the applicationActionsBtn element
    Then The approveBtn is not visible
      And The denyBtn is not visible
      And The incompleteBtn is not visible
      And The cancelBtn is not visible
      And The accessLocLocation element is enabled
      And The internalNoteLocation element is enabled
      And The commentToParticipantLocation element is enabled
      And I verify VOID text is not displayed
    When I move to homeTab xpath element and click
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I click 5931262 text in one of the appNumber fields
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see VIRTUAL CREDIT CARD ISSUED text in appHeaderAppStatus field
    When I click the applicationActionsBtn element
    Then The approveBtn is not visible
      And The denyBtn is not visible
      And The incompleteBtn is not visible
      And The cancelBtn is not visible
      And The accessLocLocation is not visible
      And The internalNoteLocation element is enabled
      And The commentToParticipantLocation element is enabled
      And I verify VOID text is not displayed
    When I move to homeTab xpath element and click
    Then I should be on the InternalAdminHome page
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | Kuss30   | TKuss1   | 134388     |

  @RegressionTest
  Scenario Outline: IA5: Actions - Approve Application with comment (C137402)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I retrieve session token and participantID after login
      And I Update the JSON file before doing a API request
        #| Attribute                        | Value                          |
        | Program                           | Tuition Reimbursement Program  |
        | Session Start Date from Today     | 1                              |
        | Session End Date from Today       | 10                             |
        | Comments                          | true                           |
        | Field of Study                    | Other                          |
        | Other Field of Study              | "Automation Test"              |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The submittedApplicationActionMenuButton element is enabled
      And I should see SUBMITTED — PENDING REVIEW text in applicationStatus field
    When I capture the current application ID from the url
      And I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
    Then The logOutButton in the Header component is visible
    When I click the logOutButton in the Header component
    Then I should be on the Login page
    When I'm on the <client2> site
      And I login with <username2> username and <password2> password
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink element is enabled
    When I navigate to the current application summary page
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see SUBMITTED — PENDING REVIEW text in appHeaderAppStatus field
      And I validate MANUAL text is present in index 1 of list statusHistoryTitle
      And I validate From Program Rules - Submission FOS (Other) Validation text is present in index 1 of list createdBy without nested statusHistoryDetails element
      And I validate The Field of Study entered as Other is not an exact match to a previously approved application. A new FOS requires validation of program eligibility. text is present in index 1 of list statusHistoryDetails
    When  I click on resolveBtn using jsExecutor
    Then The commentTextbox is visible
      And The ea-heading h2 elements contain partial text Add Exception
    When I enter Automation is Resolving Other FOS rule in commentTextbox textfield
      And I click the commentSubmitBtn element
    Then I wait until the commentTextbox is not visible
      And I validate EXCEPTION text is present in index 1 of list statusHistoryTitle
      And I validate Automation is Resolving Other FOS rule text is present in index 1 of list statusHistoryDetails
      And The current date is present in firstDateStamp field with format MMM dd, yyyy
    When I click the applicationActionsBtn element
    Then The actionMenu is visible
      And The approveBtn element is enabled
    When I click the approveBtn element
    Then The commentTextbox is visible
      And The ea-heading h2 elements contain partial text Approve Application
      And I verify Are you sure you want to approve this application? text is displayed
      And I should see Comment text in internalNoteCommentBoxLabel field
    When I enter Automation is adding an Approval comment using Internal Admin!! in commentTextbox textfield
      And I click the closeIcon element
    Then I wait until the commentTextbox is not visible
      And I should not see Automation is adding an Approval comment using Internal Admin!! text in one of the statusHistoryDetails fields
    When I click the approveBtn element
    Then The commentTextbox is visible
    When I enter Comment should not save! in commentTextbox textfield
      And I click the commentCancelBtn element
    Then I wait until the commentTextbox is not visible
      And I should not see Comment should not save! text in one of the statusHistoryDetails fields
    When I click the approveBtn element
    Then The commentTextbox is visible
      And I validate maxlength attribute value of commentTextbox is equal to 1000
    When I enter Approved using automation and Internal Admin with comment. in commentTextbox textfield
      And I click the approveBtnOnModel element
    Then I wait until the commentTextbox is not visible
      And I validate FORWARDED TO SUPERVISOR FOR REVIEW text is present in index 1 of list statusHistoryTitle
      And I validate Status Change by Reeves, Test 35 Admin text is present in index 1 of list createdBy
      And I validate COMMENT text is present in index 2 of list statusHistoryTitle
      And I validate Approved using automation and Internal Admin with comment. text is present in index 2 of list statusHistoryDetails
      And I validate From Reeves, Test 35 Admin text is present in index 2 of list createdBy without nested statusHistoryDetails element
      And I should see FORWARDED TO SUPERVISOR FOR REVIEW text in appHeaderAppStatus field
      And The current date is present in firstDateStamp field with format MMM dd, yyyy
      And The current time is present in firstTimeStamp field
      And I report test passing test status
    Examples:
      | client  | username | password | client2       | username2 | password2 | testCaseId |
      | tu5demo | atest5   | Welcome1 | internaladmin | Reeves35  | TReeves1  | 134383     |

  @RegressionTest
  Scenario Outline: IA5: Actions - Approve Application without comment (C178178)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I retrieve session token and participantID after login
      And I Update the JSON file before doing a API request
        #| Attribute                        | Value                          |
        | Program                           | Tuition Reimbursement Program  |
        | Session Start Date from Today     | 1                              |
        | Session End Date from Today       | 10                             |
        | Comments                          | true                           |
        | Field of Study                    | Other                          |
        | Other Field of Study              | "Automation Test"              |
    Then I create tuition application using API
    When  I navigate to the current application summary page
    Then I should be on the Application page
      And The submittedApplicationActionMenuButton element is enabled
      And I should see SUBMITTED — PENDING REVIEW text in applicationStatus field
    When I capture the current application ID from the url
      And I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
    Then The logOutButton in the Header component is visible
    When I click the logOutButton in the Header component
    Then I should be on the Login page
    When I'm on the <client2> site
      And I login with <username2> username and <password2> password
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink element is enabled
    When I navigate to the current application summary page
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see SUBMITTED — PENDING REVIEW text in appHeaderAppStatus field
      And I validate MANUAL text is present in index 1 of list statusHistoryTitle
      And I validate From Program Rules - Submission FOS (Other) Validation text is present in index 1 of list createdBy without nested statusHistoryDetails element
      And I validate The Field of Study entered as Other is not an exact match to a previously approved application. A new FOS requires validation of program eligibility. text is present in index 1 of list statusHistoryDetails
      And I click on resolveBtn using jsExecutor
    Then The commentTextbox is visible
      And The ea-heading h2 elements contain partial text Add Exception
    When I enter Automation is Resolving Other FOS rule in commentTextbox textfield
      And I click the commentSubmitBtn element
    Then I wait until the commentTextbox is not visible
      And I validate EXCEPTION text is present in index 1 of list statusHistoryTitle
      And I validate Automation is Resolving Other FOS rule text is present in index 1 of list statusHistoryDetails
      And The current date is present in firstDateStamp field with format MMM dd, yyyy
    When I click the applicationActionsBtn element
    Then The actionMenu is visible
      And The approveBtn element is enabled
    When I click the approveBtn element
    Then The commentTextbox is visible
      And The ea-heading h2 elements contain partial text Approve Application
      And I verify Are you sure you want to approve this application? text is displayed
    When I click the approveBtnOnModel element
    Then I wait until the commentTextbox is not visible
      And I validate FORWARDED TO SUPERVISOR FOR REVIEW text is present in index 1 of list statusHistoryTitle
      And I validate Status Change by Reeves, Test 35 Admin text is present in index 1 of list createdBy
      And I validate COMMENT text is present in index 2 of list statusHistoryTitle
      And I validate Approve text is present in index 2 of list statusHistoryDetails
      And I validate From Reeves, Test 35 Admin text is present in index 2 of list createdBy without nested statusHistoryDetails element
      And I should see FORWARDED TO SUPERVISOR FOR REVIEW text in appHeaderAppStatus field
      And The current date is present in firstDateStamp field with format MMM dd, yyyy
      And The current time is present in firstTimeStamp field
      And I report test passing test status
    Examples:
      | client  | username | password | client2       | username2 | password2 | testCaseId |
      | tu5demo | atest5   | Welcome1 | internaladmin | Reeves35  | TReeves1  | 134389     |

  @MockDataRegressionTest
  Scenario Outline: IA5: Related Applications - Present [1 Parent 1 Child] (C160892)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I set the current ApplicaionID to 10126459
      And I navigate to the current application summary page
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And The appHeaderRelated is visible
      And The appHeaderRelatedAppNum is visible
    When I scroll to firstExpenseCard element
    Then I should be on the InternalAdminApplicationExpenses page
      And I validate Tuition text is present in index 1 of list expenseTableExpenseDescription
      And I validate $10.00 text is present in index 2 of list expenseTableRequestedAmount
      And I validate $10.00 text is present in index 2 of list expenseTableApprovedAmount
      And I validate $10.00 text is present in index 2 of list expenseTablePaidAmount
      And I validate Course Related Fee text is present in index 2 of list expenseTableExpenseDescription
      And I validate $1.00 text is present in index 3 of list expenseTableRequestedAmount
      And I validate $1.00 text is present in index 3 of list expenseTableApprovedAmount
      And I validate $1.00 text is present in index 3 of list expenseTablePaidAmount
      And I should see $11.00 text in totalsRequestedAmount field
      And I should see $11.00 text in totalsApprovedAmount field
      And I should see $11.00 text in totalsPaidAmount field
    When I scroll to appHeaderAppStatus element
      And I confirm the href of link with text 6020153 should be 10126478 then I click
    Then I should be on the InternalAdminApplication page
      And I should see 6020134 text in appHeaderRelatedAppNum field
    When I scroll to firstExpenseCard element
    Then I should be on the InternalAdminApplicationExpenses page
      And I validate Tuition text is present in index 1 of list expenseTableExpenseDescription
      And I validate $0.00 text is present in index 2 of list expenseTableRequestedAmount
      And I validate $0.00 text is present in index 2 of list expenseTableApprovedAmount
      And I validate - text is present in index 2 of list expenseTablePaidAmount
      And I validate Course Related Fee text is present in index 2 of list expenseTableExpenseDescription
      And I validate $33.00 text is present in index 3 of list expenseTableRequestedAmount
      And I validate $33.00 text is present in index 3 of list expenseTableApprovedAmount
      And I validate - text is present in index 3 of list expenseTablePaidAmount
      And I should see $33.00 text in totalsRequestedAmount field
      And I should see $33.00 text in totalsApprovedAmount field
      And I should see $0.00 text in totalsPaidAmount field
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | Reeves30 | TReeves1 | 138161     |

  @MockDataRegressionTest
  Scenario Outline: IA5: Related Applications - Present [1 Parent 1 Child 1 Sub-Child] (C185337)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I set the current ApplicaionID to 10127171
      And I navigate to the current application summary page
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And The appHeaderRelated is visible
      And The appHeaderRelatedAppNum is visible
    When I scroll to firstExpenseCard element
    Then I should be on the InternalAdminApplicationExpenses page
      And I validate Tuition text is present in index 1 of list expenseTableExpenseDescription
      And I validate $5.00 text is present in index 2 of list expenseTableRequestedAmount
      And I validate $5.00 text is present in index 2 of list expenseTableApprovedAmount
      And I validate $5.00 text is present in index 2 of list expenseTablePaidAmount
      And I should see $5.00 text in totalsRequestedAmount field
      And I should see $5.00 text in totalsApprovedAmount field
      And I should see $5.00 text in totalsPaidAmount field
    When I scroll to appHeaderAppStatus element
    Then I should not see 6020848 text in appHeaderRelatedAppNum element
    When I confirm the href of link with text 6020847 should be 10127172 then I click
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see 6020846 text in one of the appHeaderRelatedAppNumList fields
      And I should see 6020848 text in one of the appHeaderRelatedAppNumList fields
    When I scroll to firstExpenseCard element
    Then I should be on the InternalAdminApplicationExpenses page
      And I validate Tuition text is present in index 1 of list expenseTableExpenseDescription
      And I validate $0.00 text is present in index 2 of list expenseTableRequestedAmount
      And I validate $0.00 text is present in index 2 of list expenseTableApprovedAmount
      And I validate $0.00 text is present in index 2 of list expenseTablePaidAmount
      And I validate Course Related Fee text is present in index 2 of list expenseTableExpenseDescription
      And I validate $18.65 text is present in index 3 of list expenseTableRequestedAmount
      And I validate $18.65 text is present in index 3 of list expenseTableApprovedAmount
      And I validate $18.65 text is present in index 3 of list expenseTablePaidAmount
      And I should see $18.65 text in totalsRequestedAmount field
      And I should see $18.65 text in totalsApprovedAmount field
      And I should see $18.65 text in totalsPaidAmount field
    When I scroll to appHeaderAppStatus element
      And I confirm the href of link with text 6020848 should be 10127173 then I click
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see 6020847 text in appHeaderRelatedAppNum field
      And I should not see 6020846 text in appHeaderRelatedAppNum element
    When I scroll to firstExpenseCard element
    Then I should be on the InternalAdminApplicationExpenses page
      And I validate Tuition text is present in index 1 of list expenseTableExpenseDescription
      And I validate $0.00 text is present in index 2 of list expenseTableRequestedAmount
      And I validate $0.00 text is present in index 2 of list expenseTableApprovedAmount
      And I validate - text is present in index 2 of list expenseTablePaidAmount
      And I validate Course Related Fee text is present in index 2 of list expenseTableExpenseDescription
      And I validate $6.28 text is present in index 3 of list expenseTableRequestedAmount
      And I validate $6.28 text is present in index 3 of list expenseTableApprovedAmount
      And I validate - text is present in index 3 of list expenseTablePaidAmount
      And I should see $6.28 text in totalsRequestedAmount field
      And I should see $6.28 text in totalsApprovedAmount field
      And I should see $0.00 text in totalsPaidAmount field
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | Reeves30 | TReeves1 | 139814     |

  @MockDataRegressionTest
  Scenario Outline: IA5: Related Applications - Present [1 Parent 2 Children] (C185338)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I set the current ApplicaionID to 4746131
      And I navigate to the current application summary page
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And The appHeaderRelated is visible
      And The appHeaderRelatedAppNum is visible
    When I scroll to firstExpenseCard element
    Then I should be on the InternalAdminApplicationExpenses page
      And I validate Tuition text is present in index 1 of list expenseTableExpenseDescription
      And I validate $1,350.00 text is present in index 2 of list expenseTableRequestedAmount
      And I validate $1,350.00 text is present in index 2 of list expenseTableApprovedAmount
      And I validate $1,350.00 text is present in index 2 of list expenseTablePaidAmount
      And I should see $1,350.00 text in totalsRequestedAmount field
      And I should see $1,350.00 text in totalsApprovedAmount field
      And I should see $1,350.00 text in totalsPaidAmount field
    When I scroll to appHeaderAppStatus element
    Then I should be on the InternalAdminApplication page
      And I should see 6020845 text in one of the appHeaderRelatedAppNumList fields
    When I confirm the href of link with text 6020844 should be 10127169 then I click
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see 5210466 text in appHeaderRelatedAppNum field
      And I should not see 6020845 text in appHeaderRelatedAppNum element
    When I scroll to firstExpenseCard element
    Then I should be on the InternalAdminApplicationExpenses page
      And I validate Tuition text is present in index 1 of list expenseTableExpenseDescription
      And I validate $0.00 text is present in index 2 of list expenseTableRequestedAmount
      And I validate $0.00 text is present in index 2 of list expenseTableApprovedAmount
      And I validate - text is present in index 2 of list expenseTablePaidAmount
      And I validate Course Related Fee text is present in index 2 of list expenseTableExpenseDescription
      And I validate $4.88 text is present in index 3 of list expenseTableRequestedAmount
      And I validate $4.88 text is present in index 3 of list expenseTableApprovedAmount
      And I validate - text is present in index 3 of list expenseTablePaidAmount
      And I should see $4.88 text in totalsRequestedAmount field
      And I should see $4.88 text in totalsApprovedAmount field
      And I should see $0.00 text in totalsPaidAmount field
    When I scroll to appHeaderAppStatus element
    Then I should be on the InternalAdminApplication page
    When I confirm the href of link with text 5210466 should be 4746131 then I click
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see 6020844 text in one of the appHeaderRelatedAppNumList fields
    When I confirm the href of link with text 6020845 should be 10127170 then I click
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And I should see 5210466 text in appHeaderRelatedAppNum field
      And I should not see 6020844 text in appHeaderRelatedAppNum element
    When I scroll to firstExpenseCard element
    Then I should be on the InternalAdminApplicationExpenses page
      And I validate Tuition text is present in index 1 of list expenseTableExpenseDescription
      And I validate $0.00 text is present in index 2 of list expenseTableRequestedAmount
      And I validate $0.00 text is present in index 2 of list expenseTableApprovedAmount
      And I validate - text is present in index 2 of list expenseTablePaidAmount
      And I validate Books text is present in index 2 of list expenseTableExpenseDescription
      And I validate $37.09 text is present in index 3 of list expenseTableRequestedAmount
      And I validate $37.09 text is present in index 3 of list expenseTableApprovedAmount
      And I validate - text is present in index 3 of list expenseTablePaidAmount
      And I should see $37.09 text in totalsRequestedAmount field
      And I should see $37.09 text in totalsApprovedAmount field
      And I should see $0.00 text in totalsPaidAmount field
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | Reeves30 | TReeves1 | 139820     |

  @MockDataRegressionTest
  Scenario Outline: IA5: Related Applications - Absent (C165962)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink is visible
    When I set the current ApplicaionID to 4854525
      And I navigate to the current application summary page
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And The appHeaderRelated is not visible
      And The appHeaderRelatedAppNum is not visible
    When I set the current ApplicaionID to 4500736
      And I navigate to the current application summary page
    Then I should be on the InternalAdminApplication page
      And The applicationActionsBtn element is enabled
      And The appHeaderRelated is not visible
      And The appHeaderRelatedAppNum is not visible
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | Reeves30 | TReeves1 | 138162     |
