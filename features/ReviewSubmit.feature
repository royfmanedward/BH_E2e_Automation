Feature: Review/Submit (Tuition Step 5)

  @RegressionTest
  Scenario Outline: TU5 Edit Contact, Programs, Course & Expenses and Agreements for Review and Submit page (C1979)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Work Address text from the addressRadioGroup group
      And I select the radio dial with Use Work Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click on continueButton using jsExecutor
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 5             |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
    When I click on continueButton using jsExecutor
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test1 in signatureInput textfield
      And I click on continueButton using jsExecutor
    Then I should be on the Application page
      And I verify the text below is present on the page
      #| Element                        | Text to verify                |
      | phoneText                       | 8006492568                    |
      | emailText                       | tamssupport@edassist.com      |
      | employeeProgramText             | Tuition Reimbursement Program |
      | educationProgramText            | Bachelor's Degree             |
      | specialityText                  | Accounting                    |
      | providerNameText                | Boston University             |
      | providerCodeText                | T22768                        |
      | requestedText                   | $5.00                         |
      | totalBenefitText                | $5.00                         |
      | grantsScholarshipsDiscountsText | None $0.00                    |
      #Contact Information - Edit
      And The contactInformationEditButton is visible
    When I click the contactInformationEditButton element
    Then I should be on the ContactInformation page
      #Edit phone on (step#1-contact Information)
      And The firstRadioButton element is enabled
      And The radio dial with Use Work Phone text from the phoneRadioGroup group is selected
    When I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
    When I check Tuition Reimbursement Program radio dial from the programsRadioGroup
    Then The continueButton element is enabled
    When I click on continueButton using jsExecutor
    Then I should be on the Courses page
      And The continueButton element is enabled
    When I click on continueButton using jsExecutor
    Then I should be on the Agreement page
    When I click on eligibleGrantsNoRadioLabel using jsExecutor
      And I click on agreement1Label using jsExecutor
      And I enter Auto Test1 in signatureInput textfield
      And I click on continueButton using jsExecutor
    Then I should be on the Application page
    #Verify phone edited in (step#1-contact Information)
      And I verify the text below is present on the page
      #| Element                        | Text to verify                |
      | phoneText                       | 6178675309                    |
      | emailText                       | tamssupport@edassist.com      |
      | employeeProgramText             | Tuition Reimbursement Program |
      | educationProgramText            | Bachelor's Degree             |
      | specialityText                  | Accounting                    |
      | providerNameText                | Boston University             |
      | providerCodeText                | T22768                        |
      | requestedText                   | $5.00                         |
      | totalBenefitText                | $5.00                         |
      | grantsScholarshipsDiscountsText | None $0.00                    |
    #Programs - Edit
    When I click the programseEditButton element
    Then I should be on the EducationInformation page
      And The educationProgramDropdown is visible
    #Edit Education program and FOS on (Step#2-Programs)
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select Administrative Support from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
    Then I should be on the EducationInformation page
      And The continueButton element is enabled
    When I click on continueButton using jsExecutor
    Then I should be on the Courses page
    When I click on continueButton using jsExecutor
    Then I should be on the Agreement page
    When I click the following elements
      #| Element to click          |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test1 in signatureInput textfield
    Then The continueButton is visible
    When I click on continueButton using jsExecutor
    Then I should be on the Application page
    #Verify Education program and FOS edited in (Step#2-Programs)
      And I verify the text below is present on the page
      #| Element                        | Text to verify                |
      | phoneText                       | 6178675309                    |
      | emailText                       | tamssupport@edassist.com      |
      | employeeProgramText             | Tuition Reimbursement Program |
      | educationProgramText            | Bachelor's Degree             |
      | specialityText                  | Administrative Support        |
      | providerNameText                | Boston University             |
      | providerCodeText                | T22768                        |
      | requestedText                   | $5.00                         |
      | totalBenefitText                | $5.00                         |
      | grantsScholarshipsDiscountsText | None $0.00                    |
    # Course And Expenses - Edit
    When I click the coursesAndExpensesEditButton element
    Then I should be on the Courses page
      #Edit Courses and Expenses on (Step#3-Expenses)
    When I click the editFirstCourseButton element
      And I enter 0 in amountInput textfield
    Then The taxAcknowledgement is visible
    When I click on taxAcknowledgement using jsExecutor
      And I click the addCourseButton element
      And I wait until the addCourseButton is not visible
    Then The continueButton is visible
    When I click on continueButton using jsExecutor
    Then I should be on the Agreement page
    When I click the following elements
      #| Element to click          |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test1 in signatureInput textfield
      And I click on continueButton using jsExecutor
    Then I should be on the Application page
    #Verify Course date  edited in (Step#3-Expenses)
      And I verify the text below is present on the page
      #| Element                        | Text to verify                |
      | phoneText                       | 6178675309                    |
      | emailText                       | tamssupport@edassist.com      |
      | employeeProgramText             | Tuition Reimbursement Program |
      | educationProgramText            | Bachelor's Degree             |
      | specialityText                  | Administrative Support        |
      | providerNameText                | Boston University             |
      | providerCodeText                | T22768                        |
      | requestedText                   | $50.00                        |
      | totalBenefitText                | $50.00                        |
      | grantsScholarshipsDiscountsText | None $0.00                    |
    # Agreements - Edit
    When I click on agreementsEditButton using jsExecutor
    Then I should be on the Agreement page
    #Edit Agreement data on (Step#4-Agreement)
    When I click the eligibleGrantsYesRadioLabel element
      And I select Discount from the financialAidDropdown
      And I enter 15 in financialAidAmountInput textfield
      And I click the agreement1Label element
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      #Verify  Agreement data on (Step#4-Agreement)
    When I verify the text below is present on the page
      #| Element                        | Text to verify                |
      | phoneText                       | 6178675309                    |
      | emailText                       | tamssupport@edassist.com      |
      | employeeProgramText             | Tuition Reimbursement Program |
      | educationProgramText            | Bachelor's Degree             |
      | specialityText                  | Administrative Support        |
      | providerNameText                | Boston University             |
      | providerCodeText                | T22768                        |
      | requestedText                   | $50.00                        |
      | totalBenefitText                | $50.00                        |
      | grantsScholarshipsDiscountsText | Discount $15.00               |
      And I click the submitApplicationButton element
    Then I should be on the Submission page
      And The returnToHomePageButton is visible
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The submittedApplicationActionMenuButton is visible
    When I click the submittedApplicationActionMenuButton element
      And I click the cancelApplicationButton element
      And I enter Test comment in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112297     |

  @RegressionTest
  Scenario Outline: TU5 Verify Virtual Card App Step5 does not display Payment Preference (C67022)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
      And I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Virtual Card radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 5 days in sessionStartDateInput
      And I enter current date plus 10 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 5             |
      | creditHoursInput  | 1             |
      And I select Online from the instructionTypeDropdown
      And I click the taxAcknowledgement element
      And I click the addCourseButton element
    Then I should be on the Courses page
      And The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
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
      And The paymentPreferenceHeader is not visible
      And The paymentPreferenceQuestion is not visible
      And The paymentPreferenceCheckLabel is not visible
      And The paymentPreferenceEDepositLabel is not visible
    When I click the cancelButton element
      And I click the deleteApplicationButton in the SaveAppForLaterOrDelete component
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112327     |

  @RegressionTest
  Scenario Outline: Verify Payment Preference can be changed during Application Creation Step5 (C57651)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Profile web page
    Then I should be on the Profile page
    When I scroll to paymentPreference element
      And I click the paymentPreferenceCheckLabel element
      And I click the paymentPreferenceSave element
    Then I should be on the profile page
    When I Update the tuition API request
      #| Attribute                        | Value                         |
      | Program                           | Tuition Reimbursement Program |
      | Session Start Date from Today     | 1                             |
      | Session End Date from Today       | 60                            |
    Then I create tuition application until AgreementsInformationStep using API
    When I navigate to REVIEW AND SUBMIT web page
    Then I should be on the Application page
    #Scenario1: Changing from Check to ElectronicDeposit - On Step5
      And The paymentPreferenceQuestion is visible
      And the paymentPreferenceCheck is selected
    When I click the paymentPreferenceEDepositLabel element
      And I click the registerWithZelleBtn element
      And I click the continueToWebsiteButton element
      And I wait until the continueToWebsiteButton is not visible
      And I change focus to tab 1
      And I change focus to tab 0
      And I click the paymentPreferenceMobileLabel element
    Then The paymentPreferenceLinkContactInfo element is disabled
    When I enter 6172223333 in paymentPreferencePhoneInput textfield
      And I click the paymentPreferenceLinkContactInfo element
    Then The overlayTitle is visible
      And The paymentPreferenceAcceptTerms element is disabled
    When I click the termsConditionsCheckbox element
      And I click the paymentPreferenceAcceptTerms element
      And I wait until the overlayTitle is not visible
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I navigate to Profile web page
    Then I should be on the Profile page
    When I scroll to paymentPreference element
    Then the paymentPreferenceEDeposit is selected
    When I navigate to the current application summary page
    Then I should be on the Application page
    When I cancel an application from the Application Page Actions menu
    Then I should be on the Home page
    #Scenario2: Changing from ElectronicDeposit to Check - On Step5
    Then I create tuition application until AgreementsInformationStep using API
    When I navigate to REVIEW AND SUBMIT web page
    Then I should be on the Application page
      And the paymentPreferenceEDeposit is selected
      And The exact text in paymentPreferencePhoneInput field should be (617) 222-3333
      And The paymentPreferenceCheck is visible
    When I click the paymentPreferenceCheckLabel element
      And I click the paymentPreferenceSave element
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I navigate to Profile web page
    Then I should be on the Profile page
    When I scroll to paymentPreference element
    Then the paymentPreferenceCheck is selected
    When I navigate to the current application summary page
    Then I should be on the Application page
    When I cancel an application from the Application Page Actions menu
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112328     |

  @RegressionTest
  Scenario Outline: Verify Payment Preference can be changed on Profile page and is displayed accordingly on App Step5 page (C57596)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Profile web page
    Then I should be on the Profile page
    #Scenario1: Changing from Check to ElectronicDeposit to Check - On Profile
    When I scroll to paymentPreference element
    Then the paymentPreferenceCheck is selected
    When I click the paymentPreferenceEDepositLabel element
      And I click the paymentPreferenceMobileLabel element
      And I enter 2031112222 in paymentPreferencePhoneInput textfield
      And I click on paymentPreferenceLinkContactInfo using jsExecutor
    Then The overlayTitle is visible
      And The paymentPreferenceAcceptTerms element is disabled
    When I click the paymentPreferenceZeleTerms element
      And I click the paymentPreferenceAcceptTerms element
      And I wait until the overlayTitle is not visible
    Then I should be on the profile page
    When I Update the tuition API request
      #| Attribute                        | Value                         |
      | Program                           | Tuition Reimbursement Program |
      | Session Start Date from Today     | 0                             |
      | Session End Date from Today       | 30                            |
    Then I create tuition application until AgreementsInformationStep using API
    When I navigate to REVIEW AND SUBMIT web page
    Then I should be on the Application page
      And The paymentPreferenceQuestion is visible
      And the paymentPreferenceEDeposit is selected
      And The exact text in paymentPreferencePhoneInput field should be (203) 111-2222
    When I click the cancelButton element
      And I click the deleteApplicationButton in the SaveAppForLaterOrDelete component
    Then I should be on the Home page
    #Scenario2: Changing from ElectronicDeposit to Check - On Profile
    When I navigate to Profile web page
    Then I should be on the Profile page
    When I scroll to paymentPreference element
    Then the paymentPreferenceEDeposit is selected
    When I click the paymentPreferenceCheckLabel element
      And I click the paymentPreferenceSave element
      And I create tuition application until AgreementsInformationStep using API
      And I navigate to REVIEW AND SUBMIT web page
    Then I should be on the Application page
      And the paymentPreferenceCheck is selected
    When I click the cancelButton element
      And I click the deleteApplicationButton in the SaveAppForLaterOrDelete component
    Then I should be on the Home page
    When I navigate to Profile web page
    Then I should be on the Profile page
    When I scroll to paymentPreference element
    Then the paymentPreferenceCheck is selected
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112329     |

  @RegressionTest
  Scenario Outline: Step 5: Verify that comments and uploads do not display before application submission when disabled (C58028)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And The tuitionProgramManagement element is enabled
      And I click tuitionProgramManagement to go to home page
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
    When I select Master's Degree from the educationProgramDropdown
      And I select Business Administration from the fieldOfStudyDropdown
      And I check Graduate Degree Program radio dial from the programsRadioGroup
      And I click the educationProviderEditButton element
    Then The providerName is visible
      And The providerSearchButton is visible
    When I enter Walden University in providerName textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
    Then I should be on the EducationInformation page
    When I click the providerReviewCheckbox element
      And I click the continueButton element
    Then I should be on the Courses page
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
    Then The exact text in graduationQuestionText should be Are you graduating or completing your education program with this session?
      And The graduationDateInput is not visible
      And the degreeCompleteYesButton is not selected
      And the degreeCompleteNoButton is not selected
    When I click the continueButton element
    Then The degreeCompleteNoRadio element is enabled
    When I click on degreeCompleteNoRadio using jsExecutor
    Then The expectedGraduationDateInput element is present
      And The expectedGradDateValidationText element is present
      And The degreeCompleteYesRadio element is enabled
    When I click the degreeCompleteYesRadio element
    Then The graduationDateInput element is present
      And The actualGradDateValidationText element is present
    When I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #|  Element         | Text to enter  |
      | courseNameInput   | BusinessAdmin1 |
      | courseNumberInput | 010            |
      | amountInput       | 5              |
      | creditHoursInput  | 1              |
      And I select Classroom from the instructionTypeDropdown
      And I fillout specified text fields with the following text
      #| Element         | Text to enter    |
      | courseWebAddress | www.edassist.com |
      And I click the courseScheduleDay0 element
      And I click the following elements
      #| Element                |
      | courseStartTime0        |
      | courseStartTime0Option0 |
      | courseEndTime0          |
      | courseEndTime0Option1   |
      And I click the addCourseButton element
    Then The editFirstCourseButton is visible
      And The removeFirstCourseButton is visible
    When I scroll to continueButton element
      And I wait until the addCourseVeil is not visible
      And I click the continueButton element
      And I click the degreeCompleteNoRadio element
    Then The exact text in expectedGradDateLabel should be Expected Graduation Date
    When I click the degreeCompleteYesRadio element
    Then The exact text in actualGradDateLabel should be Graduation Date
      And The graduationDateInput element is enabled
    When I enter 11/22/2019 in graduationDateInput textfield
    Then The exact text in graduationDateInput field should be 11/22/2019
    When I click on graduationDateInput using jsExecutor
      And I click on calendarClearBtn using jsExecutor
    Then Text in graduationDateInput field is not present
    When I enter 11/22/2050 in graduationDateInput textfield
      And I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to Click      |
      |eligibleGrantsNoRadioLabel |
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The graduationDate element is enabled
      And The exact text in graduationDate should be Nov 22, 2050
      And The commentsHeaderText is not visible
      And The supportingDocumentationHeaderText is not visible
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
    When I click the submittedApplicationActionMenuButton element
      And I click the cancelApplicationButton element
      And I enter cancel application in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 112330     |

  @RegressionTest
  Scenario Outline: TU5 Verify application comments before submission when optional (C58029)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                         |
      | Program                           | Tuition Reimbursement Program |
      | Session Start Date from Today     | 1                             |
      | Session End Date from Today       | 60                            |
      | Comments                          | True                          |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The commentsHeaderText is visible
      And I scroll to commentsHeaderText element
    Then The exact text in commentsEntered should be Testing comments section
    When I scroll to submittedApplicationActionMenuButton element
      And I click the submittedApplicationActionMenuButton element
      And I click the cancelApplicationButton element
      And I enter cancel application in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112331     |

  @RegressionTest
  Scenario Outline: TU5 Verify Submitted Incomplete Application Cancel/Edit Button (C1899)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I click the NewApplicationButton in the Header component
      And The NewApplicationButton in the Header component is visible
    Then I should be on the ContactInformation page
      And The continueButton is visible
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click on continueButton using jsExecutor
    Then I should be on the Courses page
    When I enter current date plus 100 days in sessionStartDateInput
      And I enter current date plus 110 days in sessionEndDateInput
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
    When I click on continueButton using jsExecutor
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test1 in signatureInput textfield
      And I click on continueButton using jsExecutor
    Then I should be on the Application page
    When The submitApplicationButton is visible
      And I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click the homeNav in the Header component
    Then I should be on the Home page
      And The actionNeededSection is visible
      And The completeAppButton is visible
    When I click the completeAppButton element
    Then I should be on the Application page
      And The cancelButton is visible
    When I click the cancelButton element
    Then I should be on the Home page
      And The actionNeededSection is visible
      And The completeAppButton is visible
    When I click the completeAppButton element
    Then I should be on the Application page
      And The contactInformationEditButton is visible
      And I scroll to contactInformationEditButton element
    When I click the contactInformationEditButton element
    Then I should be on the ContactInformation page
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The educationProgramDropdown is visible
    When I select Associate's Degree from the educationProgramDropdown
      And I select Other from the FieldOfStudyDropdown
      And I enter pending in otherCourseOfStudyInput textfield
      And I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click on continueButton using jsExecutor
    Then I should be on the Courses page
    When I clear the sessionStartDateInput field
      And I clear the sessionEndDateInput field
      And I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click on continueButton using jsExecutor
    Then I should be on the Agreement page
    When I click on eligibleGrantsNoRadioLabel using jsExecutor
      And I click on agreement1Label using jsExecutor
      And I enter Auto Test1 in signatureInput textfield
      And I click on continueButton using jsExecutor
    Then I should be on the Application page
      And The submitApplicationButton is visible
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
    When The applicationStatus is visible
    Then The exact text in applicationStatus should be SUBMITTED — PENDING REVIEW
    When I click the submittedApplicationActionMenuButton element
      And I click the cancelApplicationButton element
    Then The cancelApplicationConfirmationInput is visible
    When I enter CancelApp in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112332     |

  @RegressionTest
  Scenario Outline: TU5 Enable Application Comments Before Submission = Required (C58030)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I click the NewApplicationButton in the Header component
      And The NewApplicationButton in the Header component is visible
    Then I should be on the ContactInformation page
      And The continueButton is visible
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
    When I select Associate's Degree from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Virtual Card radio dial from the programsRadioGroup
      And I click on continueButton using jsExecutor
    Then I should be on the Courses page
    When I enter current date plus 5 days in sessionStartDateInput
      And I enter current date plus 10 days in sessionEndDateInput
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
    When I click on continueButton using jsExecutor
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test1 in signatureInput textfield
      And I click on continueButton using jsExecutor
    Then I should be on the Application page
    When The submitApplicationButton is visible
      And I click the submitApplicationButton element
    Then I should be on the Application page
      And I should see This field is required text in commentValidationText field
      And I enter Test comment in summaryCommentInput textfield
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The submittedApplicationActionMenuButton is visible
    When I click the submittedApplicationActionMenuButton element
      And I click the cancelApplicationButton element
      And I enter Test comment in cancelApplicationConfirmationInput textfield
      And I click the cancelApplicationConfirmationYes element
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 124322     |

  @RegressionTest
  Scenario Outline: TU5 Step 5: Enable Application Comments Before Submission = Optional Purpose Statement (C120878)
    Given I set the <testCaseId>
    When I'm on the <client> site
      And I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                         |
      | Program                           | Direct Bill Program           |
      | Session Start Date from Today     | 0                             |
      | Session End Date from Today       | 0                             |
    Then I create tuition application until AgreementsInformationStep using API
    When I navigate to REVIEW AND SUBMIT web page
    Then I should be on the Application page
      And The purposeHeaderText element is present
      And I should see Purpose text in purposeHeaderText field
    When I enter Adding text to verify 1000 character limit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit, eros at congue tempor, odio dui placerat dolor, ut pellentesque felis enim lobortis risus. Pellentesque iaculis faucibus metus, in sagittis lacus pharetra non. Phasellus ipsum ex, pellentesque quis vulputate ac, mattis ut felis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed imperdiet lacinia vestibulum. Nulla nec orci at massa posuere placerat id ac mi. Aenean facilisis mi eu urna tempor, elementum sollicitudin sapien mattis. Maecenas iaculis erat quis neque suscipit, a convallis neque fermentum. Ut vulputate nisi in elit ornare, at egestas erat volutpat. Ut posuere eleifend elit sed tempor. Donec blandit tellus magna, quis rhoncus lacus faucibus sit amet. Suspendisse potenti. Sed imperdiet, felis quis euismod eleifend, justo enim tempus dui, vel tincidunt felis ligula ut ipsum. Vestibulum at efficitur justo. Orci varius nato in applicationConfirmationCommentInput textfield
    Then The exact text in applicationConfirmationCommentInput field should be Adding text to verify 1000 character limit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit, eros at congue tempor, odio dui placerat dolor, ut pellentesque felis enim lobortis risus. Pellentesque iaculis faucibus metus, in sagittis lacus pharetra non. Phasellus ipsum ex, pellentesque quis vulputate ac, mattis ut felis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed imperdiet lacinia vestibulum. Nulla nec orci at massa posuere placerat id ac mi. Aenean facilisis mi eu urna tempor, elementum sollicitudin sapien mattis. Maecenas iaculis erat quis neque suscipit, a convallis neque fermentum. Ut vulputate nisi in elit ornare, at egestas erat volutpat. Ut posuere eleifend elit sed tempor. Donec blandit tellus magna, quis rhoncus lacus faucibus sit amet. Suspendisse potenti. Sed imperdiet, felis quis euismod eleifend, justo enim tempus dui, vel tincidunt felis ligula ut ipsum. Vestibulum at efficitur justo. Orci varius nat
      And The submitApplicationButton is visible
    When I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
    When I click the coursesAndExpensesEditButton element
    Then I should be on the Courses page
    When I clear the sessionStartDateInput field
      And I clear the sessionEndDateInput field
      And I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test1 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And The exact text in applicationConfirmationCommentInput field should be Adding text to verify 1000 character limit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit, eros at congue tempor, odio dui placerat dolor, ut pellentesque felis enim lobortis risus. Pellentesque iaculis faucibus metus, in sagittis lacus pharetra non. Phasellus ipsum ex, pellentesque quis vulputate ac, mattis ut felis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed imperdiet lacinia vestibulum. Nulla nec orci at massa posuere placerat id ac mi. Aenean facilisis mi eu urna tempor, elementum sollicitudin sapien mattis. Maecenas iaculis erat quis neque suscipit, a convallis neque fermentum. Ut vulputate nisi in elit ornare, at egestas erat volutpat. Ut posuere eleifend elit sed tempor. Donec blandit tellus magna, quis rhoncus lacus faucibus sit amet. Suspendisse potenti. Sed imperdiet, felis quis euismod eleifend, justo enim tempus dui, vel tincidunt felis ligula ut ipsum. Vestibulum at efficitur justo. Orci varius nat
    When I clear the applicationConfirmationCommentInput field
      And I enter line1Text in applicationConfirmationCommentInput textfield
      And I click RETURN key in applicationConfirmationCommentInput textfield
      And I enter line2Text in applicationConfirmationCommentInput textfield
      And I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
      And The purposeComment should contain 2 lines of following text
      #| Text to be validated  |
      | line1Text              |
      | line2Text              |
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 124328     |
