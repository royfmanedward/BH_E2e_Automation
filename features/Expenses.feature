Feature: Expenses and Courses (Tuition Step 3)

  @RegressionTest
  Scenario Outline: TU5 Verify Courses Step 3 Session Information: Add, Edit course (C55922)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Master's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I clear the sessionEndDateInput field
    Then I enter current date plus 60 days in sessionEndDateInput
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 125           |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
    Then I should be on the Courses page
      And The courseNameInputText is visible
      And The exact text in courseNameInputText should be Intro to Math (math101)
      And The exact text in creditHoursInputText should be 1
      And The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
    When I click the editFirstCourseButton element
    Then The saveEditsButton is visible
      And The courseNameInput is visible
    When I enter Myedit in courseNameInput textfield
      And I click the taxAcknowledgement element
    Then I click the saveEditsButton element
      And The continueButton is visible
      And I scroll to continueButton element
    When I click the continueButton element
    Then I should be on the Agreement page
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112497     |

  @RegressionTest
  Scenario Outline: TU5 Add Multiple Courses, Remove courses and Cancel course (C55923)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Master's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I clear the sessionEndDateInput field
    Then I enter current date plus 60 days in sessionEndDateInput
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 125           |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
      And I wait until the addCourseButton is not visible
    Then The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
      And The cancelButton is visible
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Bio  |
      | courseNumberInput | bio101        |
      | amountInput       | 125           |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
    Then The addCourseButton is visible
    When I click the addCourseButton element
      And I wait until the addCourseButton is not visible
    Then The editSecondCourseButton is visible
      And The removeSecondCourseButton is visible
      And The cancelButton is visible
    When I click the removeSecondCourseButton element
    Then The editFirstCourseButton is visible
      And I verify number of editFirstCourseButtonList on the page should be 1
    When I click the cancelButton element
      And I click the deleteApplicationButton element
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112498     |

  @RegressionTest
  Scenario Outline: TU5 Step 3: Add Course Information: All required fields validations (C53809)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The actionNeededHeader element is enabled
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I scroll to continueButton element
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Master's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
      And The continueButton element is enabled
    When I click the continueButton element
    Then The exact text in courseStartDateValidation should be Course Start date is required.
      And The exact text in courseEndDateValidation should be Course End date is required.
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus -1 days in sessionEndDateInput
    Then The exact text in courseEndDateValidation should be Course End date is required.
    When I enter current date plus 10 days in sessionEndDateInput
      And I click on continueButton using jsExecutor
    Then I should see Please add at least one course before you proceed text in applicationErrorMessage field
    When I click the addCourseAndExpensesButton element
      And I click on addCourseButton using jsExecutor
    Then The exact text in courseNameValidationText should be Please fill out course name field
      And The exact text in courseNumberValidationText should be Please fill out course number field
      And The exact text in requestedAmountValidationText should be Please fill out tuition amount field
      And The exact text in instructionTypeNameValidationText should be Please fill out instruction type field
      And The exact text in taxAcknowledgementValidationText should be This field is required
    When I enter I am testing that 40 characters will fit here in courseNameInput textfield
      And I enter Limit Twelve Here in courseNumberInput textfield
      And I enter -9500.01 in amountInput textfield
      And I enter -50 in creditHoursInput textfield
      And I select Online from the instructionTypeDropdown
      And I click the addExpenseButton element
      And I wait until the addExpenseButton is not visible
    Then The otherExpenseType is visible
    When I select Course Related from the otherExpenseType
      And I enter 6ABC in expenseAmount textfield
      And I click TAB key in expenseAmount textfield
      And I click the saveExpenseButton element
    Then The exact text in firstExpenseText should be Course Related Fee
      And I should see $6.00 text in one of the expenseRequestedAmt fields
      And I click the taxAcknowledgement element
    When I click the addCourseButton element
    Then The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
      And The addCourseAndExpensesButton element is enabled
      And I scroll to addCourseAndExpensesButton element
      And The addCourseAndExpensesButton is visible
      And The addCourseButton is not visible
    When I click the addCourseAndExpensesButton element
      And I enter SecondCourseName in courseNameInput textfield
      And I enter Course2 in courseNumberInput textfield
      And I enter 0.01 in amountInput textfield
      And I enter 0.5 in creditHoursInput textfield
      And I select Unknown from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
      And I wait until the addCourseButton is not visible
    Then The editSecondCourseButton is visible
      And The removeSecondCourseButton is visible
      And The addCourseAndExpensesButton element is enabled
    When I click the addCourseAndExpensesButton element
      And I enter 3rd Course Name in courseNameInput textfield
      And I enter 3rd Course in courseNumberInput textfield
      And I enter 500ABC in amountInput textfield
      And I enter 3.1 in creditHoursInput textfield
      And I select Unknown from the instructionTypeDropdown
      And I click the addExpenseButton element
      And I wait until the addExpenseButton is not visible
    Then The otherExpenseType is visible
    When I select Books from the otherExpenseType
      And I enter -5 in bookQuantity textfield
      And I enter 2561.37 in expenseAmount textfield
      And I click the saveExpenseButton element
    Then The otherExpenseType is not visible
    When I click the addExpenseButton element
      And I wait until the addExpenseButton is not visible
    Then The otherExpenseType is visible
    When I select Course Related from the otherExpenseType
      And I enter -9.01 in expenseAmount textfield
      And I click TAB key in expenseAmount textfield
      And I click the saveExpenseButton element
    Then The exact text in firstExpenseText should be Books: 5
      And I should see $2,561.37 text in one of the expenseRequestedAmt fields
      And The exact text in secondExpenseText should be Course Related Fee
      And I should see $9.01 text in one of the expenseRequestedAmt fields
    When I click the taxAcknowledgement element
      And I click the addCourseButton element
      And I wait until the addCourseButton is not visible
    Then The editThirdCourseButton is visible
      And The removeThirdCourseButton is visible
      And The addCourseAndExpensesButton element is enabled
    When I click the addCourseAndExpensesButton element
      And I enter Test Course Name # $ymbols*! in courseNameInput textfield
      And I enter Math#101! in courseNumberInput textfield
      And I enter 0 in amountInput textfield
      And I enter 0 in creditHoursInput textfield
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
    Then The exact text in courseNameInput field should be Test Course Name # $ymbols*!
      And The exact text in courseNameValidationText should be No special characters allowed
      And The exact text in courseNumberInput field should be Math#101!
      And The exact text in courseNumberValidationText should be No special characters allowed
    When I clear the courseNameInput field
      And I enter Fixed Name in courseNameInput textfield
      And I clear the courseNumberInput field
      And I enter FixedNum in courseNumberInput textfield
      And I click the addCourseButton element
    Then I wait until the addCourseButton is not visible
      And The addExpenseButton element is enabled
    When I click the addExpenseButton element
      And I wait until the addExpenseButton is not visible
    Then The otherExpenseType is visible
      And I scroll to otherExpenseType element
    When I select Administrative Fee from the otherExpenseType
      And I enter -5.55 in expenseAmount textfield
      And I click TAB key in expenseAmount textfield
      And I click the taxAcknowledgement element
    Then The exact text in expenseAmount field should be 5.55
    When I click the saveExpenseButton element
    Then The cancelButton element is enabled
      And I should see I am testing that 40 characters will fit (Limit Twelve) text in courseNameInputText field
      And I should see $9,500.01 text in firstCourseRequestedAmt field
      And I should see $6.00 text in firstCourseExpenseAmt field
      And I should see 50 text in creditHoursInputText field
      And I should see $9,506.01 text in one of the totalRequestedAmt fields
      And I should see SecondCourseName (Course2) text in secondCourseNameInputText field
      And I should see $0.01 text in secondCourseRequestedAmt field
      And I should see $0.00 text in secondCourseExpenseAmt field
      And I should see 0.5 text in secondCreditHoursInputText field
      And I should see $0.01 text in one of the totalRequestedAmt fields
      And I should see 3rd Course Name (3rd Course) text in thirdCourseNameInputText field
      And I should see $500.00 text in thirdCourseRequestedAmt field
      And I should see $2,570.38 text in thirdCourseExpenseAmt field
      And I should see 3.1 text in thirdCreditHoursInputText field
      And I should see $3,070.38 text in one of the totalRequestedAmt fields
      And I should see Fixed Name (FixedNum) text in fourthCourseNameInputText field
      And I should see $0.00 text in fourthCourseRequestedAmt field
      And I should see $0.00 text in fourthCourseExpenseAmt field
      And I should see 0 text in fourthCreditHoursInputText field
      And I should see $0.00 text in one of the totalRequestedAmt fields
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112496     |

  @RegressionTest
  Scenario Outline: TU5 Verify Total Amount equals the total of Course and Expenses amounts (C1888)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
    When I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I select Bachelor's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I clear the sessionEndDateInput field
    Then I enter current date plus 60 days in sessionEndDateInput
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 100           |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
    Then I click the addExpenseButton element
      And The saveExpenseButton is visible
      And The expenseTypeDropdown is visible
    When I select Course Related Fee from the expenseTypeDropdown
      And The cancelExpenseButton is visible
    Then I click the expenseAmount element
      And I fillout specified text fields with the following text
      #| Element      | Text to enter |
      | expenseAmount | 5             |
    Then I click the saveExpenseButton element
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
      And I wait until the addCourseButton is not visible
    Then The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
      And The cancelButton is visible
    Then I verify the text below is present on the page
      #| Element                | Text to verify |
      | firstCourseRequestedAmt | $100.00        |
      | firstCourseExpenseAmt   | $5.00          |
      | examTotalAmount         | $105.00        |
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112489     |

  @RegressionTest
  Scenario Outline: TU5 Submit an Other Expense application with multiple expenses against a single course (C2000)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I clear the sessionEndDateInput field
    Then I enter current date plus 60 days in sessionEndDateInput
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 100           |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
    Then I click the addExpenseButton element
    When I select Course Related Fee from the expenseTypeDropdown
      And I fillout specified text fields with the following text
      #| Element      | Text to enter |
      | expenseAmount | 5             |
      And I click the saveExpenseButton element
      And I click the addExpenseButton element
    Then The expenseTypeDropdown is visible
    When I select Books from the expenseTypeDropdown
      And I fillout specified text fields with the following text
      #| Element      | Text to enter |
      | bookQuantity  | 2             |
      | expenseAmount | 5             |
      And I click the saveExpenseButton element
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
      And I verify the text below is present on the page
      #| Element                | Text to verify |
      | firstCourseRequestedAmt | $100.00        |
      | firstCourseExpenseAmt   | $10.00         |
      | examTotalAmount         | $110.00        |
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112490     |

  @RegressionTest
  Scenario Outline: TU5 Add exam & edit exam (C2042)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                              |
      | Program                           | Virtual Card Certification program |
      | Program Subtype                   | Exam                               |
      | Certificate Start Date From Today | 0                                  |
      | Certificate End Date From Today   | 60                                 |
    Then I create tuition application until programInformationStep using API
    When I navigate to Expense Information web page
    Then I should be on the Courses page
    When I enter MBA Entrance Exam in examName textfield
      And I enter 15 in examAmount textfield
      And I enter current date plus 0 days in examDate
      And I click the taxAcknowledgement element
      And I click the addExamButton element
    Then The exact text in examTotalAmount should be $15.00
    When I click the editExamButton element
      And I enter 1 in examAmount textfield
      And I click the taxAcknowledgement element
      And I click the addExamButton element
      And I wait until the addExamButton is not visible
    Then The exact text in examTotalAmount should be $151.00
    When I click the cancelButton element
      And I click the closeModalBtn in the SaveAppForLaterOrDelete component
      And I wait until the closeModalBtn in the SaveAppForLaterOrDelete component is not visible
    Then I should be on the Courses page
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the Agreement page
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112492     |

  @RegressionTest
  Scenario Outline: TU5 Step 5: Verify exam amount is displayed and Save For Later and delete application (C2044)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Certification/Designation from the educationProgramDropdown
      And The fieldOfStudyDropdown is visible
      And I select Accounting from the fieldOfStudyDropdown
      And I check Virtual Card Certification program radio dial from the programsRadioGroup
      And I enter current date plus 0 days in cerfificationStartDateInput
      And I enter current date plus 60 days in cerfificationEndDateInput
      And I select the radio dial with Exam text from the certificationType group
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter MBA Entrance Exam in examName textfield
      And I enter 15 in examAmount textfield
      And I enter current date plus 0 days in examDate
      And I click the taxAcknowledgement element
      And I click the addExamButton element
    Then The exact text in examTotalAmount should be $15.00
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The exact text in requestedText should be $15.00
    When I click the cancelButton element
      And I click the saveApplicationForLaterButton element
    Then The cancelButton is not visible
      And I should be on the Home page
      #And The scheduleFreeAdvisingLink is visible
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And The appHistoryViewMoreApps is visible
      And The applicationStatus in the first appHistoryTile is visible
      And The exact text in applicationStatus in the first appHistoryTile should be SAVED — NOT SUBMITTED
    When I click the appNumberLink in first appHistoryTile
    Then I should be on the Application page
      And I capture the current application ID from the url
      And I delete current tuition application using API
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
    When I click the appNumberLink in first appHistoryTile
    Then I should be on the Application page
    When I capture and compare the actual app ID from url and previous app ID are not equal
    Then I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112493     |

  @RegressionTest
  Scenario Outline: TU5 Book Application: Verify canceling, editing, adding expenses behaves correctly (C2006)
    #Setup
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
      And I wait until the tuitionProgramManagement is not visible
    Then I should be on the Home page
      And The actionNeededSection is visible
      And The newApplicationButton in the Header component is visible
    When I click the newApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
    When I click the firstEdGoal element
    Then The programsRadioGroup element is enabled
    When I check Direct Bill radio dial from the programsRadioGroup
    Then The continueButton element is enabled
      And I scroll to end of the page
    When I click on continueButton using jsExecutor
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
      And The approveApplicationButton element is enabled
    When I click on approveApplicationButton using jsExecutor
    Then The approveApplicationCommentTextInput is visible
    When I click on approveApplicationWithCommentsButton using jsExecutor
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
      And The approveApplicationButton element is enabled
    When I click on approveApplicationButton using jsExecutor
    Then The approveApplicationCommentTextInput is visible
    When I click on approveApplicationWithCommentsButton using jsExecutor
    Then The applicationHasBeenSavedBanner is visible
      And The statusHistoryHeaderText is visible
      And The exact text in applicationStatus should be LETTER OF CREDIT (LOC) ISSUED
      And I verify submittedApplicationActionMenuButton text is not displayed
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
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
    Then The submittedAppAddOtherExpenseBtn is visible
    When I click the submittedAppAddOtherExpenseBtn element
      And I wait until the submittedAppAddOtherExpenseBtn is not visible
    # Begin verifications
    Then I should be on the Application page
      And The addCourseRelatedExpenseButton element is enabled
    When I click the addCourseRelatedExpenseButton element
    Then The cancelRelatedExpense is visible
    When I enter 1 in numberOfBooks textfield
      And I enter 5 in expenseRequestedAmount textfield
      And The cancelRelatedExpense element is enabled
      And I click the cancelRelatedExpense element
    Then I verify number of relatedExpenseCard on the page should be 0
      And The addCourseRelatedExpenseButton element is enabled
    When I click the addCourseRelatedExpenseButton element
      And I wait until the addCourseRelatedExpenseButton is not visible
    Then The cancelRelatedExpense is visible
    When I enter 2 in numberOfBooks textfield
      And I enter 10 in expenseRequestedAmount textfield
      And I click the saveEditCourseRelatedExpenseButton element
      And I click the removeFirstCourseExpense element
      And I wait until the removeFirstCourseExpense is not visible
      And The addCourseRelatedExpenseButton is visible
    Then I verify number of relatedExpenseCard on the page should be 0
    When I click the addCourseRelatedExpenseButton element
    Then The cancelRelatedExpense is visible
    When I enter 3 in numberOfBooks textfield
      And I enter 15 in expenseRequestedAmount textfield
      And I click the saveEditCourseRelatedExpenseButton element
      And I click the addCourseRelatedExpenseButton element
    Then The relatedCourseDropdown is visible
      And The cancelRelatedExpense is visible
    When I enter 4 in numberOfBooks textfield
      And I enter 20 in expenseRequestedAmount textfield
      And I click the saveEditCourseRelatedExpenseButton element
    Then The removeFirstCourseExpense element is enabled
      And The removeSecondCourseExpense element is enabled
    When I click the removeFirstCourseExpense element
      And I refresh the page
    Then The editFirstCourseExpense element is enabled
      And I verify number of expenseCardList on the page should be 1
    When I click on editFirstCourseExpense using jsExecutor
    Then The saveEditCourseRelatedExpenseButton element is enabled
      And The cancelRelatedExpense is visible
    When I enter 1 in numberOfBooks textfield
      And I enter 1 in expenseRequestedAmount textfield
      And I click the saveEditCourseRelatedExpenseButton element
      And I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test10 in signatureInput textfield
      And I click the approveApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The exact text in requestedText should be $201.00
      And The exact text in coursesExpensesRequested should be $201.00
      And The exact text in coursesExpensesApproved should be $201.00
      And The exact text in totalBenefitText should be $201.00
    When I click the submittedApplicationActionMenuButton element
      And I click the cancelApplicationButton element
      And I enter cancel application in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I should be on the home page
    When I navigate to the current application summary page
    Then I should be on the Application page
    When I click the submittedApplicationActionMenuButton element
    Then The cancelApplicationButton element is enabled
    When I click the cancelApplicationButton element
      And I enter cancel application in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I report test passing test status
    Examples:
      | client     | username | password | approver1 | approver1pw | approver2 | approver2pw | testCaseId |
      | lr5tu5demo | atest10  | Welcome1 | atest2    | Welcome1    | atest14   | Welcome1    | 112491     |

  @RegressionTest
  Scenario Outline: TU5 Verify Minimum and Maximum number of courses per application indicated in program setup (C1784)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I clear the sessionEndDateInput field
    Then I enter current date plus 60 days in sessionEndDateInput
    When I click the continueButton element
      # Verify minimum number of courses
      And I should see Please add at least one course before you proceed text in errorText field
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 125           |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
      And I wait until the addCourseButton is not visible
    Then The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
      And The continueButton is visible
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Bio  |
      | courseNumberInput | bio101        |
      | amountInput       | 125           |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
      And I wait until the addCourseButton is not visible
    Then The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
      And The continueButton is visible
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter  |
      | courseNameInput   | Intro to Chem  |
      | courseNumberInput | chem101        |
      | amountInput       | 125            |
      | creditHoursInput  | 1              |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
      And I wait until the addCourseButton is not visible
    Then The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
      And The cancelButton is visible
      And I scroll to addCourseAndExpensesButton element
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter     |
      | courseNameInput   | Intro to Physics  |
      | courseNumberInput | phy101            |
      | amountInput       | 125               |
      | creditHoursInput  | 1                 |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
      And I wait until the addCourseButton is not visible
    Then The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
      And The cancelButton is visible
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter     |
      | courseNameInput   | Intro to History  |
      | courseNumberInput | hist101           |
      | amountInput       | 125               |
      | creditHoursInput  | 1                 |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
      And I wait until the addCourseButton is not visible
    Then The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
      And The cancelButton is visible
    When I click the addCourseAndExpensesButton element
      And I should see Maximum number of courses reached text in helpBlock field
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112484     |

  @RegressionTest
  Scenario Outline: TU5 Verify 0 tax questions course and non-course expense tax sections (C1796)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The scheduleFreeAdvisingLink is visible
    When I click the homeNav in the Header component
      And The actionNeededSection is visible
      And I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When The continueButton element is enabled
      And I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I clear the sessionEndDateInput field
    Then I enter current date plus 60 days in sessionEndDateInput
    When I click the addCourseAndExpensesButton element
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
      And The addExpenseButton element is enabled
    When I click the addExpenseButton element
      And I wait until the addExpenseButton is not visible
      And I select Non-Course Related Fee from the expenseTypeDropdown
      And I enter 200 in expenseAmount textfield
      And I click the taxAcknowledgement element
      And I click the saveExpenseButton element
      And The editFirstOtherExpenseButton is visible
      And I click the continueButton element
    Then I should be on the Agreement page
    When I click the cancelButton element
      And I click the deleteApplicationButton in the SaveAppForLaterOrDelete component
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112485     |

  @RegressionTest
  Scenario Outline: TU5 Verify 1 tax question for course related expenses (C88952)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the home page
      And The NewApplicationButton in the Header component is visible
      And The edGoalsTile is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The educationProgramDropdown is not visible
      And The firstEdGoal is visible
    When I click the firstEdGoal element
    Then I check Tuition Reimbursement radio dial from the programsRadioGroup
    When I click the continueButton element
    Then I should be on the Courses page
    When The sessionEndDateInput is visible
    Then I enter current date plus 0 days in sessionStartDateInput
      And I clear the sessionEndDateInput field
    When I enter current date plus 60 days in sessionEndDateInput
    Then I click the addCourseAndExpensesButton element
      And I select Classroom from the instructionTypeDropdown
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 125           |
      | creditHoursInput  | 1             |
      And I click the courseRelatedTaxYesOption element
    Then The exact text in nontaxableMessage should be course non taxable popup info content
    When I click the courseRelatedTaxNoOption element
    Then The exact text in taxableMessage should be course taxable popup info
    When I click the addCourseButton element
      And The editFirstCourseButton is visible
      And I click the continueButton element
    Then I should be on the Agreement page
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | 112501     |

  @RegressionTest
  Scenario Outline: TU5 Verify 1 tax question for non-course related expenses (C88953)
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
      And The firstEdGoal is visible
    When I click the firstEdGoal element
      And The educationProviderEditButton is not visible
    Then I check Tuition Reimbursement radio dial from the programsRadioGroup
    When I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I clear the sessionEndDateInput field
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addExpenseButton element
    Then The otherExpenseType is visible
      And I scroll to sessionEndDateInput element
      And I scroll to otherExpenseType element
      And I select Administrative Fee from the otherExpenseType
      And I enter 5 in expenseAmount textfield
      And I click the expenseRelatedTaxYesOption element
    Then The exact text in nontaxableMessage should be Expense non taxable popup info
    When I click the expenseRelatedTaxNoOption element
    Then The exact text in taxableMessage should be Expense taxable popup info
    When I click the saveExpenseButton element
    Then The expenseCardItem is visible
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | 112502     |

  @RegressionTest
  Scenario Outline: TU5 Verify displayed Course Related Expenses dropdown matches those that are configured in program setup (C1806)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the home page
      And The NewApplicationButton in the Header component is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Work Address text from the addressRadioGroup group
      And I select the radio dial with Use Work Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And The programsRadioGroup element is enabled
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
      And The sessionStartDateInput is visible
    When I enter current date plus 0 days in sessionStartDateInput
    Then The sessionEndDateInput is visible
      And I clear the sessionEndDateInput field
    When I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I click the addExpenseButton element
    Then The expenseTypeDropdown is visible
    When I select Books from the expenseTypeDropdown
      And I select Course Related Fee from the expenseTypeDropdown
      And I should not see Parking text in one of the otherExpenseTypeDropdowns fields
    When I click the cancelEditsButton element
      And I capture the current application ID from the url
    Then I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112486     |

  @RegressionTest
  Scenario Outline: TU5 Verify displayed Non-Course Related Expenses dropdown matches those that are configured in program setup (C1811)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the home page
      And The NewApplicationButton in the Header component is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Work Address text from the addressRadioGroup group
      And I select the radio dial with Use Work Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I clear the sessionEndDateInput field
    Then I enter current date plus 60 days in sessionEndDateInput
    When I click the addExpenseButton element
    Then The otherExpenseType is visible
    When I select Administrative Fee from the otherExpenseType
      And I select Non-Course Related Fee from the otherExpenseType
      And I select Registration Fee from the otherExpenseType
    Then I should not see Parking Fee text in one of the otherExpenseTypeDropdowns fields
    When I wait until the cancelEditsButton is not visible
      And I capture the current application ID from the url
    Then I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112487     |

  @RegressionTest
  Scenario Outline: TU5 Verify site does NOT display Non-Course Related Expenses for a client with this functionality disabled (C1812)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the home page
      And The NewApplicationButton in the Header component is visible
    When I click the homeNav in the Header component
      And I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
    When I select Master's Degree from the educationProgramDropdown
      And I select Business from the FieldOfStudyDropdown
      And I check Graduate Degree Program radio dial from the programsRadioGroup
      And I click the educationProviderEditButton element
    Then The providerSearchButton is visible
    When I enter Boston College in providerName textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
    Then I should be on the EducationInformation page
    When I click the continueButton element
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
      | courseWebAddress  | www.google.com |
      And I select Classroom from the instructionTypeDropdown
      And I click the courseScheduleDay0 element
      And I click the courseScheduleDay1 element
      And I click the following elements
      #| Element                |
      | courseStartTime0        |
      | courseStartTime0Option0 |
      | courseEndTime0          |
      | courseEndTime0Option1   |
      | courseStartTime1        |
      | courseStartTime1Option1 |
      | courseEndTime1          |
      | courseEndTime1Option2   |
      And I click the addCourseButton element
    Then I should be on the courses page
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 112488     |

  @RegressionTest
  Scenario Outline: TU5 Verify Payment Preference is NOT an option for Direct Bill Application (C57655)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The educationProgramDropdown is visible
      And The FieldOfStudyDropdown is visible
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select SM from the FieldOfStudyDropdown
      And I check Prepay Tuition radio dial from the programsRadioGroup
      And I click the educationProviderEditButton element
    Then The providerName is visible
      And The providerSearchButton is visible
    When I enter Boston University in providerName textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
    Then I should be on the EducationInformation page
      And The continueButton element is enabled
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
      And I wait until the creditHoursInput is not visible
    Then I should be on the Courses page
      And The cancelButton is visible
      And The continueButton is visible
    When I scroll to continueButton element
      And I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The paymentPreferenceHeader is not visible
    When I enter Test Comment in applicationConfirmationCommentInput textfield
      And I click the submitApplicationButton element
    Then I should be on the Submission page
    When I scroll to submissionIdLink element
      And I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The paymentPreferenceHeader is not visible
    When I click the submittedApplicationActionMenuButton element
      And I click the cancelApplicationButton element
      And I enter cancel application in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 112500     |

  @RegressionTest
  Scenario Outline: TU5 Step 3: Add, Edit, and Delete Non-Course Related Expenses (C52498)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Master's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
      When I enter current date plus 0 days in sessionStartDateInput
    And I enter current date plus 10 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I enter Automation Course Name in courseNameInput textfield
      And I enter Auto101 in courseNumberInput textfield
      And I enter 1.01 in amountInput textfield
      And I enter 1 in creditHoursInput textfield
      And I select Unknown from the instructionTypeDropdown
      When I click the taxAcknowledgement element
      And I click the addCourseButton element
      And I wait until the addCourseButton is not visible
    Then The addExpenseButton element is enabled
    When I click the addExpenseButton element
      And I wait until the addExpenseButton is not visible
    Then The otherExpenseType is visible
      And I scroll to otherExpenseType element
    When I select Administrative Fee from the otherExpenseType
      And I enter -5.55 in expenseAmount textfield
      And I click TAB key in saveExpenseButton textfield
      And The saveExpenseButton element is disabled
      And I click the taxAcknowledgement element
      And The saveExpenseButton element is enabled
    Then The exact text in expenseAmount field should be 5.55
    When I click the saveExpenseButton element
    Then The removeFirstOtherExpenseButton is visible
      And The editFirstOtherExpenseButton is visible
    When I click the addExpenseButton element
    Then The otherExpenseType is visible
    When I select Registration Fee from the otherExpenseType
      And I enter 3ABC in expenseAmount textfield
      And I click the taxAcknowledgement element
    Then The exact text in expenseAmount field should be 3.00
    When I click the saveExpenseButton element
    Then The removeSecondOtherExpenseButton is visible
      And The editSecondOtherExpenseButton is visible
    When I click the addExpenseButton element
    Then The otherExpenseType is visible
    When I select Non-Course Related Fee from the otherExpenseType
      And I enter #1000.07 in expenseAmount textfield
      And I click the taxAcknowledgement element
      And I click the saveExpenseButton element
    Then The editThirdOtherExpenseButton is visible
      And The removeThirdOtherExpenseButton is visible
    When I click the addExpenseButton element
    Then The otherExpenseType is visible
    When I select Non-Course Related Fee from the otherExpenseType
      And I click the taxAcknowledgement element
      And The saveExpenseButton element is disabled
      And I enter 8.97 in expenseAmount textfield
      And The saveExpenseButton element is enabled
      And I click the cancelExpenseButton element
    Then The editThirdOtherExpenseButton is visible
      And The removeThirdOtherExpenseButton is visible
      And I should see Administrative Fee text in firstCourseExpenseDescription field
      And I should see $5.55 text in one of the totalRequestedAmt fields
      And I should see Registration Fee text in secondCourseExpenseDescription field
      And I should see $3.00 text in one of the totalRequestedAmt fields
      And I should see Non-Course Related Fee text in thirdCourseExpenseDescription field
      And I should see $1,000.07 text in one of the totalRequestedAmt fields
      And I verify $8.97 text is not displayed
    When I scroll to editSecondOtherExpenseButton element
      And I click the editSecondOtherExpenseButton element
      And I clear the expenseAmount field
      And I enter 1.23 in expenseAmount textfield
      And I click the taxAcknowledgement element
      And I click the saveExpenseButton element
    Then The editSecondOtherExpenseButton is visible
    When I scroll to removeThirdOtherExpenseButton element
      And I click the removeThirdOtherExpenseButton element
    Then The editFirstOtherExpenseButton is visible
      And The removeFirstOtherExpenseButton is visible
      And The editSecondOtherExpenseButton is visible
      And The removeSecondOtherExpenseButton is visible
      And I wait until the removeThirdOtherExpenseButton is not visible
      And I should see Administrative Fee text in firstCourseExpenseDescription field
      And I should see $5.55 text in one of the totalRequestedAmt fields
      And I should see Registration Fee text in secondCourseExpenseDescription field
      And I should see $1.23 text in one of the totalRequestedAmt fields
      And I verify Non-Course Related Fee text is not displayed
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I click the agreement1Label element
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The submitApplicationButton element is enabled
      And I should see Administrative Fee text in firstCourseExpenseDescription field
      And I should see $5.55 text in firstNonCourseExpenseRequestedAmt field
      And I should see Registration Fee text in secondCourseExpenseDescription field
      And I should see $1.23 text in secondNonCourseExpenseRequestedAmt field
    When I click the coursesAndExpensesEditButton element
    Then I should be on the Courses page
      And The continueButton element is enabled
      And I should see Administrative Fee text in firstCourseExpenseDescription field
      And I should see $5.55 text in one of the expenseRequestedAmt fields
      And I should see Registration Fee text in secondCourseExpenseDescription field
      And I should see $1.23 text in one of the expenseRequestedAmt fields
    When I scroll to editSecondOtherExpenseButton element
      And I click the editSecondOtherExpenseButton element
      And I clear the expenseAmount field
      And I enter 9.99 in expenseAmount textfield
      And I click the taxAcknowledgement element
      And I click the saveExpenseButton element
    Then The editSecondOtherExpenseButton is visible
      And The addExpenseButton element is enabled
    When I scroll to removeFirstOtherExpenseButton element
      And I click the removeFirstOtherExpenseButton element
    Then The cancelButton element is enabled
      And The editFirstOtherExpenseButton is visible
      And I scroll to firstCourseExpenseDescription element
      And I wait until the removeSecondOtherExpenseButton is not visible
      And I should see $9.99 text in one of the totalRequestedAmt fields
      And I should see Registration Fee text in firstCourseExpenseDescription field
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112495     |

  @RegressionTest
  Scenario Outline: TU5 Other Reimbursement Application Creation payment preference = yes (C57652) scenario 1
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When The NewApplicationButton in the Header component is visible
      And The actionNeededSection is visible
      And I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Home Address text from the addressRadioGroup group
      And I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The educationProgramDropdown element is enabled
    When I select Associate's Degree from the educationProgramDropdown
    Then The FieldOfStudyDropdown element is enabled
    When I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
    Then I click the educationProviderEditButton element
      And The providerName element is enabled
    When I enter Boston University in providerName textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
      And I wait until the providerSearchResultsTable is not visible
    Then I should be on the EducationInformation page
      And The continueButton element is enabled
    When I click the continueButton element
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
      | amountInput       | 125           |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
      And I wait until the addCourseButton is not visible
    Then I scroll to continueButton element
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
    When The paymentPreferenceCheckLabel element is enabled
    Then I click the paymentPreferenceCheckLabel element
      And I click the paymentPreferenceSave element
    When I click the submitApplicationButton element
      And I wait until the submitApplicationButton is not visible
    Then I should be on the Submission page
      And The submissionIdLink element is enabled
    When I click on submissionIdLink using jsExecutor
      And I capture the current application ID from the url
      And I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <supervisor> username and <supervisorPw> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The approveApplicationButton element is enabled
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I click the approveApplicationWithCommentsButton element
      And I wait until the approveApplicationWithCommentsButton is not visible
    Then I should be on the Application page
      And I capture the current application ID from the url
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
    Then The submittedAppAddOtherExpenseBtn is visible
    When I click the submittedAppAddOtherExpenseBtn element
      And I wait until the submittedAppAddOtherExpenseBtn is not visible
      And the paymentPreferenceCheck is selected
    Then I click the paymentPreferenceEDepositLabel element
    When I click the paymentPreferenceLinkContactInfo element
    Then The paymentPreferenceLinkContactInfo element is disabled
    When I fillout specified text fields with the following text
      #| Element                    | Text to enter |
      | paymentPreferencePhoneInput | 6178675309    |
      And I click the paymentPreferenceLinkContactInfo element
    Then The agreementCheckbox element is enabled
    When I click on agreementCheckbox using jsExecutor
      And I click on paymentPreferenceAcceptTerms using jsExecutor
    Then The accountLinked is visible
    When The addCourseRelatedExpenseButton element is enabled
    Then I click the addCourseRelatedExpenseButton element
    When The relatedCourseDropdown element is enabled
    Then I select Intro to Math from the relatedCourseDropdown
      And I fillout specified text fields with the following text
      #| Element               |  Text to enter |
      | numberOfBooks          |  2             |
      | expenseRequestedAmount |  62.08         |
    When I click the saveEditCourseRelatedExpenseButton element
      And I wait until the saveEditCourseRelatedExpenseButton is not visible
    Then I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test1 in signatureInput textfield
      And The approveApplicationButton element is enabled
    When I click the approveApplicationButton element
    Then I should be on the Submission page
    When I navigate to Profile web page
    Then I should be on the Profile page
      And The paymentPreferenceEDeposit is visible
      And the paymentPreferenceEDeposit is selected
    When I navigate to the current application summary page
    Then I should be on the application page
    When I refresh the page
    Then The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
      And I click the cancelApplicationButton element
      And I enter cancel application in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client  | username | password | supervisor | supervisorPw | testCaseId |
      | tu5demo | atest1   | Welcome1 | atest2     | Welcome1     | 112499     |

  @RegressionTest
  Scenario Outline: TU5 Other Reimbursement Application Creation payment preference = yes (C108623) scenario 2
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When The NewApplicationButton in the Header component is visible
      And I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
    When I select the radio dial with Use Home Address text from the addressRadioGroup group
      And I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Associate's Degree from the educationProgramDropdown
    Then The FieldOfStudyDropdown element is enabled
    When I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the educationProviderEditButton element
      And The providerName is visible
    Then I enter Boston University in providerName textfield
    When I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
      And I wait until the providerSearchResultsTable is not visible
    Then I should be on the EducationInformation page
    When I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 15 days in sessionStartDateInput
    Then The exact text in sessionInformationHeaderText should be Session Information
    When I enter current date plus 60 days in sessionEndDateInput
    Then The sessionEndDateInput is visible
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 125           |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
      And I wait until the addCourseButton is not visible
      And I scroll to continueButton element
      And The continueButton element is enabled
      And I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test6 in signatureInput textfield
      And The continueButton element is enabled
      And I click the continueButton element
    Then I should be on the Application page
      And The submitApplicationButton element is enabled
    When I click the paymentPreferenceCheckLabel element
      And I click the paymentPreferenceSave element
      And I refresh the page
      And The paymentPreferenceEDepositLabel element is enabled
      And I click the paymentPreferenceEDepositLabel element
    Then The registerWithZelleBtn element is enabled
    When I click the paymentPreferenceLinkContactInfo element
    When I fillout specified text fields with the following text
      #| Element                    | Text to enter |
      | paymentPreferencePhoneInput | 6178675309    |
      And I click the paymentPreferenceLinkContactInfo element
      And I click the agreementCheckbox element
      And The paymentPreferenceAcceptTerms element is enabled
      And I click the paymentPreferenceAcceptTerms element
    Then The accountLinked is visible
      And The programsHeaderText is visible
    When I click the submitApplicationButton element
      And I wait until the submitApplicationButton is not visible
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
      And I wait until the submissionIdLink is not visible
    Then I should be on the Application page
    When I capture the current application ID from the url
      And I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <supervisor> username and <supervisorPw> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The approveApplicationButton element is enabled
    When I click the approveApplicationButton element
      And I wait until the approveApplicationButton is not visible
    Then The approveApplicationCommentTextInput is visible
    When I click the approveApplicationWithCommentsButton element
    Then I should be on the Application page
      And I capture the current application ID from the url
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatus is visible
    When The submittedApplicationActionMenuButton element is enabled
    Then I click the submittedApplicationActionMenuButton element
      And The submittedAppAddOtherExpenseBtn element is enabled
    When I click the submittedAppAddOtherExpenseBtn element
      And I wait until the submittedAppAddOtherExpenseBtn is not visible
    Then I click the following elements
      #| Element ID to click         |
      | paymentPreferenceCheckLabel  |
    When I click the paymentPreferenceSave element
    When I click the addCourseRelatedExpenseButton element
      And I wait until the addCourseRelatedExpenseButton is not visible
      And The relatedCourseButton element is enabled
    Then I select Intro to Math from the relatedCourseDropdown
      And I fillout specified text fields with the following text
      #| Element               |  Text to enter |
      | numberOfBooks          |  2             |
      | expenseRequestedAmount |  62.08         |
    When The saveEditCourseRelatedExpenseButton element is enabled
    Then I click the saveEditCourseRelatedExpenseButton element
      And I wait until the saveEditCourseRelatedExpenseButton is not visible
      And I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test6 in signatureInput textfield
    When The approveApplicationButton element is enabled
    Then I click the approveApplicationButton element
    When I wait until the approveApplicationButton is not visible
    Then I should be on the Submission page
    When I navigate to Profile web page
    Then I should be on the Profile page
      And the paymentPreferenceCheck is selected
    When I navigate to the current application summary page
    Then I should be on the application page
    When I refresh the page
    Then The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
    Then The cancelApplicationButton element is enabled
    When I click the cancelApplicationButton element
      And I enter cancel application in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client  | username | password | supervisor | supervisorPw | testCaseId |
      | tu5demo | atest6   | Welcome1 | atest2     | Welcome1     | 112503     |
