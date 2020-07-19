Feature: Programs (Tuition Step 2)

  @RegressionTest
  Scenario Outline: TU5 Step 2: Verify Program Selection Modal, Student ID, Student Modal (C52495)
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
    Then The programsRadioGroup element is enabled
    When I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click on tuitionReimbursementProgramButton using jsExecutor
    Then The ProgramModalOkButton element is enabled
      And Text in ProgramModalText field is present
      And I should see Frequently Asked Questions text in one of the ProgramModalDownloadLinks fields
      And I should see Tuition Reimbursement Policy text in one of the ProgramModalDownloadLinks fields
      And I should see Sample Grade and Receipt Documentation text in one of the ProgramModalDownloadLinks fields
      And I should see Manager Approval Guide text in one of the ProgramModalDownloadLinks fields
    When I click the ProgramModalOkButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I clear the studentIDInput field
      And I enter 01234567 in studentIDInput textfield
    Then The exact text in studentIDInput field should be 01234567
    When I click the studentIDButton element
    Then The modalTitleText is visible
      And I scroll to ProgramModalXclose element
    When I click the ProgramModalXclose element
      And I click the cancelButton element
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client    | username  | password | testCaseId |
      | tu5demo   | atest1    | Welcome1 | 112333     |

  @RegressionTest
  Scenario Outline: TU5 Step 2: Verify Education Program, Field of Study and Other Course of Study (C1943)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
      And I scroll to continueButton element
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
      And I select Bachelor's Degree from the educationProgramDropdown
      And I select Other from the FieldOfStudyDropdown
    Then I clear the otherCourseOfStudyInput field
    When I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the continueButton element
    Then I should see Required fields are missing text in stepTwoErrorMessage field
      And I enter Space Exploration in otherCourseOfStudyInput textfield
      And I click the continueButton element
    Then I should be on the Courses page
      And The sessionStartDateInput element is enabled
    When I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
    Then I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter |
      | courseNameInput   | Intro to Math |
      | courseNumberInput | math101       |
      | amountInput       | 125           |
      | creditHoursInput  | 1             |
      And I select Classroom from the instructionTypeDropdown
      And I click the taxAcknowledgement element
    When I click the addCourseButton element
    Then I wait until the addCourseButton is not visible
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the following elements
      #| Element ID to click       |
      | eligibleGrantsNoRadioLabel |
      | agreement1Label            |
      And I enter Auto Test1 in signatureInput textfield
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Application page
      And The specialityText is visible
      And I verify the text below is present on the page
      #| Element       | Text to verify    |
      | specialityText | Other             |
      | otherFOS       | Space Exploration |
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client   | username  | password | testCaseId |
      | tu5demo  | atest1    | Welcome1 | 112334     |

  @RegressionTest
  Scenario Outline: TU5 Step 2: Search and select Education Provider by Accreditation only (C55920)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the educationProviderEditButton element
    Then The providerAccreditationDropdown element is enabled
      And I select NEASC from the providerAccreditationDropdown
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
      And I wait until the providerSearchResultsTable is not visible
    Then I click the cancelButton element
      And I should be on the Home page
      And I report test passing test status
    Examples:
      | client   | username  | password | testCaseId |
      | tu5demo  | atest1    | Welcome1 | 112335     |

  @RegressionTest
  Scenario Outline: TU5 Step 2: Search and select Education Provider with Multiple fields (C55921)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And The continueButton is visible
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the educationProviderEditButton element
    Then The searchProviderNameInput is visible
    When I click the providerNetworkSchoolLabel element
    Then The searchProviderNameInput is visible
    When I enter APT College in searchProviderNameInput textfield
      And I enter Carlsbad in providerCityInput textfield
      And I select CA from the providerStateDropdown
      And The providerNetworkSchoolLabel element is enabled
      And I click the providerNetworkSchoolLabel element
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
      And I wait until the providerSearchResultsTable is not visible
      And The educationProviderEditButton element is enabled
      And The providerName is visible
    Then The exact text in providerName field should be APT College
      And I should be on the EducationInformation page
    When I click the cancelButton element
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client   | username  | password | testCaseId |
      | tu5demo  | atest1    | Welcome1 | 112336     |

  @RegressionTest
  Scenario Outline: TU5 Step 2: Post Nominal Letters & provider question when Exam Prep course is selected (C2040)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Exam Information web page
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    #Check ExamProviderQuestion for Certification subType = Exam
    When I select Certification/Designation from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Virtual Card Certification program radio dial from the programsRadioGroup
      And I select the radio dial with Exam text from the certificationType group
    Then The postNominalLettersModalBtn is visible
    When I click the postNominalLettersModalBtn element
    Then Text in ModalTitleText in the ProgramModal component is present
    When I click the ProgramModalXclose element
      And I wait until the backdrop is not visible
    Then The examProviderText is visible
      And The exact text in examProviderText should be Who is your exam provider?
    #Check ExamProviderQuestion for Certification subType = Exam and Prep Courses
    When I refresh the page
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Certification/Designation from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Virtual Card Certification program radio dial from the programsRadioGroup
      And I select the radio dial with Exam and Prep Courses text from the certificationType group
    Then The postNominalLettersModalBtn is visible
      And The examProviderText is visible
      And The exact text in examProviderText should be Who is your exam provider?
    When I click the cancelButton element
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | tu5demo    | atest1    | Welcome1 | 112355     |

  @RegressionTest
  Scenario Outline: TU5 Verify degree, FOS and programs filter and enable/disable correctly (C1782)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Home Address text from the addressRadioGroup group
      And I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Associate's Degree from the educationProgramDropdown
      And I select Bachelor's Degree from the educationProgramDropdown
      And I select Doctorate Degree from the educationProgramDropdown
      And I select Master's Degree from the educationProgramDropdown
      And I click the educationProgramDropdown element
    Then I should not see Undergraduate Certificate text in one of the educationProgramDropdowns fields
    When I select Business from the fieldOfStudyDropdown
    Then The graduateDegreeRadio element is enabled
      And The prepayTuitionRadio element is disabled
      And The edAccessReimbursementRadio element is disabled
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select Accredited Adviser in Insurance (AAI) from the fieldOfStudyDropdown
    Then I should not see SCRUM text in one of the fieldOfStudydropdowns fields
      And I should not see Undergraduate Certificate text in one of the educationProgramDropdowns fields
      And The graduateDegreeRadio element is disabled
      And The prepayTuitionRadio element is enabled
      And The edAccessReimbursementRadio element is disabled
      And The edAccessDirectBillRadio element is disabled
    When I select Accounting from the fieldOfStudyDropdown
    Then The continueButton element is disabled
      And The graduateDegreeRadio element is disabled
      And The prepayTuitionRadio element is disabled
      And The edAccessReimbursementRadio element is enabled
      And The edAccessDirectBillRadio element is enabled
      And The edProviderHeader is not visible
    When I select the radio dial with Education Access - Reimbursement text from the programRadioGroup group
      And I scroll to end of the page
    Then The universityOfMarylandProvider element is enabled
      And The westernGovernorsProvider element is enabled
      And The waldenUniversityProvider element is enabled
      And The coloradoStateUniGlobalCampus element is enabled
      And The continueButton element is enabled
    When I select the radio dial with University of Maryland University College text from the edAccessProvidersRadioGroup group
      And I click the continueButton element
    Then I should be on the courses page
      And The cancelButton element is enabled
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 112378     |

  @RegressionTest
  Scenario Outline: TU5 Verify that network schools acknowledgement appears (C82669)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When The continueButton element is enabled
      And I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the educationProviderEditButton element
      And I click the providerNetworkSchoolLabel element
      And I enter University of Phoenix in searchProviderNameInput textfield
      And I click the providerSearchButton element
    Then I should see University of Phoenix text in providerSearchResultsTable field
    When I click the first selection in the education providers search results table providerSearchResultsTable
      And I wait until the providerSearchButton is not visible
      And I click the continueButton element
    Then I should see Required fields are missing text in stepTwoErrorMessage field
      And I click the providerReviewCheckbox element
    # Revert back to Boston University so this does not break other tests
    When I scroll to educationProviderEditButton element
      And I click the educationProviderEditButton element
      And I enter Boston University in searchProviderNameInput textfield
    Then I click the providerSearchButton element
      And I should see Boston University text in providerSearchResultsTable field
    When I click the first selection in the education providers search results table providerSearchResultsTable
      And I wait until the providerSearchButton is not visible
      And I click the continueButton element
    Then I should be on the Courses page
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112381     |

  @RegressionTest
  Scenario Outline: TU5 Step 2: Verify Education Objective and Program SubType (C88956)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Certification/Designation from the educationProgramDropdown
      And I select Accounting from the FieldOfStudyDropdown
      And I check Virtual Card Certification program radio dial from the programsRadioGroup
    Then The examLabel is visible
      And The examAndPrepCoursesLabel is visible
      And The coursesLabel is visible
    When I select the radio dial with Exam text from the certificationType group
    Then I should see Education Program text in educationProgramDropdown field
      And I should see Specialization text in fieldOfStudyDropdown field
    When I click the cancelButton element
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112382     |

  @RegressionTest
  Scenario Outline: EG5 Verify that Degree/FOS cannot be changed on the Programs step (C95761)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The edGoalsTile is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When The continueButton element is enabled
      And I click the continueButton element
    Then I should be on the EducationInformation page
      And The edGoalRadioButton1 is visible
    When I click the firstEdGoal element
      And The FieldOfStudyDropdown is visible
      And The degreeObjectiveButton is visible
    Then The programsRadioGroup element is enabled
    When I check Tuition Reimbursement radio dial from the programsRadioGroup
      And The degreeObjectiveButton element is disabled
      And The fieldOfStudyButton element is disabled
      And The cancelButton element is enabled
    When I click on cancelButton using jsExecutor
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | 112383     |

  @RegressionTest
  Scenario Outline: TU5 Verify that StraighterLine in-site copy is displayed (C119296)
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
    When I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click the educationProviderEditButton element
    Then The providerName is visible
      And The providerSearchButton is visible
    When I enter StraighterLine in providerName textfield
      And I click the providerSearchButton element
    Then The providerSearchResultsTable is visible
    When I click the first selection in the education providers search results table providerSearchResultsTable
    Then I should be on the EducationInformation page
      And The providerInstructionText is visible
      And I verify the text below is present on the page
      #| Element                       | Text to verify                                                                                                                                                                                           |
      | providerInstructionText        | An affordable and convenient way to earn college credit. Complete all of the required general education courses for your degree on your schedule, for less than the cost of one course at many colleges. |
      | providerSpecialInstructionText | This provider has special instructions for obtaining tuition discounts, and/or grade payment documentation. Please review the following:                                                                 |
      And I report test passing test status
    Examples:
      | client    | username  | password | testCaseId |
      | tu5demo   | atest1    | Welcome1 | 112386     |

  @SmokeTest
  Scenario Outline: TU5 Certification Application Navigation (C2035)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I submit a new application: program = Virtual Card Certification program, expense type = Exam, user = Auto Test1, start date from today = 0, end date from today = 100, comment = false and upload = false
    Then I should be on the Submission page
      And The submissionIdLink is visible
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
    When I cancel an application from the Application Page Actions menu
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client  | username | password | stgTestCaseId | uatTestCaseId | prodTestCaseId |
      | tu5demo | atest1   | Welcome1 | 122181        | 122184        | 126594         |

  @RegressionTest
  Scenario Outline: Verify messaging if no providers are available for degree/FOS combination (C165975)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
      And The programsRadioGroup element is enabled
    When I select Bachelor's from the educationProgramDropdown
      And I select Administration of Justice from the FieldOfStudyDropdown
    Then I should see No education providers match the degree, field of study or program selected. Please change your selections. text in noProviderErrorMsg field
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 126576     |

  @RegressionTest
  Scenario Outline: TU5 Verify Dependent Modal UI when program allows both Dependent & Spouse (C142597)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When The programDropdown is visible
      And I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The addDepButton is visible
    When I click the addDepButton element
      And I select Dependent from the relationshipDropdown
    Then The dependentAgreement is visible
      And The spouseAgreement is not visible
    When I select Spouse from the relationshipDropdown
    Then The spouseAgreement is visible
      And The dependentAgreement is not visible
      And The dependentFirstName is visible
      And The dependentLastName is visible
      And The dependentDateOfBirth is visible
      And The dependentAcknowledgementLabel is visible
      And The modalSaveButton in the ProgramModal component is disabled
      And The modalCancelButton in the ProgramModal component is visible
      And I should see Family Member text in modalTitleText field
    When I click the modalClose in the ProgramModal component
    Then The addDepButton is visible
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest17  | Welcome1 | 117531     |

  @RegressionTest
  Scenario Outline: TU5 Verify "Student" dropdown defaults to "You" when no dependent and spouse added (C151050)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The actionNeededSection is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And I should see You (Auto Test17) text in applicationForField field
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest17  | Welcome1 | 120243     |

  @RegressionTest
  Scenario Outline: Verify a Dependent and Spouse can be successfully added & the "Student" dropdown shows correct default value (C151045)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The programDropdown is visible
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The addDepButton is visible
    When I click the addDepButton element
      And I select Spouse from the relationshipDropdown
      And I enter randomNumber in dependentFirstName textfield
      And I enter dependentLastName in dependentLastName textfield
      And I enter current date plus -500 days in dependentDateOfBirth
      And I click the dependentAcknowledgementLabel element
      And I click the modalSaveButton in the ProgramModal component
    Then The addDepOrSpouseText is visible
      And I should see A family member has been successfully added to your profile text in dependentSuccessMessage field
    When I select previousRandomNumber from the selectDependentDropdown
    Then I should see Spouse text in currentDependentDropdownValue field
    When I click the addDepButton element
      And I select Dependent from the relationshipDropdown
      And I enter randomNumber in dependentFirstName textfield
      And I enter dependentLastName in dependentLastName textfield
      And I enter current date plus -500 days in dependentDateOfBirth
      And I click the dependentAcknowledgementLabel element
      And I click the modalSaveButton in the ProgramModal component
    Then The addDepOrSpouseText is visible
      And I should see A family member has been successfully added to your profile text in dependentSuccessMessage field
    When I select previousRandomNumber from the selectDependentDropdown
    Then I should see Dependent text in currentDependentDropdownValue field
      And I click the homeNav in the Header component
    Then I should be on the Home page
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The addDepButton is visible
      And I should see Select text in currentDependentDropdownValue field
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest9   | Welcome1 | 120228     |

  @RegressionTest
  Scenario Outline: TU5 Verify that degree/FOS selections reset program selection (C166113)
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
    When I select Master's Degree from the educationProgramDropdown
    Then I should see Select text in fieldOfStudyButton field
      And The graduateDegreeRadio element is disabled
      And The prepayTuitionRadio element is disabled
      And The edAccessReimbursementRadio element is disabled
      And The edAccessDirectBillRadio element is disabled
    When I select Business Administration from the fieldOfStudyDropdown
      And I check Graduate Degree Program radio dial from the programsRadioGroup
      And I select Bachelor's Degree from the educationProgramDropdown
      And I select Accounting from the fieldOfStudyDropdown
    Then The edProviderHeader is not visible
      And the graduateDegreeRadio is not selected
      And the prepayTuitionRadio is not selected
      And the edAccessReimbursementRadio is not selected
      And the edAccessDirectBillRadio is not selected
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 126710     |

  @RegressionTest
  Scenario Outline: TU5 Verify UI & Error Validation when Enable Credit Hours & Application Expense Limit is enabled on Dependent/Spouse Program (C145717)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The programDropdown is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The selectDependentDropdown is visible
    When I select Spouse from the selectDependentDropdown
    Then I should see Spouse text in currentDependentDropdownValue field
    When I select Bachelor's Degree from the educationProgramDropdown
    Then The educationProviderEditButton element is enabled
    When I click on continueButton using jsExecutor
    Then I should be on the Courses page
      And I should see Dependent Expense Amount Content text in dependentExpenseContent field
      And The exact text in expenseRequestedAmount field should be 10
    When I click the continueButton element
    Then I should see Required fields are missing text in errorText field
      And I should see Course End date is required text in courseEndDateValidationText field
      And I should see Course Start date is required text in courseStartDateValidationText field
      And I should see This field is required text in creditsValidationText field
      And The academicCalendarDropdown element is enabled
    When I select Entire Year from the academicCalendarDropdown
    Then The academicCalendarDropdown element is enabled
    When I select Fall from the academicCalendarDropdown
      And I select Spring from the academicCalendarDropdown
      And I select Summer from the academicCalendarDropdown
      And I select Winter from the academicCalendarDropdown
      And I select Annual from the academicTermDropdown
      And I select Quarters from the academicTermDropdown
      And I select Semesters from the academicTermDropdown
      And I select Trimesters from the academicTermDropdown
      And I enter 10 in credits textfield
      And I enter current date plus 15 days in sessionEndDateInput
      And I enter current date plus 10 days in sessionStartDateInput
      And I click the continueButton element
    Then I should be on the Agreement page
      And I capture the current application ID from the url
      And I delete current tuition application using API
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest9   | Welcome1 | 117819     |

  @RegressionTest
  Scenario Outline: TU5 Verify FOS field display on Application flow for PPT with existing dependents/spouses & selecting himself for application (C145689)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The programDropdown is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The currentDependentDropdownValue element is enabled
    When I select You from the selectDependentDropdown
    Then I should see Select text in degreeObjectiveButton field
      And I should see Select text in fieldOfStudyButton field
    When I select Bachelor's Degree from the educationProgramDropdown
      And I select Actuarial Science from the fieldOfStudyDropdown
    Then The spouseProgramRadio element is disabled
      And The dependentProgramRadio element is disabled
      And I should see (ineligible) text in dependentProgramRadioLabel field
      And I should see (ineligible) text in spouseProgramRadioLabel field
    When I check Tuition Reimbursement Program radio dial from the programsRadioGroup
      And I click on continueButton using jsExecutor
    Then I should be on the Courses page
      And The sessionStartDateInput element is enabled
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
      And I enter Auto Test9 in signatureInput textfield
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Application page
      And The studentField is not visible
      And I should see Actuarial Science text in specialityText field
      And I should see Tuition Reimbursement Program text in employeeProgramText field
      And I should see Bachelor's text in educationProgramText field
    When I click the submitApplicationButton element
    Then I should be on the submission page
      And The submissionIdLink is visible
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The studentField is not visible
      And I should see Actuarial Science text in specialityText field
      And I should see Tuition Reimbursement Program text in employeeProgramText field
      And I should see Bachelor's text in educationProgramText field
    When I cancel an application from the Application Page Actions menu
    Then I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest9   | Welcome1 | 117756     |

  @RegressionTest
  Scenario Outline: TU5 Verify that EdAccess providers with LOCs disabled do not see the "LOC Issued" status and Access LOC not in Action Needed button (C173740)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I click NewApplicationButtonEABanner to go to ContactInformation page
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
    When I select Bachelor's Degree from the educationProgramDropdown
    Then I should see Select text in fieldOfStudyButton field
    When I select Accounting from the fieldOfStudyDropdown
      And I check Education Access - Direct Pay radio dial from the programsRadioGroup
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
      And I click the courseRelatedTaxYesOption element
      And I click the addCourseButton element
    Then I wait until the addCourseButton is not visible
    When The continueButton element is enabled
      And I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I enter Auto Test1 in signatureInput textfield
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Application page
      And The submitApplicationButton element is enabled
    When I click the submitApplicationButton element
    Then I should be on the Submission page
      And I should see Your application has been approved text in submissionStatusText field
    When I capture the application number submissionIdLink from the submission page
      And I click the homeNav in the Header component
    Then I should be on the home page
    When I navigate to page with current application under action needed
      And I click appBlockActionsButton button in action needed tile for current application
    Then The accessLetterOfCredit in the appBlockActionsButton component is not visible
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 133093     |

  @RegressionTest
  Scenario Outline: TU5 Verify that providers with LOCs enabled see the "LOC Issued" status (C173898)
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
    Then I should see Select text in fieldOfStudyButton field
    When I select Accounting from the fieldOfStudyDropdown
      And I check Education Access - Direct Pay radio dial from the programsRadioGroup
      And I select the radio dial with Western Governors University text from the edAccessProvidersRadioGroup group
      And I click on continueButton using jsExecutor
    Then I should be on the Courses page
    When The sessionStartDateInput element is enabled
      And I enter current date plus 0 days in sessionStartDateInput
      And I enter current date plus 60 days in sessionEndDateInput
      And I click the subscriptionTaxQ1 element
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I enter Auto Test1 in signatureInput textfield
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Application page
    When I click the submitApplicationButton element
    Then I should be on the Submission page
      And I should see Your application has been approved text in submissionStatusText field
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The exact text in applicationStatus should be LETTER OF CREDIT (LOC) ISSUED
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 133248     |

  @RegressionTest
  Scenario Outline: TU5 Verify that EdAccess providers are listed alphabetically (C169849)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And I scroll to end of the page
      And The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the EducationInformation page
    When I select Bachelor's Degree from the educationProgramDropdown
    Then I should see Select text in fieldOfStudyButton field
    When I select Accounting from the fieldOfStudyDropdown
      And I check Education Access - Reimbursement radio dial from the programsRadioGroup
      And I verify number of providerRadios on the page should be 4
    Then I verify sorting worked for providerRadios according to ascending order
    When I click the cancelButton element
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 130814     |

  @RegressionTest
  Scenario Outline: TU5 Verify Dependent application listed under "Action Needed" section (C155962)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And I scroll to end of the page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And I wait until the loadingSpinner is not visible
      And The selectDependentDropdown is visible
      And I select Dependent from the selectDependentDropdown
      And I extract text from currentDependentDropdownValue field
    And The degreeObjectiveButton is visible
    When I select Bachelor's Degree from the educationProgramDropdown
    Then The continueButton element is enabled
    When I click on continueButton using jsExecutor
    Then I should be on the Courses page
    When I select Entire Year from the academicCalendarDropdown
    Then The academicCalendarDropdown element is enabled
    When I select Spring from the academicCalendarDropdown
      And I select Semesters from the academicTermDropdown
      And I enter current date plus 15 days in sessionEndDateInput
      And I convert sessionEndDateInput date format from MM/dd/yy to MMM d, yyyy
      And I enter current date plus 10 days in sessionStartDateInput
      And I convert sessionStartDateInput date format from MM/dd/yy to MMM d, yyyy
      And I enter 10 in expenseRequestedAmount textfield
    Then I click on continueButton using jsExecutor
      And I should be on the Agreement page
    When I click the agreement1Label element
      And I enter Auto Test9 in signatureInput textfield
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Application page
      And I capture the current application ID from the url
      And I retrieve application number from applicationId
      And I validate sessionStartDate date is equal to sessionStartDateInput date
      And I validate sessionEndDate date is equal to sessionEndDateInput date
    When I click the cancelButton element
      And The deleteApplicationButton element is enabled
      And I click the saveApplicationForLaterButton element
    Then I should be on the Home page
    When I navigate to page with current application under action needed
    Then I should see SAVED — NOT SUBMITTED in current Application's tile in action needed section
      And I should see Dependent Program in current Application's tile in action needed section
      And I should see Colorado Mesa University in current Application's tile in action needed section
      And I should see Auto Test9 (for in current Application's tile in action needed section
      And I should see Submit or Cancel in current Application's tile in action needed section
      And I should see appNumber in current Application's tile in action needed section
      And I should see extractedDependentDropdownValue in current Application's tile in action needed section
    When I click appLink button in action needed tile for current application
    Then I should be on the Application page
    When I click the submitApplicationButton element
    Then I should be on the submission page
      And The submissionIdLink is visible
    When I log out
    Then I should be on the Login page
    When I'm on the <client> site
      And I login with <supervisor1> username and <supervisor1Pw> password
    Then I should be on the Home page
    When I navigate to page with current application under action needed
      And I wait until the loadingSpinner is not visible
    Then I should see FORWARDED TO SUPERVISOR FOR REVIEW in current Application's tile in action needed section
      And I should see Dependent Program in current Application's tile in action needed section
      And I should see Colorado Mesa University in current Application's tile in action needed section
      And I should see Auto Test9 (for in current Application's tile in action needed section
      And I should see Review Application in current Application's tile in action needed section
      And I should see sessionStartDateInput in current Application's tile in action needed section
      And I should see sessionEndDateInput in current Application's tile in action needed section
      And I should see appNumber in current Application's tile in action needed section
      And I should see extractedDependentDropdownValue in current Application's tile in action needed section
    When I click Review Application button in action needed tile for current application
    Then I should be on the Application page
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I enter Test Comment by Supervisor in approveApplicationCommentTextInput textfield
      And I click the approveApplicationWithCommentsButton element
      And I wait until the approveApplicationWithCommentsButton is not visible
    Then I should be on the Application page
    When I log out
    Then I should be on the Login page
    When I login with <username> username and <password> password
    Then I should be on the home page
    When I navigate to page with current application under action needed
    Then I should see APPROVED in current Application's tile in action needed section
      And I should see Dependent Program in current Application's tile in action needed section
      And I should see Colorado Mesa University in current Application's tile in action needed section
      And I should see Auto Test9 (for in current Application's tile in action needed section
      And I should see Upload Documents in current Application's tile in action needed section
      And I should see sessionStartDateInput in current Application's tile in action needed section
      And I should see sessionEndDateInput in current Application's tile in action needed section
      And I should see extractedDependentDropdownValue in current Application's tile in action needed section
      And I report test passing test status
    Examples:
      | client  | username | password |  supervisor1 | supervisor1Pw | testCaseId |
      | tu5demo | atest9   | Welcome1 |  atest2      | Welcome1      | 122250     |

  @RegressionTest
  Scenario Outline: TU5 Verify Spouse application listed under "Action Needed" section, For Status 90, 125, 120 (C178040)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And I scroll to end of the page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And I wait until the loadingSpinner is not visible
      And The selectDependentDropdown is visible
    When I select Spouse from the selectDependentDropdown
      And I extract text from currentDependentDropdownValue field
      And The degreeObjectiveButton is visible
      And I select Bachelor's Degree from the educationProgramDropdown
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Courses page
    When I select Entire Year from the academicCalendarDropdown
    Then The academicCalendarDropdown element is enabled
    When I select Spring from the academicCalendarDropdown
    Then I select Quarters from the academicTermDropdown
    When I enter current date plus 15 days in sessionEndDateInput
    Then I convert sessionEndDateInput date format from MM/dd/yy to MMM d, yyyy
    When I enter current date plus 10 days in sessionStartDateInput
    Then I convert sessionStartDateInput date format from MM/dd/yy to MMM d, yyyy
      And I enter 10 in credits textfield
    When  I click on continueButton using jsExecutor
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I click the agreement1Label element
      And I enter Auto Test9 in signatureInput textfield
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the Application page
      And I capture the current application ID from the url
      And I retrieve application number from applicationId
    When I click the cancelButton element
    Then The deleteApplicationButton element is enabled
    When I click the saveApplicationForLaterButton element
    Then I should be on the Home page
    When I navigate to page with current application under action needed
    Then I should see SAVED — NOT SUBMITTED in current Application's tile in action needed section
      And I should see Spouse Program in current Application's tile in action needed section
      And I should see Colorado Mesa University in current Application's tile in action needed section
      And I should see Auto Test9 (for in current Application's tile in action needed section
      And I should see Submit or Cancel in current Application's tile in action needed section
      And I should see appNumber in current Application's tile in action needed section
      And I should see extractedDependentDropdownValue in current Application's tile in action needed section
    When I click appLink button in action needed tile for current application
    Then I should be on the Application page
    When I click the submitApplicationButton element
    Then I should be on the submission page
      And The submissionIdLink is visible
      And I log out
    Then I should be on the Login page
      And I login with <supervisor1> username and <supervisor1Pw> password
    Then I should be on the Home page
    When I navigate to page with current application under action needed
      And I wait until the loadingSpinner is not visible
    Then I should see FORWARDED TO SUPERVISOR FOR REVIEW in current Application's tile in action needed section
      And I should see Spouse Program in current Application's tile in action needed section
      And I should see Colorado Mesa University in current Application's tile in action needed section
      And I should see Auto Test9 (for in current Application's tile in action needed section
      And I should see Review Application in current Application's tile in action needed section
      And I should see sessionStartDateInput in current Application's tile in action needed section
      And I should see sessionEndDateInput in current Application's tile in action needed section
      And I should see appNumber in current Application's tile in action needed section
      And I should see extractedDependentDropdownValue in current Application's tile in action needed section
    When I click Review Application button in action needed tile for current application
    Then I should be on the Application page
    When I click the approveApplicationButton element
    Then The approveApplicationCommentTextInput is visible
    When I enter Test Comment by Supervisor in approveApplicationCommentTextInput textfield
      And I click the approveApplicationWithCommentsButton element
      And I wait until the approveApplicationWithCommentsButton is not visible
    Then I should be on the Application page
    When I log out
    Then I should be on the Login page
    When I login with <username> username and <password> password
    Then I should be on the home page
    When I navigate to page with current application under action needed
    Then I should see APPROVED in current Application's tile in action needed section
      And I should see Spouse Program in current Application's tile in action needed section
      And I should see Colorado Mesa University in current Application's tile in action needed section
      And I should see Auto Test9 (for in current Application's tile in action needed section
      And I should see Upload Documents in current Application's tile in action needed section
      And I should see sessionStartDateInput in current Application's tile in action needed section
      And I should see sessionEndDateInput in current Application's tile in action needed section
      And I should see extractedDependentDropdownValue in current Application's tile in action needed section
      And I report test passing test status
    Examples:
      | client  | username | password |  supervisor1 | supervisor1Pw | testCaseId |
      | tu5demo | atest9   | Welcome1 |  atest2      | Welcome1      | 134104     |

  @RegressionTest
  Scenario Outline: Verify Denial Rules message is displayed while adding "new Spouse and Dependent" & then selecting "denied Spouse and Dependent" (C161011)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The programDropdown is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And I wait until the loadingSpinner is not visible
      And The addDepButton is visible
    When I click the addDepButton element
      And I select Spouse from the relationshipDropdown
      And I enter spouseFirstName in dependentFirstName textfield
      And I enter spouseLastName in dependentLastName textfield
      And I enter current date plus -500 days in dependentDateOfBirtth
      And I click the dependentAcknowledgementLabel element
      And I click the modalSaveButton in the ProgramModal component
    Then The exact text in rulesMessageModal should be A participant must have a minimum working schedule of 30 hours per week.
    When I click on modalCloseBtnFooter using jsExecutor
      And I select spouseFirstName from the selectDependentDropdown
    Then The exact text in rulesMessageModal should be A participant must have a minimum working schedule of 30 hours per week.
    When I click on modalCloseBtnFooter using jsExecutor
    Then I should see Select text in currentDependentDropdownValue field
    When I select You from the selectDependentDropdown
    Then The educationProgramDropdown element is enabled
    When I select spouseFirstName from the selectDependentDropdown
      And I click on modalCloseBtnFooter using jsExecutor
    Then I should see You text in currentDependentDropdownValue field
      And The addDepButton is visible
    When I click the addDepButton element
      And I select Dependent from the relationshipDropdown
      And I enter dependentFirstName in dependentFirstName textfield
      And I enter dependentLastName in dependentLastName textfield
      And I enter current date plus -500 days in dependentDateOfBirth
      And I click the dependentAcknowledgementLabel element
      And I click the modalSaveButton in the ProgramModal component
    Then The exact text in rulesMessageModal should be A participant must have a minimum working schedule of 30 hours per week.
      And I click on modalCloseBtnFooter using jsExecutor
    When I select dependentFirstName from the selectDependentDropdown
      And The exact text in rulesMessageModal should be A participant must have a minimum working schedule of 30 hours per week.
      And I click on modalCloseBtnFooter using jsExecutor
    Then I should see Select text in currentDependentDropdownValue field
    When I select You from the selectDependentDropdown
    Then The educationProgramDropdown element is enabled
    When I select spouseFirstName from the selectDependentDropdown
      And I click on modalCloseBtnFooter using jsExecutor
    Then I should see You text in currentDependentDropdownValue field
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest10  | Welcome1 | 126267     |

  @RegressionTest
  Scenario Outline: Verify Dependent & Expense Info on Step5 page & Application Summary page (C155958)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And I wait until the loadingSpinner is not visible
    When I select Dependent from the selectDependentDropdown
      And I extract text from currentDependentDropdownValue field
      And I select Bachelor's Degree from the educationProgramDropdown
    Then The FieldOfStudyDropdown is not visible
      And I should see (ineligible) text in vcProgramRadioLabel field
      And I should see (ineligible) text in tuitionProgramRadioLabel field
      And I should see (ineligible) text in vcCertiProgramRadioLabel field
      And I should see (ineligible) text in certiProgramRadioLabel field
      And I should see (ineligible) text in directBillProgramRadioLabel field
      And I should see (ineligible) text in spouseProgramRadioLabel field
      And the dependentProgramRadio is selected
    When I click on continueButton using jsExecutor
    Then I should be on the Courses page
      And The credits is not visible
    When I select Entire Year from the academicCalendarDropdown
      And I select Annual from the academicTermDropdown
      And I enter current date plus 5 days in sessionStartDateInput
      And I enter current date plus 10 days in sessionEndDateInput
      And I enter 1.99 in expenseRequestedAmount textfield
      And I click on continueButton using jsExecutor
    Then I should be on the Agreement page
      And The discountGrantQuestion is not visible
    When I click the agreement1Label element
      And I enter Auto Test9 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And I verify the text below is present on the page
      #| Element                | Text to verify              |
      | employeeProgramText     | Dependent Program           |
      | educationProgramText    | Bachelor's Degree           |
      | specialityText          | Unknown                     |
      | academicCalendar        | Entire Year                 |
      | term                    | Annual                      |
      | coursesExpensesApproved | $0.00                       |
      | totalBenefitText        | $1.99                       |
      And I should see extractedDependentDropdownValue text in studentName field
    When I click the submitApplicationButton element
    Then I should be on the submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And I verify the text below is present on the page
      #| Element                | Text to verify              |
      | employeeProgramText     | Dependent Program           |
      | educationProgramText    | Bachelor's Degree           |
      | specialityText          | Unknown                     |
      | academicCalendar        | Entire Year                 |
      | term                    | Annual                      |
      | coursesExpensesApproved | $0.00                       |
      | totalBenefitText        | $1.99                       |
      And I should see extractedDependentDropdownValue text in studentName field
    When I cancel an application from the Application Page Actions menu
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest9   | Welcome1 | 122203     |

  @RegressionTest
  Scenario Outline: Verify Spouse & Expense Info on Step5 page & Application Summary page (C155959)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And I wait until the loadingSpinner is not visible
    When I select Spouse from the selectDependentDropdown
      And I extract text from currentDependentDropdownValue field
      And I select Bachelor's Degree from the educationProgramDropdown
    Then The FieldOfStudyDropdown is not visible
      And I should see (ineligible) text in vcProgramRadioLabel field
      And I should see (ineligible) text in tuitionProgramRadioLabel field
      And I should see (ineligible) text in vcCertiProgramRadioLabel field
      And I should see (ineligible) text in certiProgramRadioLabel field
      And I should see (ineligible) text in directBillProgramRadioLabel field
      And I should see (ineligible) text in dependentProgramRadioLabel field
      And the spouseProgramRadio is selected
    When I click on continueButton using jsExecutor
    Then I should be on the Courses page
    When I select Entire Year from the academicCalendarDropdown
      And I select Annual from the academicTermDropdown
      And I enter 1 in credits textfield
      And I enter current date plus 5 days in sessionStartDateInput
      And I enter current date plus 10 days in sessionEndDateInput
    Then The exact text in expenseRequestedAmount field should be 10
    When I click on continueButton using jsExecutor
    Then I should be on the Agreement page
      And The discountGrantQuestion is visible
      And The eligibleGrantsYesRadioLabel is visible
      And The eligibleGrantsNoRadioLabel is visible
    When I click the eligibleGrantsNoRadioLabel element
      And I click the agreement1Label element
      And I enter Auto Test9 in signatureInput textfield
      And I click the continueButton element
    Then I should be on the Application page
      And I verify the text below is present on the page
      #| Element                | Text to verify              |
      | employeeProgramText     | Spouse Program              |
      | educationProgramText    | Bachelor's Degree           |
      | specialityText          | Unknown                     |
      | academicCalendar        | Entire Year                 |
      | term                    | Annual                      |
      | credits                 | 1                           |
      | coursesExpensesApproved | $0.00                       |
      | totalBenefitText        | $10.00                      |
      And I should see extractedDependentDropdownValue text in studentName field
    When I click the submitApplicationButton element
    Then I should be on the submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And I verify the text below is present on the page
      #| Element                | Text to verify              |
      | employeeProgramText     | Spouse Program              |
      | educationProgramText    | Bachelor's Degree           |
      | specialityText          | Unknown                     |
      | academicCalendar        | Entire Year                 |
      | term                    | Annual                      |
      | credits                 | 1                           |
      | coursesExpensesApproved | $0.00                       |
      | totalBenefitText        | $10.00                      |
      And I should see extractedDependentDropdownValue text in studentName field
    When I cancel an application from the Application Page Actions menu
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest9   | Welcome1 | 122207     |

  @RegressionTest
  Scenario Outline: Verify "Add Dependent" button & "Relationship Type" value when PPT is eligible for a program that allows ONLY Dependent (C140937)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The addDepButton is visible
      And The exact text in addDepButton should be ADD DEPENDENT
    When I click the addDepButton element
    Then The selectDependentDropdown is visible
      And The relationshipTypeDependent is visible
      And The exact text in relationshipTypeDependent should be Dependent
      And The spouseAgreement is not visible
      And The dependentAgreement is visible
      And The exact text in dependentAgreement should be Dependent Agreement
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest2   | Welcome1 | 116310     |

  @RegressionTest
  Scenario Outline: Verify "Add Spouse" button & "Relationship Type" value when PPT is eligible for a program that allows ONLY Spouse (C140938)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The addDepButton is visible
      And The exact text in addDepButton should be ADD SPOUSE
    When I click the addDepButton element
    Then The selectDependentDropdown is visible
      And The relationshipTypeDependent is visible
      And The exact text in relationshipTypeDependent should be Spouse
      And The spouseAgreement is visible
      And The dependentAgreement is not visible
      And The exact text in spouseAgreement should be Spouse Agreement
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest7   | Welcome1 | 116313     |

  @RegressionTest
  Scenario Outline: TU5 Verify user is able to add new dependent via Profile page (C169847)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The iconProfile in the Header component is visible
    When I navigate to Profile web page
    Then I should be on the Profile page
    When I scroll to whoElseWillYouSubmitApplicationsForHeaderText element
    Then The exact text in whoElseWillYouSubmitApplicationsForHeaderText should be Who else will you submit applications for?
      And The addDependentBtn element is enabled
    When I click the addDependentBtn element
    Then I should see Family Member text in alternateReviewerModalHeader field
      And I should see Relationship Type text in relationshipTypeHeader field
    When I click the relationshipTypeButton element
    Then The exact text in relationshipType0 should be Dependent
      And The exact text in relationshipType1 should be Spouse
      And The exact text in dependentFirstNameLabel should be First Name
      And The exact text in dependentLastNameLabel should be Last Name
      And The exact text in dateOfBirthLabel should be Date of Birth
      And The exact text in dependentAcknowledgementLabel should be I agree
      And The exact text in alternateReviewerCloseButton should be Cancel
      And The modalSubmitBtn element is disabled
      And The alternateReviewerCloseButton element is enabled
    When I click on relationshipType0 using jsExecutor
      And I enter 04/04/1991 in dateOfBirth textfield
      And I enter randomNumber in dependentFirstProfile textfield
      And I enter A in dependentLastProfile textfield
      And I click on dependentAcknowledgement using jsExecutor
      And I click on modalSubmitBtn using jsExecutor
      And The appAlertBanner element is enabled
    Then I should see A family member has been successfully added to your profile text in appAlertBanner field
      And I should see previousRandomNumber text in one of the dependentFirstName fields
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And I wait until the loadingSpinner is not visible
      And I select previousRandomNumber from the selectDependentDropdown
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | ATest23  | Welcome2 | 130801     |
