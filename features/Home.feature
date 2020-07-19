Feature: Home (Tuition/Loan)

  @SmokeTest
  Scenario Outline: LR5/TU5 Header navigation and Toggle between products using dropdown (C55867)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
      And I click the educationCoachingNav in the Header component
    Then I should be on the Advising page
    When I click the paymentHistoryNav in the Header component
    Then I should be on the PaymentRequestHistory page
    When I click the supportNav in the Header component
      And I click the supportLink in the Header component
    Then I should be on the Support page
    When I click the homeNav in the Header component
    Then I should be on the dashboard page
      And The iconProfile in the Header component is visible
    When I click the iconProfile in the Header component
      And I click the profileNav in the Header component
    Then I should be on the Profile page
      And The productSelectionIcon in the Header component is visible
    When I click the productSelectionIcon in the Header component
      And I click the tuitionProductSelection in the Header component
    Then I should be on the home page
      And title should be <title>
      And The scheduleFreeAdvisingLink is visible
    When I click the educationCoachingNav in the Header component
    Then I should be on the Advising page
    When I click the historyNav in the Header component
    Then I should be on the ApplicationHistory page
    When I click the supportNav in the Header component
      And I click the supportLink in the Header component
    Then I should be on the Support page
    When I click the homeNav in the Header component
    Then I should be on the Home page
    When The iconProfile in the Header component is visible
    Then I click the iconProfile in the Header component
      And I click the profileNav in the Header component
    Then I should be on the Profile page
      And The productSelectionIcon in the Header component is visible
    When I click the productSelectionIcon in the Header component
    Then The tuitionProductSelection in the Header component is visible
      And The earlyEducationAndPreschoolLink in the Header component is visible
      And The backUpCareLink in the Header component is visible
      And The collegeCoachLink in the Header component is visible
    When I click the loanProductSelection in the Header component
    Then I should be on the dashboard page
      And title should be <title2>
    When I click the productSelectionIcon in the Header component
      And I click the collegeCoachLink in the Header component
      And I switch to second tab
    Then title should be <title3>
      And I report test passing test status
    Examples:
      | client     | username | password |  title           | title2                     | title3                                |  stgTestCaseId | uatTestCaseId |  prodTestCaseId  |
      | lr5tu5demo | atest2   | Welcome1 |  Home - EdAssist | Loan Repay Home - EdAssist | Home - Bright Horizons College Coach  |  146691        | 146692        |  146693          |

  @RegressionTest
  Scenario Outline: LR5 Verify that site URLs land user on login page (C50504)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to <home> page
      And I go to the home page
      And I navigate to this <url>
    Then I go to the login page
      And I report test passing test status
    Examples:
      | client     | username | password | home      | url                                                 | testCaseId |
      | lr5tu5demo | atest2   | Welcome1 | dashboard | https://lr5demo-stg.edassist.com/#/history/20510494 | 112530     |

  @RegressionTest
  Scenario Outline: LR5 When user has no loan, instructional steps are displayed and History tab is not visible (C45939)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to <home> page
    Then The lrpBannerWelcomeText is visible
      And The lrpBannerInactiveText is visible
      And The paymentHistoryNav in the Header component is visible
      And I report test passing test status
    Examples:
      | client     | username | password | home      | testCaseId |
      | lr5tu5demo | atest4   | Welcome1 | dashboard | 112528     |

  @RegressionTest
  Scenario Outline: LR5 When a user has a loan, loan information displays on a banner (C45941)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to <home> page
      And I should be on the <home> page
    Then The lrpBannerWelcomeText is visible
      And The lrpBannerInactiveText is not visible
      And The activeLoanCardLoanServicerName is visible
      And The activeLoanCardLoanBalance is visible
      And The activeLoanCardLoanFrequency is visible
      And I report test passing test status
    Examples:
      | client     | username | password | home      | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | dashboard | 112529     |

  @RegressionTest
  Scenario Outline: LR5 Verify that users who do not have super admin access cannot see the Loan Servicer tab (C137420)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
    Then The superAdminLoanServicerNavLink is not visible
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | 112517     |

  @RegressionTest
  Scenario Outline: TU5 Messages appear correctly on Home page when opened (C1834)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the <home> page
    When I click the messagesLink element
    Then Text in messagesContentText field is present
    When I click the viewLessButton element
    Then Text in messagesContentText field is not present
    When I click the viewMoreButton element
    Then Text in messagesContentText field is present
      And I report test passing test status
    Examples:
      | client  | username | password | home | testCaseId |
      | tu5demo | atest1   | Welcome1 | Home | 112519     |

  @RegressionTest
  Scenario Outline: TU5 Schedule Free Advising icon is functioning (C1840)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The actionNeededSection is visible
      And The ScheduleFreeAdvisingLink is visible
    When I click on ScheduleFreeAdvisingLink using jsExecutor
    Then I should be on the Advising page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112521     |

  @RegressionTest
  Scenario Outline: TU5 Programs and Benefits section on the home page function correctly (C44709)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the <home> page
      And The actionNeededSection is visible
      And The benefitLimit is visible
    When I select Tuition Reimbursement Program from the ProgramDropdown
      And The DegreeDropdown element is enabled
    Then I select Master's Degree from the DegreeDropdown
      And The PeriodsDropdown element is enabled
    When I select 2019 from the PeriodsDropdown
      And The benefitLimit element is enabled
    Then I should see Limit: $ text in benefitLimit field
      And The DegreeDropdown element is enabled
    When I select Bachelor's Degree from the DegreeDropdown
      And I select 2019 from the PeriodsDropdown
    Then I should see Limit: $ text in benefitLimit field
      And I should see $ text in programBenefitPaidAmount field
      And I should see $ text in programBenefitRequestedAmount field
      And I should see $ text in programBenefitRemainingAmount field
      And The amountSubmittedBar is visible
      And I verify amountSubmittedBar contains $ text
      And I report test passing test status
    Examples:
      | client  | username | password | home | testCaseId |
      | tu5demo | atest2   | Welcome1 | Home | 112527     |

  @RegressionTest
  Scenario Outline: TU5 View Discounts from Eligible Schools icon is functioning (C1839)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the <home> page
      And The ViewDiscountsfromEligibleSchoolsLink is visible
    When I click the ViewDiscountsfromEligibleSchoolsLink element
      And I switch to second tab
    Then I should be on the EducationNetwork page
    When I enter <school> in findASpecificSchoolInput textfield
    Then The exact text in result1Text should be <school>
      And I report test passing test status
    Examples:
      | client  | username | password | home | school                  | testCaseId |
      | tu5demo | atest1   | Welcome1 | Home | Albertus Magnus College | 112520     |

  @RegressionTest
  Scenario Outline: TU5 Session Dates appear on applications listed in Action Needed section (C1844)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The actionNeededDates is visible
      And The actionNeededSessionDates is visible
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112522     |

  @RegressionTest
  Scenario Outline: TU5 Action Needed section does/does not show statuses (C1851)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When The actionNeededSection is visible
    Then I should see SUBMITTED text in one of the appActionNeededStatus fields
      And I should not see FORWARDED TO SUPERVISOR FOR REVIEW text in one of the appActionNeededStatus fields
      And I should not see CLOSED text in one of the appActionNeededStatus fields
      And I should not see PAYMENT/REIMBURSEMENT IN PROGRESS text in one of the appActionNeededStatus fields
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest11  | Welcome1 | 112523     |

  @RegressionTest
  Scenario Outline: TU5 Click an action for several applications to ensure they go to the right page (C2057)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the <home> page
      And The ScheduleFreeAdvisingLink is visible
    When I click the uploadDocumentsButton in first actionNeededCard
    Then I should be on the Application page
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <username2> username and <password2> password
    Then I should be on the <home> page
      And The actionNeededSection is visible
      And The reviewApplicationButton in the first actionNeededCard is visible
    When I click the reviewApplicationButton in first actionNeededCard
    Then I should be on the Application page
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with atest3 username and <password> password
    Then I should be on the <home> page
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When The continueButton element is enabled
      And I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
    When I click the cancelButton element
      And I click the saveApplicationForLaterButton in the SaveAppForLaterOrDelete component
    Then I should be on the <home> page
      And The ScheduleFreeAdvisingLink is visible
      #TU5 Action Needed section shows Saved - Not Submitted (C1858)
      And The submitOrCancelButton in the first actionNeededCard is visible
    #NOTE: Unable to guarantee sort order, this step will fail as data is added
    #And I should see SAVED - NOT SUBMITTED text in one of the appActionNeededStatus fields
    When I click the submitOrCancelButton in first actionNeededCard
    Then I should be on the Application page
      And I report test passing test status
    Examples:
      | client  | username | password | home | username2 | password2 | testCaseId |
      | tu5demo | atest1   | Welcome1 | Home | atest2    | Welcome1  | 112525     |

  @RegressionTest
  Scenario Outline: TU5 Terms & Conditions, Privacy policy links function (C2058)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the <home> page
      And The ScheduleFreeAdvisingLink is visible
    When I click the termsConditions in the Footer component
    Then Text in textArea in the Footer component is present
      And I click the closeBtn in the Footer component
    Then I should be on the <home> page
      And I report test passing test status
    Examples:
      | client  | username | password | home | testCaseId |
      | tu5demo | atest1   | Welcome1 | Home | 112526     |

  @RegressionTest
  Scenario Outline: TU5 Action Needed: Upload and submit Document(s) with and without letter grade (C1853)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Work Address text from the addressRadioGroup group
      And I select the radio dial with Use Work Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I scroll to continueButton element
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element            | Text to enter   |
      | courseNameInput     | Intro to Math   |
      | courseNumberInput   | math101         |
      | amountInput         | 2               |
      | creditHoursInput    | 1               |
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
      And The submitApplicationButton is visible
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
      And I capture the current application ID from the url
    Then I should be on the Application page
      And The exact text in applicationStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with atest2 username and <password> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The approveApplicationButton element is enabled
    When I click on approveApplicationButton using jsExecutor
    Then The approveApplicationCommentTextInput is visible
    When I enter Test: approval comment in approveApplicationCommentTextInput textfield
      And I click the approveApplicationWithCommentsButton element
    Then I should be on the Application page
      And The appSummaryViewAllStatusHistoryBtn is visible
      And The viewMoreAgreementButton is visible
      And Text in applicationStatus field is present
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with atest1 username and <password> password
    Then I should be on the Home page
      And The ScheduleFreeAdvisingLink is visible
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The selectFileLink is visible
    When I upload TestFile.pdf file using the sharedFileUpload component
    Then Text in uploadDocSuccessMessage field is present
    When I select Grades from the documentTypeDropdown
      And The gradeListBox is visible
      And I click the submitDocumentButton element
      And The supportingDocument1 is not visible
      And The submitDocumentButton element is disabled
      And The gradeListBox is visible
    When I select B from the gradeListBox
      And I enter Test:Uploaded grade document. in commentText textfield
      And I click the submitDocumentButton element
    Then The supportingDocument1 is visible
      And The exact text in supportingDocument1 should be Grades
      And I should be on the Application page
      And I refresh the page
      And The submittedApplicationActionMenuButton is visible
    When I click the submittedApplicationActionMenuButton element
      And I click the cancelApplicationButton element
      And I enter Test comment in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112524     |

  @RegressionTest
  Scenario Outline: TU5 Disable Dashboard Cap Calculation = Yes (C1827)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
      And The programsCalculatorApplicationTotal is visible
      And The programDropdown element is enabled
    When I select Prepay Tuition from the programDropdown
      And The degreeDropdownBtn element is enabled
      And I select Associate's Degree from the degreeDropdown
      And The periodsDropdownbtn element is enabled
      And I select 2020 from the periodsDropdown
    Then The benefitRequested is visible
      And The programBenefitsPaidValue is visible
      And The benefitLimit is not visible
      And The benefitRemainingValue is not visible
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 112518     |

  @RegressionTest
  Scenario Outline: TU5: Verify that bulk approvals do not display for users/programs where it is not enabled (C106353)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the home page
      And The actionNeededHeader is visible
      And The actionNeededNormalViewBtn is not visible
      And The actionNeededBulkViewBtn is not visible
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I'm on the <client2> site
      And I login with <username2> username and <password2> password
    Then I should be on the home page
      And The actionNeededHeader is visible
      And The actionNeededNormalViewBtn is not visible
      And The actionNeededBulkViewBtn is not visible
      And I report test passing test status
    Examples:
      | client     | username  | password | client2 | username2 | password2 | testCaseId |
      | eg5tu5demo | ATest2141 | Welcome1 | tu5demo | atest10   | Welcome1  | 112539     |

  @RegressionTest
  Scenario Outline: TU5 Verify navigating away from then back to home preserves users place on the page (C107466)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The actionNeededNormalViewBtn is visible
      And The actionNeededBulkViewBtn is visible
    When I click the actionNeededBulkViewBtn element
    Then The bulkApprovalContainer is visible
    When I click the actionNeededNormalViewBtn element
    Then The paginationContainer is visible
    When I click page 2 on pagination under action needed section
    Then I should be on page 2 under action needed
    When I navigate to History web page
      And I click the homeNav in the Header component
    Then I should be on page 2 under action needed
    When I click the actionNeededBulkViewBtn element
    Then The bulkApprovalContainer is visible
    When I navigate to History web page
      And I click the homeNav in the Header component
    Then The bulkApprovalContainer is visible
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest2   | Welcome1 | 112540     |

  @RegressionTest
  Scenario Outline: TU5 Dashboard page includes proxy user button and status bar displays when impersonating a restricted user (C79001)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the <home> page
    When I click the startStopImpersonationBtn element
    Then The userImpersonation in the UserImpersonation component is visible
      And The exact text in userImpersonation from the UserImpersonation component should be User Impersonation
      And The exact text in impersonateNameId from the UserImpersonation component should be Logged in as Auto Test16 (ATest16)
    When I enter ATest in participantTypeaheadInput textfield
      And The typeaheadUserDropdownFirstOption is visible
      And I click Auto Test15 (ATest15) text in one of the typeaheadUserDropdownOptions fields
    Then I should be on the home page
      And The exact text in userImpersonation from the UserImpersonation component should be User Impersonation
      And The exact text in startStopImpersonationBtn should be Stop
    When I wait until the typeaheadUserDropdownFirstOption is not visible
    Then The exact text in impersonateNameId from the UserImpersonation component should be Logged in as Auto Test15 (ATest15)
    When I click the startStopImpersonationBtn element
    Then The startStopImpersonationBtn element is enabled
    When I click the startStopImpersonationBtn element
    Then The userImpersonation in the UserImpersonation component is visible
      And The exact text in userImpersonation from the UserImpersonation component should be User Impersonation
      And The exact text in impersonateNameId from the UserImpersonation component should be Logged in as Auto Test16 (ATest16)
    When I enter ATest15 in participantTypeaheadInput textfield
    Then The typeaheadUserDropdownFirstOption is visible
    When I click Auto Test15 (ATest15) text in one of the typeaheadUserDropdownOptions fields
    Then I should be on the home page
      And The exact text in userImpersonation from the UserImpersonation component should be User Impersonation
      And The exact text in startStopImpersonationBtn should be Stop
    When I wait until the typeaheadUserDropdownFirstOption is not visible
    Then The exact text in impersonateNameId from the UserImpersonation component should be Logged in as Auto Test15 (ATest15)
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And The exact text in userImpersonation from the UserImpersonation component should be User Impersonation
      And The exact text in impersonateNameId from the UserImpersonation component should be Logged in as Auto Test15 (ATest15)
    When I click the supportNav in the Header component
    Then I should be on the Support page
      And The exact text in userImpersonation from the UserImpersonation component should be User Impersonation
      And The exact text in impersonateNameId from the UserImpersonation component should be Logged in as Auto Test15 (ATest15)
    When I navigate to Profile web page
    Then I should be on the Profile page
      And The exact text in userImpersonation from the UserImpersonation component should be User Impersonation
      And The exact text in impersonateNameId from the UserImpersonation component should be Logged in as Auto Test15 (ATest15)
    When I click the newApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The exact text in userImpersonation from the UserImpersonation component should be User Impersonation
      And The exact text in impersonateNameId from the UserImpersonation component should be Logged in as Auto Test15 (ATest15)
    When I click the homeNav in the Header component
    Then I should be on the <home> page
      And The startStopImpersonationBtn is visible
      And The actionNeededSection is visible
    When I click the appLinkNumber in first appActionNeededTile
    Then I should be on the Application page
      And The exact text in userImpersonation from the UserImpersonation component should be User Impersonation
      And The exact text in impersonateNameId from the UserImpersonation component should be Logged in as Auto Test15 (ATest15)
    When I click the homeNav in the Header component
    Then I should be on the <home> page
    When I click the startStopImpersonationBtn element
      And I wait until the actionNeededHeader is not visible
    Then The exact text in startStopImpersonationBtn should be Start
      And The exact text in participantTypeaheadInput field should be You (Auto Test16)
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
      And I report test passing test status
    Examples:
      | client  | username | password | home  | testCaseId |
      | tu5demo | ATest16  | Welcome1 | Home  | 112536     |

  @RegressionTest
  Scenario Outline: TU5 Verify that a supervisor with no applications to approve cannot see bulk approvals icon (C107468)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then The tuitionProgramManagement element is enabled
    When I click the tuitionProgramManagement element
    Then I should be on the home page
      And The actionNeededHeader is visible
      And The actionNeededNormalViewBtn is not visible
      And The actionNeededBulkViewBtn is not visible
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest6   | Welcome1 | 112541     |

  @RegressionTest
  Scenario Outline: TU5 Restricted User Profile page: Verify Password Reset button is suppressed (C88922)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The iconProfile in the Header component is visible
    When I navigate to Profile web page
    Then I should be on the Profile page
      And The exact text in usernameText field should be ATest16
    When I click the changePasswordButton element
    Then I should be on the changePassword page
      And I click the homeNav in the Header component
      And I should be on the Home page
    When I click the startStopImpersonationBtn element
    Then The userImpersonation in the UserImpersonation component is visible
      And I enter Aut in participantTypeaheadInput textfield
      And The typeaheadUserDropdownFirstOption is visible
      And I click Auto Test15 (ATest15) text in one of the typeaheadUserDropdownOptions fields
      And I should be on the Home page
      And The userImpersonation in the UserImpersonation component is visible
      And The exact text in userImpersonation from the UserImpersonation component should be User Impersonation
    When I enter ATest15 in participantTypeaheadInput textfield
    Then I should be on the Home page
      And The exact text in userImpersonation from the UserImpersonation component should be User Impersonation
    When I navigate to Profile web page
    Then I should be on the Profile page
      And The changePasswordButton is not visible
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | ATest16  | Welcome1 | 112537     |

  @RegressionTest
  Scenario Outline: TU5 Verify repayment deduction per paycheck if min/max are the same value (C131341)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When The payrollRepaymentMethod element is enabled
      And I click the payrollRepaymentMethod element
    Then I validate placeholder attribute value of payrollDeduction is equal to Example: 100.00
      And The payrollDeduction element is disabled
      And The saveChanges element is enabled
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest2   | Welcome1 | 117849     |

  @RegressionTest
  Scenario Outline: TU5 Verify that repayment feature can be enabled when client and program level flags checked (C119520)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The homeRepaymentBanner is not visible
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
    Then The logOutButton in the Header component is visible
    When I click the logOutButton in the Header component
    Then I should be on the Logout page
    Given I'm on the <client2> site
    When I login with <username2> username and <password2> password
    Then The tuitionProgramManagement element is enabled
    When I click the tuitionProgramManagement element
    Then I should be on the home page
      And The saveChanges is visible
      And The exact text in repaymentTotal field should be 24
      And I should see Auto, Repayment is Required text in bannerWelcomeHeader field
      And I should see Repayment Action text in bannerRepaymentAction field
      And I should see Repayment Description text in bannerRepaymentDesc field
      And The payrollRepaymentMethod element is enabled
    When I click the payrollRepaymentMethod element
    Then The payrollDeduction element is enabled
      And I should see The minimum deduction is $10 per check. The maximum is $50. text in payrollDeductionExtraText field
    When I click the checkRepaymentMethod element
    Then The saveChanges element is enabled
      And The getRemittanceForm element is enabled
      And I should see Payable To text in bannerRepayPayableTo field
      And I should see payable address direct billPayable Address text in bannerRepayPayableAddress field
      And I report test passing test status
    Examples:
      | client     | username  | password | client2    | username2 | password2 | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | lr5tu5demo | ATest2    | Welcome1  | 117850     |

  @RegressionTest
  Scenario Outline: TU5 Action Needed: Pagination over 10 applications (C2056)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The actionNeededPagination is visible
      And I verify number of actionNeededCard on the page should be 10
    When I click page 2 on pagination under action needed section
    Then I should be on page 2 under action needed
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | ATest1   | Welcome1 | 119416     |

  @RegressionTest
  Scenario Outline: TU5 Certifications: Verify Exam Dates appear on applications listed in Action Needed section (C1845)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The actionNeededDates is visible
      And I should see any of the below text is displayed in the actionNeededDatesList fields
        | Nov 2, 2019 |
      And I report test passing test status
    Examples:
      | client  | username  | password | testCaseId |
      | tu5demo | atest13   | Welcome1 | 124321     |

  @RegressionTest
  Scenario Outline: EA5 Verify EdAccess Home Page Banner (C144170)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click tuitionProgramManagement to go to home page
    Then I should be on the Home page
      And The edAccessBanner is visible
      And The edAccessMoreInfo is visible
      And The NewApplicationButtonEABanner is visible
    When I click the edAccessMoreInfo element
    Then I should be on the EducationAccess page
    When I click the homeNavEdAccess element
    Then I should be on the Home page
    When I click the NewApplicationButtonEABanner element
    Then I should be on the ContactInformation page
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 117704     |

  @RegressionTest
  Scenario Outline: TU5 Action Needed: Verify applications in certain statuses appear (C160925)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And I should see any of the below text is displayed in the appActionNeededStatus fields
        | SUBMITTED — INCOMPLETE |
        | APPROVED               |
        | SAVED — NOT SUBMITTED  |
    And I report test passing test status
    Examples:
      | client  | username  | password | testCaseId |
      | tu5demo | atest14   | Welcome1 | 124565     |

  @RegressionTest
  Scenario Outline: TU5 Programs and Benefits section on the home page display Non USD Currency (C166105)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And The tuitionProgramManagement element is enabled
      And I click tuitionProgramManagement to go to home page
    Then I should be on the Home page
      And The actionNeededSection is visible
    When I select Prepay Tuition from the ProgramDropdown
      And The DegreeDropdown element is enabled
    Then I select Bachelor's Degree from the DegreeDropdown
      And The PeriodsDropdown element is enabled
    When I select 2020 from the PeriodsDropdown
    Then I should see CAD text in programBenefitPaidAmount field
      And I should see CAD text in programBenefitRequestedAmount field
      And The amountSubmittedBar is visible
      And I verify amountSubmittedBar contains CAD text
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 126672     |

  @RegressionTest
  Scenario Outline: TU5 Verify user can access the EdAccess info page if the banner is dismissed (C166112)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <user> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The edAccessBanner is not visible
    When I click the supportNav in the header component
      And I click the edAccessSupportLink in the header component
    Then I should be on the EdAccessLearnMore page
    When I click the productSelectionIcon in the header component
      And I click the loanProductSelection in the header component
    Then I should be on the dashboard page
      And The newApplicationButton is not visible
    When I click the supportNav in the header component
    Then The edAccessSupportLink in the header component is not visible
      And I report test passing test status
    Examples:
      | client     | user    | password |testCaseId |
      | lr5tu5demo | atest17 | Welcome1 | 126706    |

  @RegressionTest
  Scenario Outline: TU5 Verify that a user who is ineligible for EdAccess does not see EdAccess content (C173737)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The edAccessBanner is not visible
    When I click the supportNav in the header component
    Then The edAccessSupportLink in the header component is not visible
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest5141 | Welcome1 | 131530     |

  @RegressionTest
  Scenario Outline: TU5 Verify that if the repayment amount is less than the minimum amount, the amount defaults to the repayment amount (C131336)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When The payrollRepaymentMethod element is enabled
      And I click the payrollRepaymentMethod element
    Then The exact text in payrollDeduction field should be 50
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest5   | Welcome1 | 133578     |

  @RegressionTest
  Scenario Outline: TU5 Verify that changes can not be made to program on a Loan with Paid Application (C178295)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I go to the Login page
      And I login with AutoTest7 username and Welcome1 password
    Then I should be on the dashboard page
      And I should see PAYMENT PROCESSING text in paymentAppStatus field
    When I click on activeLoansActionButton using jsExecutor
      And I click on editLoanMenuBtn using jsExecutor
    Then The modalTitle is visible
      And I should see We're sorry, you cannot change your program while a payment is processing. Please try again once the payment is sent. text in modaltextBody field
      And I report test passing test status
    Examples:
      | client  | testCaseId |
      | lr5demo | 134220     |
