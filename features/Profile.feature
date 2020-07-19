Feature: Profile

  @RegressionTest
  Scenario Outline: TU5 Verify Profile Page contains Username, Program Modal And Change Password (C1860)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The iconProfile in the Header component is visible
    When I click the iconProfile in the Header component
      And I click the profileNav in the Header component
    Then I should be on the Profile page
    When I click the tuitionAssistanceProgramButton element
    Then The ProgramModalText is visible
      And Text in ProgramModalText field is present
      And The exact text in ProgramModalText should be Test modal text for Tuition Reimbursement Program
    When I click the ProgramModalOkButton element
    Then The modal is not visible
    When I click the certificationProgramButton element
    Then The ProgramModalText element is enabled
      And Text in ProgramModalText field is present
      And The exact text in ProgramModalText should be Test modal text for Virtual Card Certification program
    When I click the ProgramModalOkButton element
    Then The modal is not visible
      And The virtualCardProgramButton is visible
      And I scroll to virtualCardProgramButton element
      And The programsRadioGroup element is enabled
    When I click the virtualCardProgramButton element
    Then The exact text in ProgramModalText should be Test modal text for Virtual Card
    When I click the ProgramModalOkButton element
    Then The modal is not visible
      And The exact text in nameText field should be Auto Test2
      And The exact text in usernameText field should be ATest2
      And I scroll to changePasswordButton element
    When I click the changePasswordButton element
    Then I should be on the changePassword page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest2   | Welcome1 | 112393     |

  @RegressionTest
  Scenario Outline: TU5 Verify Updating Your Address, Phone, Email, Program, Degree, FOS and Other FOS text field (C62836)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Profile web page
    Then I should be on the Profile page
    When I select the radio dial with Use Home Address text from the addressRadioGroup group
      And I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the contactInfoSaveButton element
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
    When I select Bachelor's Degree from the educationProgramDropdown
    Then The FieldOfStudyDropdown element is enabled
    When I select Other from the FieldOfStudyDropdown
      And I clear the otherCourseOfStudyInput field
      And I enter Space Exploration in otherCourseOfStudyInput textfield
      And I scroll to providerEditButton element
      And I click the providerEditButton element
    Then The providerName is visible
      And The providerSearchButton is visible
    When I enter Colorado State University Denver Center in providerName textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
      And I wait until the providerSearchResultsTable is not visible
    Then The providerName is visible
      And The exact text in providerName field should be Colorado State University Denver Center
    When I click the educationInformationSaveButton element
    Then The educationProfileSave is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I check Tuition Reimbursement Program radio dial from the programsRadioGroup
    Then The otherCourseOfStudyInput is visible
      And The exact text in otherCourseOfStudyInput field should be Space Exploration
    When I click the continueButton element
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
      And The editFirstCourseButton is visible
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click	   |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test3 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And I capture the current application ID from the url
    When I verify the text below is present on the page
      #| Element             | Text to verify                          |
      | phoneText            | 6178675309                              |
      | emailText            | tamssupport@edassist.com                |
      | employeeProgramText  | Tuition Reimbursement Program           |
      | educationProgramText | Bachelor's Degree                       |
      | specialityText       | Other                                   |
      | otherFOS             | Space Exploration                       |
      | providerNameText     | Colorado State University Denver Center |
    #Reset information on Profile Page
    When I navigate to Profile web page
    Then I should be on the Profile page
    When I select the radio dial with Use Work Address text from the addressRadioGroup group
      And I select the radio dial with Use Work Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the contactInfoSaveButton element
      And The programsRadioGroup element is enabled
      And I check Virtual Card radio dial from the programsRadioGroup
      And I click the providerEditButton element
      And I enter Boston University in providerName textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
      And I wait until the providerSearchResultsTable is not visible
    Then The exact text in providerName field should be Boston University
      And I scroll to educationProgramDropdown element
      And The educationProgramDropdown is visible
    When I select Associate's Degree from the educationProgramDropdown
      And I select Biology from the FieldOfStudyDropdown
    Then I click the educationInformationSaveButton element
    When I navigate to the current application summary page
    Then I should be on the Application page
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest3   | Welcome1 | 112394     |

  @RegressionTest
  Scenario Outline: TU5 Client Admin: Verify Your Team list is correct (C2062)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When The iconProfile in the Header component is visible
    Then I click the iconProfile in the Header component
    When I click the profileNav in the Header component
    Then I should be on the Profile page
      And The exact text in employeeName should be Test1, Auto
      And The exact text in employeeID should be ATest1
      And The exact text in approvalLevel should be Primary
      And The exact text in yourTeamMemberStatus should be Active
      And The exact text in yourTeamMemberRole should be Testing
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest2   | Welcome1 | 112397     |

  @RegressionTest
  Scenario Outline: LR5 Verify user profile page (C45938)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to <home> page
    When I click the iconProfile in the Header component
      And I click the profileNav in the Header component
    Then I should be on the Profile page
    Then The exact text in nameText field should be Auto Test2
      And The exact text in usernameText field should be ATest2
    When I click the changePasswordButton element
    Then I should be on the changePassword page
    When I navigate to Profile web page
    Then I should be on the Profile page
      And The radio dial with Use Home Address text in the addressRadioGroup group is visible
      And The radio dial with Use Work Address text in the addressRadioGroup group is visible
      And The radio dial with Use Home Phone text in the phoneRadioGroup group is visible
      And The radio dial with Use Work Phone text in the phoneRadioGroup group is visible
      And The radio dial with Use Home Email text in the emailRadioGroup group is visible
      And The radio dial with Use Work Email text in the emailRadioGroup group is visible
      And The paymentPreference is not visible
      And The program is not visible
      And The provider is not visible
      And The degree is not visible
      And I report test passing test status
    Examples:
      | client     | username | password | home      | testCaseId |
      | lr5tu5demo | atest2   | Welcome1 | dashboard | 112398     |

  @RegressionTest
  Scenario Outline: TU5 Profile page: Payment Preference is disabled and Home/Work Address = No (C57597)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click tuitionProgramManagement to go to home page
      And I click the iconProfile in the Header component
      And I click the profileNav in the Header component
    Then The paymentPreference is not visible
      And The addressRadioGroup radio group is disabled
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 112399     |

  @RegressionTest
  Scenario Outline: TU5 Profile page: Verify Showing Home/Work Address when it's enabled (C1862)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The iconProfile in the Header component is visible
    When I navigate to Profile web page
    Then I should be on the Profile page
      And The radio dial with Use Home Address text in the addressRadioGroup group is visible
      And The radio dial with Use Work Address text in the addressRadioGroup group is visible
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <username2> username and <password2> password
    Then I should be on the Home page
    When I navigate to Profile web page
    Then I should be on the Profile page
      And The radio dial with Use Home Address text in the addressRadioGroup group is visible
      And I verify Use Work Address text is not displayed
      And I report test passing test status
    Examples:
      | client  | username | password | username2 | password2 | testCaseId |
      | tu5demo | atest5   | Welcome1 | atest7    | Welcome1  | 112400     |

  @RegressionTest
  Scenario Outline: TU5 Profile page: PPT has NO Address on File (C108837)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Profile web page
    Then I should be on the Profile page
      And The nameText is visible
      And The yourAddressHeaderText is not visible
      And I verify Use Work Address text is not displayed
      And I verify Use Home Address text is not displayed
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest21  | Welcome1 | 112401     |

  @RegressionTest
  Scenario Outline: TU5 Profile Page Contact Information: Update and Cancel Your Address, Phone number, Email Address, Program, Degree and FOS (C62837)
    Given I set the <testCaseId>
      Given I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Profile web page
    Then I should be on the Profile page
    When I select the radio dial with Use Home Address text from the addressRadioGroup group
      And I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the contactInfoSaveButton element
    Then I should be on the Profile page
      And The programsRadioGroup element is enabled
    When I check Virtual Card radio dial from the programsRadioGroup
      And I select Certification/Designation from the educationProgramDropdown
      And I select 1st-3rd Class Engineer from the FieldOfStudyDropdown
      And I click the educationInformationSaveButton element
    Then I should be on the Profile page
    When I click the homeNav in the Header component
    Then I should be on the Home page
    When I navigate to Profile web page
    Then I should be on the Profile page
    When I select the radio dial with Use Work Address text from the addressRadioGroup group
      And I select the radio dial with Use Work Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Home Email text from the emailRadioGroup group
      And I click the contactInfoCancelButton element
    Then I should be on the Profile page
    When I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I select Bachelor's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I click the profileEdInfoCancelBtn element
    Then I should be on the Profile page
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The firstRadioButton element is enabled
      And The radio dial with Use Home Address text from the addressRadioGroup group is selected
      And The radio dial with Use Home Phone text from the phoneRadioGroup group is selected
      And The radio dial with Use Work Email text from the emailRadioGroup group is selected
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
      And The radio dial with Virtual Card text from the programRadioGroup group is selected
      And The exact text in degreeObjectiveButton should be Certification/Designation
      And The exact text in fieldOfStudyButton should be 1st-3rd Class Engineer
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest6   | Welcome1 | 112402     |

  @RegressionTest
  Scenario Outline: TU5 Approver Information: First and Second Approvers (C1875)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username2> username and <password2> password
    Then I should be on the Home page
    When I navigate to Profile web page
    Then I should be on the Profile page
      And The approverInformationTile is visible
      And The exact text in firstApproverName should be Auto Test2
      And The exact text in firstApproverPhone should be (800) 649-2568
      And I should see tamssupport@edassist.com text in firstApproverEmail field
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Profile web page
    Then I should be on the Profile page
      And The approverInformationTile is visible
      And The exact text in firstApproverName should be Auto Test2
      And The exact text in firstApproverPhone should be (800) 649-2568
      And I should see tamssupport@edassist.com text in firstApproverEmail field
      And The exact text in secondApproverName should be Auto Test10
      And The exact text in secondApproverPhone should be (800) 649-2568
      And I should see tamssupport@edassist.com text in secondApproverEmail field
      And I report test passing test status
    Examples:
      | client  | username | password | username2 | password2 | testCaseId |
      | tu5demo | atest9   | Welcome1 | atest7    | Welcome1  | 112403     |

  @RegressionTest
  Scenario Outline: TU5 Profile page: Generic Error Banner should not be displayed when participant does not have an approver configured in their profile (C130709)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I click tuitionProgramManagement to go to home page
    When I navigate to Profile web page
    Then I should be on the Profile page
      And The genericErrorBanner is not visible
      And The approverInformationTile is visible
      And The firstApproverName in the approverInformationTile component is not visible
      And The secondApproverName in the ApproverInformationTile component is not visible
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest9141 | Welcome1 | 112468     |

  @RegressionTest
  Scenario Outline: TU5 Supervisor Profile page - Alternate Approver modal UI validation (C119362)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Profile web page
    Then I should be on the Profile page
    When I scroll to yourTeamHeader element
    Then The yourTeamQuestionHeader is visible
      And The exact text in yourTeamQuestionHeader should be Whose tuition applications can I review?
      And The participantNameHeader is visible
      And The employeeIDHeader is visible
      And The approvalLevelHeader is visible
      And The participantStatusHeader is visible
      And The participantRoleHeader is visible
      And The alternateReviewerHeader is visible
      And The headerTooltipProxyReviewer is visible
   When I scroll to headerTooltipProxyReviewer element
      And I hover over the element headerTooltipProxyReviewer
   Then I validate Choose someone to review your team's applications temporarily or permanently. text is present in index 1 of list toolTipTextHeader
      And I validate class attribute contains active value in toolTipTextHeader list at index 1
    When I hover on the element 1 of the list participantProxyEdit
    Then I validate Choose someone to review applications from this team member. text is present in index 1 of list toolTipText
      And I validate class attribute contains active value in toolTipText list at index 1
    When I click on the element 1 of the list participantProxyEdit
    Then The alternateReviewerModalHeader is visible
      And The exact text in alternateReviewerModalHeader should be Alternate Reviewer
      And The exact text in alternateReviewerTxt should be Select someone who can review applications that would normally go to you. Note that your HR department's data may override these settings in the future.
      And The alternateReviewerSearchLabel is visible
      And The startDateSearchLabel is visible
      And The endDateSearchLabel is visible
      And The reasonLabel is visible
      And The alternateReviewerSaveButton is visible
      And The alternateReviewerCloseButton is visible
    When I click the alternateReviewerSaveButton element
    Then The exact text in reviewerSearchError should be Please fill out alternate reviewer field
      And The exact text in reviewerStartDateError should be Starting date is required
      And The exact text in reviewerEndDateError should be Ending date is required
      And The exact text in reviewerReasonError should be Please fill out reason type field
    # Alternate Reviewer Search validation
    When I enter Auto in alternateReviewerSearchField textfield
    Then The exact text in reviewerSearchList list should be
      #|        Text            |
      | Auto Test10 (ATest10)   |
      | Auto Test13 (ATest13)   |
      | Auto Test2 (ATest2)     |
      | Auto Test21 (ATest21)   |
      | Auto Test3 (ATest3)     |
    When I click on the element 1 of the list reviewerSearchList
    Then The reviewerSearchError is not visible
    # Start Date validation
    When I enter current date plus -5 days in startDateSearch
      And I click the alternateReviewerSaveButton element
    Then The exact text in reviewerStartDateError should be Date must be today/after today's date
    When I clear the startDateSearch field
      And I enter current date plus 1 days in startDateSearch
      And I click the alternateReviewerSaveButton element
    Then The reviewerStartDateError is not visible
    # End Date validation
    When I enter current date plus 100 days in endDateSearch
      And I click the alternateReviewerSaveButton element
    Then The exact text in reviewerEndDateError should be Date range must be between 1 and 90 days
    When I clear the endDateSearch field
      And I enter current date plus 2 days in EndDateSearch
      And I click the reasonDropDown element
    Then The reviewerEndDateError is not visible
    # Reason Drop Down validation
      And The exact text in reasonOptions list should be
      #|        Text      |
      | Job Change        |
      | Left company      |
      | Long-term leave   |
      | Maternity leave   |
      | Short-term leave  |
      | Vacation          |
      | Other             |
    When I click on the element 1 of the list reasonOptions
    Then The reviewerReasonError is not visible
    When I click the alternateReviewerCloseButton element
    Then I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest2   | Welcome1 | 126525     |

  @RegressionTest
  Scenario Outline: Tu5 Verify YourFamily section on Profile when user is ineligible to ADD dependent or spouse (C169846)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The iconProfile in the Header component is visible
    When I navigate to Profile web page
    Then I should be on the Profile page
    When I scroll to whoElseWillYouSubmitApplicationsForHeaderText element
    Then The exact text in whoElseWillYouSubmitApplicationsForHeaderText should be Who else will you submit applications for?
      And The addDependentBtn element is disabled
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest18  | Welcome1 | 130795     |

  @RegressionTest
  Scenario Outline: TU5 Verify YourFamily section is NOT displayed on Profile page when user is ineligible for Dependent Programs (C169845)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The iconProfile in the Header component is visible
    When I navigate to Profile web page
    Then I should be on the Profile page
    When I scroll to contactInfoSaveButton element
    Then The yourFamilyHeader is not visible
      And The whoElseWillYouSubmitApplicationsForHeaderText is not visible
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 130789     |
