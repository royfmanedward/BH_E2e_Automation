Feature: EdGoal

  @SmokeTest
  Scenario Outline: EG5 Verify that an EdGoal can be created and approved (C95759)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
     And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I submit a new EdGoal: program = Education Goal, user = Auto Test1, start date from today = 1, end date from today = 10, comment = true, add grant = true, add credit hours = true, and upload = true
    Then I should be on the EdGoalSubmitted page
      And The submissionConfirmationStatus is visible
      And The exact text in submissionConfirmationStatus should be Your Education Goal was Forwarded to Supervisor For Review.
    When I capture the current application ID from the url
      And I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <supervisor> username and <supervisorPw> password
    Then The tuitionProgramManagement element is enabled
    When I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
      And The edGoalApproveButton is visible
    When I click the edGoalApproveButton element
    Then The comment is visible
    When I enter Test Approver1 in comment textfield
      And I click the submitButton element
      And I wait until the comment is not visible
      And I wait until the submitButton is not visible
    Then I should be on the EdGoalApprove page
      And The commentsAutTest is visible
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <supervisor2> username and <supervisorPw2> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
      And The edGoalApproveButton is visible
    When I click the edGoalApproveButton element
    Then The comment is visible
    When I enter Test Approver2 in comment textfield
      And I click the submitButton element
      And I wait until the comment is not visible
      And I wait until the submitButton is not visible
    Then I should be on the EdGoalApprove page
      And The commentsAutTest is visible
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <username> username and <password> password
    Then The tuitionProgramManagement element is enabled
    When I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
      And The statusHistoryBlockStatus is visible
      And The exact text in statusHistoryBlockStatus should be APPROVED
      And I cancel an EdGoal from the EdGoal Page cancel button
      And I report test passing test status
    Examples:
      | client     | username | password | supervisor | supervisorPw | supervisor2 | supervisorPw2 | stgTestCaseId | uatTestCaseId |  prodTestCaseId  |
      | lr5tu5demo | atest1   | Welcome1 | atest2     | Welcome1     | atest3      | Welcome1      | 87597         | 122194        |  126605          |

  @RegressionTest
  Scenario Outline: EG5 Verify EdGoal summary page contains required elements (C73620)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And The tuitionProgramManagement element is enabled
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I Update the EdGoal JSON files before doing an EdGoal API request
      #| Attribute                        | Value                |
      | Program                           | Education Goal       |
      | Anticipated Start Date from Today | 1                    |
      | Anticipated End Date from Today   | 10                   |
      | Comment                           | True                 |
      | Upload                            | True                 |
      | Credit Hours                      | 20                   |
      And I submit API request to create a an EdGoal application
      And I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
      And The exact text in estimatedAmount field should be 10.00
      And The exact text in estimatedCreditHours field should be 20
      And The exact text in financialAidAmount field should be 0.00
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <supervisor> username and <supervisorPw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
      And The edGoalApproveButton is visible
    When I click the edGoalApproveButton element
    Then The comment is visible
    When I enter Comments by Approver1 in comment textfield
      And I click the submitButton element
      And I wait until the submitButton is not visible
    Then I should be on the EdGoalApprove page
    When The IconProfile in the Header component is visible
      And I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <supervisor2> username and <supervisorPw2> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
      And The edGoalApproveButton is visible
    When I click the edGoalApproveButton element
    Then The comment is visible
    When I enter Comments by Approver2 in comment textfield
      And I click the submitButton element
      And I wait until the submitButton is not visible
    Then I should be on the EdGoalApprove page
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
      And The exact text in statusHistoryBlockStatus should be APPROVED
      And The supportingDocumentationDocument0 is visible
      And The commentsAutTest is visible
    Then The statusHistoryMsgAuttTest0 is visible
      And The exact text in forwardedToSupervisorForReviewStatusHistoryText should be FORWARDED TO SUPERVISOR FOR REVIEW
      And The exact text in programsEmployeeProgram should be Education Goal
      And The exact text in programsEducationProgram should be Associate's Degree
      And The exact text in programSpecialty should be Accounting and Finance
      And The edgoalStartDateField is visible
      And The edgoalEndDateField is visible
      And The programsName is visible
      And The exact text in estimatedAmount field should be 10.00
      And The exact text in estimatedCreditHours field should be 20
      And The exact text in financialAidAmount field should be 0.00
      And The exact text in signedAgreementText should be Signed
      And The signedAgreementDate is visible
      And I scroll to appSummaryCancelEdGoalBtn element
      And I cancel an EdGoal from the EdGoal Page cancel button
      And I report test passing test status
    Examples:
      | client     | username | password | supervisor | supervisorPw | supervisor2 | supervisorPw2 | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | atest2     | Welcome1     | atest3      | Welcome1      | 112476     |

  @RegressionTest
  Scenario Outline: EG5 Verify EdGoalProgramInfo page saves the edits made (C103943)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The edGoalsTile is visible
    When I click the addAnotherGoalBtn element
    Then I should be on the EdGoalProgramInfo page
    When I select Associate's Degree from the educationProgramDropdown
    Then The fieldOfStudyButton element is enabled
    When I select Accounting from the fieldOfStudyDropdown
    Then The educationGoalRadio element is enabled
    When I check Education Goal radio dial from the programsRadioGroup
      And I enter current date plus 1 days in courseStartDate
      And I enter current date plus 1 days in courseEndDate
    Then The providerInformationAddEducationProviderButton is visible
    When I click the providerInformationAddEducationProviderButton element
      And The providerName is visible
      And I enter Boston University in providerName textfield
      And I click the providerSearchSubmitButton element
    Then The providerSearchTbl is visible
    When I click the first selection in the education providers search results table providerSearchTbl
    Then The programInformationContinueButton element is enabled
    When I click the programInformationContinueButton element
    Then I should be on the EdGoalExpenseInfo page
    When I enter <expenseAmt> in expenseAmount textfield
      And I click the following elements
      #| Element ID to click             |
      | grantsEligibleRadioGroup1Label   |
      And I click the financialAidSourceIDButton element
      And I click the discountOption element
      And I enter <aidAmt> in financialAidAmount textfield
      And I enter <creditHrs> in creditHours textfield
      And I click the expenseInformationContinueButton element
    Then I should be on the Agreement page
      And The agreement1Label element is enabled
    When I click the following elements
      #| Element ID to click       |
      | agreement1Label            |
    Then The AgreementContinueButton element is disabled
    When I enter Auto in signatureInput textfield
      And I clear the signatureInput field
      And I enter Auto Test1 in signatureInput textfield
    Then The AgreementContinueButton element is enabled
    When I click the AgreementContinueButton element
    Then I should be on the EdGoalReview page
    When I enter Test EdGoal in summaryComment textfield
      And I click the summaryContinueButton element
    Then The summaryCancelButton is visible
      And I should be on the EdGoalSubmitted page
      And The exact text in submissionConfirmationStatus should be Your Education Goal was Submitted - Incomplete.
    When I capture the current application ID from the url
      And I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
      And The exact text in estimatedAmount field should be <expenseAmt>
      And The exact text in financialAidAmount field should be <aidAmt>
      And The exact text in estimatedCreditHours field should be <creditHrs>
      And The estimatedExpensesTimelineEditButton is visible
    When I scroll to programsEditButton element
      And I click the programsEditButton element
    Then I should be on the EdGoalProgramInfo page
    When I select Bachelor's Degree from the educationProgramDropdown
    Then The fieldOfStudyButton element is enabled
    When I select Biology from the fieldOfStudyDropdown
    Then The educationGoalRadio element is enabled
    When I check Education Goal radio dial from the programsRadioGroup
      And I clear the courseStartDate field
      And I clear the courseEndDate field
      And I enter 01/29/2019 in courseStartDate textfield
      And I enter 02/01/2019 in courseEndDate textfield
    When I click on whoIsYourPrimaryEducationProviderEditButton using jsExecutor
      And I enter University of Denver University College in providerName textfield
      And I click the providerSearchSubmitButton element
    Then The providerSearchTbl is visible
    When I click the first selection in the education providers search results table providerSearchTbl
      And I wait until the providerSearchTbl is not visible
    Then I should be on the EdGoalProgramInfo page
      And The exact text in providerName field should be University of Denver University College
      And The programInformationContinueButton is visible
    When I click the programInformationContinueButton element
    Then I should be on the EdGoalExpenseInfo page
    When I clear the expenseAmount field
      And I enter 200 in expenseAmount textfield
      And I clear the creditHours field
      And I enter 30 in creditHours textfield
      And I click the expenseInformationContinueButton element
    Then I should be on the Agreement page
      And The AgreementContinueButton element is disabled
    When I click the following elements
      #| Element ID to click       |
      | agreement1Label            |
    Then The AgreementContinueButton element is disabled
    When I enter Auto Test1 in signatureInput textfield
      And I click the AgreementContinueButton element
    Then I should be on the EdGoalReview page
      And The programsEducationProgram is visible
      And The exact text in programsEducationProgram should be Bachelor's Degree
      And The exact text in programSpecialty should be Biology
      And The exact text in estimatedAmount field should be 200.00
      And The exact text in estimatedCreditHours field should be 30
      And The exact text in programsName should be University of Denver University College
      And The exact text in edgoalStartDateField should be Jan 29, 2019
      And The exact text in edgoalEndDateField should be Feb 1, 2019
      And The exact text in signedAgreementText should be Signed
    When I click the summaryCancelButton element
    Then I should be on the home page
      And I report test passing test status
    Examples:
      | client     | username | password |  expenseAmt  | aidAmt  | creditHrs | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 |  100.00      | 25.00   | 20        | 112480     |

  @RegressionTest
  Scenario Outline: EG5 Verify supervisor sees participant comments, uploads document and sets status to Denied-Incomplete (C84608)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And The tuitionProgramManagement element is enabled
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I Update the EdGoal JSON files before doing an EdGoal API request
      #| Attribute                        | Value                |
      | Program                           | Education Goal       |
      | Anticipated Start Date from Today | 1                    |
      | Anticipated End Date from Today   | 10                   |
      | Comment                           | True                 |
      | Upload                            | True                 |
      | Credit Hours                      | 20                   |
      And I submit API request to create a an EdGoal application
      And I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <supervisor> username and <supervisorPw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
      And The supportingDocumentationDocument0 is visible
      And The commentsAutTest is visible
      And The edGoalIncompleteButton is visible
    When I click the edGoalIncompleteButton element
    Then I enter Test Incomplete Approver1 in comment textfield
    When I click the submitButton element
      And I wait until the submitButton is not visible
    Then I should be on the EdGoalApprove page
    When The statusHistoryBlockStatus element is enabled
    Then The exact text in statusHistoryBlockStatus should be SUBMITTED — INCOMPLETE
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
      And The agreementsEditButton is visible
    When I click the agreementsEditButton element
    Then I should be on the Agreement page
    When I enter Auto Test1 in signatureInput textfield
      And I click the agreement1Label element
    Then The agreementContinueButton element is enabled
    When I click the agreementContinueButton element
    Then I should be on the EdGoalReview page
      And The summaryContinueButton element is enabled
    When I click the summaryContinueButton element
    Then I should be on the EdGoalSubmitted page
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <supervisor> username and <supervisorPw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
      And The edGoalDenyButton is visible
    When I click the edGoalDenyButton element
    Then The comment is visible
    When I enter Test Deny Approver1 in comment textfield
      And I click the submitButton element
    Then I should be on the EdGoalApprove page
      And The exact text in statusHistoryBlockStatus should be DENIED
      And I report test passing test status
    Examples:
      | client     | username | password | supervisor | supervisorPw | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | atest2     | Welcome1     | 112478     |

  @RegressionTest
  Scenario Outline: EG5 Verify user cannot progress past the Programs step until all items are selected (C84605)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I click the addAnotherGoalBtn element
    Then I should be on the EdGoalProgramInfo page
      And The educationProgramDropdown is visible
      And The programInformationContinueButton element is disabled
      And The educationGoalRadio element is disabled
    When I select Associate's Degree from the educationProgramDropdown
    Then The educationGoalRadio element is disabled
      And The fieldOfStudyButton element is enabled
    When I select Accounting from the fieldOfStudyDropdown
    Then The programInformationContinueButton element is disabled
      And The educationGoalRadio element is enabled
    When I check Education Goal radio dial from the programsRadioGroup
      And I enter current date plus 10 days in courseStartDate
      And I enter current date plus 9 days in courseEndDate
      And The programInformationContinueButton element is disabled
      And I clear the courseEndDate field
      And I enter current date plus 20 days in courseEndDate
    Then The providerInformationAddEducationProviderButton is visible
    When I click the providerInformationAddEducationProviderButton element
      And The providerName is visible
      And I enter Boston University in providerName textfield
      And I click the providerSearchSubmitButton element
    Then The providerSearchTbl is visible
    When I click the first selection in the education providers search results table providerSearchTbl
    Then I should be on the EdGoalProgramInfo page
      And The exact text in providerName field should be Boston University
      And I should be on the EdGoalProgramInfo page
      And The programInformationContinueButton element is enabled
    When I click the programInformationCancelButton element
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | 112477     |

  @RegressionTest
  Scenario Outline: EG5 Verify Step 1 of the new application flow with EdGoals enabled (C60644)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The edGoalsTile is visible
    When I click the addAnotherGoalBtn element
    Then I should be on the EdGoalProgramInfo page
    When I select Ph.D. from the educationProgramDropdown
    Then The fieldOfStudyButton element is enabled
    When I select Adult Education from the fieldOfStudyDropdown
    Then The programsRadioGroup element is enabled
    When I check Education Goal radio dial from the programsRadioGroup
      And I enter current date plus 1 days in courseStartDate
      And I enter current date plus 10 days in courseEndDate
    Then The ProviderInformationAddEducationProviderButton is visible
    When I click the ProviderInformationAddEducationProviderButton element
      And The providerName is visible
      And I enter Boston University in providerName textfield
      And I click the providerSearchSubmitButton element
    Then The providerSearchTbl is visible
    When I click the first selection in the education providers search results table providerSearchTbl
    Then I should be on the EdGoalProgramInfo page
      And The programInformationCancelButton element is enabled
      And I scroll to programInformationCancelButton element
    When I click the programInformationCancelButton element
    Then I should be on the Home page
    When I click the addAnotherGoalBtn element
    Then I should be on the EdGoalProgramInfo page
    When I select Associate's from the educationProgramDropdown
    Then The fieldOfStudyDropdown is visible
    When I select Chemistry from the fieldOfStudyDropdown
      And I click the fieldOfStudyDropdown element
      And I scroll to programInformationCancelButton element
    When I click the programInformationCancelButton element
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest3   | Welcome1 | 112475     |

  @RegressionTest
  Scenario Outline: EG5 Verify that on the review page a user can change contact preferences (C87601)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to Profile web page
    Then I should be on the Profile page
    When I select the radio dial with Use Home Address text from the addressRadioGroup group
      And I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the contactInfoSaveButton element
      And I click the homeNav in the Header component
    Then I should be on the Home page
      And The edGoalsTile is visible
    When I click the addAnotherGoalBtn element
    Then I should be on the EdGoalProgramInfo page
    When I select Associate's Degree from the educationProgramDropdown
    Then The fieldOfStudyButton element is enabled
    When I select Accounting from the fieldOfStudyDropdown
    Then The educationGoalRadio element is enabled
    When I check Education Goal radio dial from the programsRadioGroup
      And I enter current date plus 1 days in courseStartDate
      And I enter current date plus 10 days in courseEndDate
    Then The providerInformationAddEducationProviderButton is visible
    When I click the providerInformationAddEducationProviderButton element
      And The providerName is visible
      And I enter Boston University in providerName textfield
      And I click the providerSearchSubmitButton element
    Then The providerSearchTbl is visible
    When I click the first selection in the education providers search results table providerSearchTbl
      And I click TAB key in courseEndDate textfield
    Then The programInformationContinueButton element is enabled
    When I click the programInformationContinueButton element
    Then I should be on the EdGoalExpenseInfo page
      And The expenseAmount is visible
    When I enter 100 in expenseAmount textfield
    Then The grantsEligibleRadioGroup2Label is visible
    When I click the following elements
      #| Element ID to click           |
      | grantsEligibleRadioGroup2Label |
      And I enter 20 in creditHours textfield
    When The expenseInformationContinueButton element is enabled
    Then I click the expenseInformationContinueButton element
    Then I should be on the Agreement page
      And The AgreementContinueButton element is disabled
    When I click on agreement1Label using jsExecutor
      And I enter Auto Test1 in signatureInput textfield
    Then The AgreementContinueButton element is enabled
    When I click the AgreementContinueButton element
      And I wait until the AgreementContinueButton is not visible
    Then I should be on the EdGoalReview page
      And I verify the text below is present on the page
      #| Element       | Text to verify           |
      | contactAddress | FakeHome, MA 12345       |
      | contactPhone   | 6178675309               |
      | contactEmail   | tamssupport@edassist.com |
    When I click the contactInformationEditButton element
      And The contactInformationSaveButton element is enabled
      And I select the radio dial with Use Work Address text from the addressRadioGroup group
      And I select the radio dial with Use Work Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the contactInformationSaveButton element
      And I wait until the contactInformationSaveButton is not visible
    When I refresh the page
      And The contactAddress element is enabled
    Then I verify the text below is present on the page
      #| Element        | Text to verify           |
      | contactAddress  | FakeWork, MA 67890       |
      | contactPhone    | 8006492568               |
      | contactEmail    | tamssupport@edassist.com |
    When I click the contactInformationEditButton element
    Then The contactInformationSaveButton element is enabled
      And I select the radio dial with Use Home Address text from the addressRadioGroup group
      And I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
    When I click the contactInformationSaveButton element
      And I wait until the summaryContinueButton is not visible
    Then I verify the text below is present on the page
     #| Element         | Text to verify           |
      | contactAddress  | FakeHome, MA 12345       |
      | contactPhone    | 6178675309               |
      | contactEmail    | tamssupport@edassist.com |
    When I navigate to Profile web page
    Then I should be on the Profile page
      And The radio dial with Use Home Address text in the addressRadioGroup group is visible
      And The radio dial with Use Home Address text from the addressRadioGroup group is selected
      And The radio dial with Use Home Phone text from the phoneRadioGroup group is selected
      And The radio dial with Use Work Email text from the emailRadioGroup group is selected
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | 112479     |

  @RegressionTest
  Scenario Outline: EG5 Verify that clients without EdGoals configured do not see EdGoals features (C95762)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The addAnotherGoalBtn is not visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1   | Welcome1 | 112538     |

  @RegressionTest
  Scenario Outline: EG5 Verify new application button is disabled for user with NO EdGoal or until user has EdGoal in Approved status (C60642)
  Given I set the <testCaseId>
    And I'm on the <client> site
  When I login with <user1> username and <user1Pw> password
    And I click the tuitionProgramManagement element
  Then I should be on the Home page
    And The scheduleFreeAdvisingLink is visible
    And The edGoalBanner is visible
    And The exact text in edGoalsAddGoalBtnTopBanner should be Start an Education Goal
    And The edGoalsTileBlock is visible
    And The exact text in addAnotherGoalBtn should be Start an Education Goal
    And The newApplicationButton in the Header component is disabled
    And The NewApplicationButtonEABanner element is disabled
  When I click the IconProfile in the Header component
    And I click the LogoutNav in the Header component
    And I click the logOutButton in the Header component
  Then I should be on the Logout page
  When I login with <user2> username and <user2Pw> password
    And I click the tuitionProgramManagement element
  Then I should be on the Home page
    And The scheduleFreeAdvisingLink is visible
    And The edGoalBanner is not visible
    And The edGoalsTileBlock is visible
    And The exact text in edGoalHomeAppStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
    And The exact text in addAnotherGoalBtn should be + Add Another Goal
    And The newApplicationButton in the Header component is disabled
    And The NewApplicationButtonEABanner element is disabled
  When I click the IconProfile in the Header component
    And I click the LogoutNav in the Header component
    And I click the logOutButton in the Header component
  Then I should be on the Logout page
  When I login with <user3> username and <user3Pw> password
    And I click the tuitionProgramManagement element
  Then I should be on the Home page
    And The scheduleFreeAdvisingLink is visible
    And The edGoalBanner is not visible
    And The edGoalsTileBlock is visible
    And The edGoalHomeAppStatus is visible
    And The exact text in addAnotherGoalBtn should be + Add Another Goal
    And The newApplicationButton in the Header component is enabled
    And The NewApplicationButtonEABanner element is enabled
  When I click the newApplicationButton in the Header component
  Then I should be on the ContactInformation page
  When I click on continueButton using jsExecutor
  Then I should be on the EducationInformation page
    And The exact text in edGoalProgramMessage should be If your application does not relate to the goals listed, you will need to create a new goal from the home page dashboard. Your application will be saved and you can return to it later.
    And The continueButton element is disabled
    And I report test passing test status
  Examples:
    | client     | user1   | user1Pw  | user2   | user2Pw  | user3   | user3Pw   | testCaseId |
    | lr5tu5demo | atest15 | Welcome1 | atest14 | Welcome1 | atest1  | Welcome1  | 112534     |

  @RegressionTest
  Scenario Outline: TU5 Verify ApplyNow button on LearnMore page for user with No EdGoal or until user has EdGoal in Approved status (C159197)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <user1> username and <user1Pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The edAccessBanner is visible
      And The edAccessMoreInfo element is enabled
    When I click the edAccessMoreInfo element
    Then I should be on the EdAccessLearnMore page
    When I click on providerLearnMoreButton using jsExecutor
    Then The modalSubmitBtn is visible
      And The providerModal is visible
    When I click on modalSubmitBtn using jsExecutor
    Then I should be on the EdGoalProgramInfo page
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <user2> username and <user2Pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The edAccessBanner is visible
      And The edAccessMoreInfo element is enabled
    When I click the edAccessMoreInfo element
    Then I should be on the EdAccessLearnMore page
    When I click on providerLearnMoreButton using jsExecutor
    Then The providerModal is visible
    When I click on modalSubmitBtn using jsExecutor
    Then I should be on the EdGoalApprove page
      And The statusHistoryBlockStatus is visible
      And The exact text in statusHistoryBlockStatus should be FORWARDED TO SUPERVISOR FOR REVIEW
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <user3> username and <user3Pw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The edAccessBanner is visible
      And The edAccessMoreInfo element is enabled
    When I click the edAccessMoreInfo element
    Then I should be on the EdAccessLearnMore page
    When I click on providerLearnMoreButton using jsExecutor
    Then The providerModal is visible
    When I click on modalSubmitBtn using jsExecutor
    Then I should be on the ContactInformation page
      And I report test passing test status
    Examples:
      | client     | user1   | user1Pw  | user2   | user2Pw  | user3   | user3Pw   | testCaseId |
      | lr5tu5demo | atest15 | Welcome1 | atest14 | Welcome1 | atest1  | Welcome1  | 124317     |

  @RegressionTest
  Scenario Outline: TU5 Verify EdGoals in Approved status can be closed from EdGoal Tile (C87609)
    Given I set the <testCaseID>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And The tuitionProgramManagement element is enabled
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I Update the EdGoal JSON files before doing an EdGoal API request
      #| Attribute                        | Value                |
      | Program                           | Education Goal       |
      | Anticipated Start Date from Today | 1                    |
      | Anticipated End Date from Today   | 10                   |
      | Comment                           | True                 |
      | Upload                            | True                 |
      | Credit Hours                      | 20                   |
      And I submit API request to create a an EdGoal application
      And I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <supervisor> username and <supervisorPw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
      And The edGoalApproveButton is visible
    When I click the edGoalApproveButton element
    Then The comment is visible
    When I enter Test Approver1 in comment textfield
      And I click the submitButton element
      And I wait until the submitButton is not visible
    Then I should be on the EdGoalApprove page
      And The commentsAutTest is visible
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <supervisor2> username and <supervisorPw2> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
      And The edGoalApproveButton is visible
    When I click the edGoalApproveButton element
    Then The comment is visible
    When I enter Test Approver2 in comment textfield
      And I click the submitButton element
      And I wait until the submitButton is not visible
    Then I should be on the EdGoalApprove page
      And The IconProfile in the Header component is visible
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <username> username and <password> password
    Then The tuitionProgramManagement element is enabled
    When I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The scheduleFreeAdvisingLink is visible
    When I click the edGoalActions element
      And I click the currentEdGoalClose element
    Then The commentBox is visible
    When I enter Test Close in commentBox textfield
      And I click on closeThisEducationGoalBtn using jsExecutor
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client     | username | password | supervisor | supervisorPw | supervisor2 | supervisorPw2 | testCaseID |
      | lr5tu5demo | atest10  | Welcome1 | atest2     | Welcome1     | atest3      | Welcome1      | 124032     |

  @RegressionTest
  Scenario Outline: Verify when an Approved EdGoal is closed from the EdGoal Summary page, the comments entered can be seen (C156098)
    Given I set the <testCaseID>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And The tuitionProgramManagement element is enabled
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I Update the EdGoal JSON files before doing an EdGoal API request
      #| Attribute                        | Value                |
      | Program                           | Education Goal       |
      | Anticipated Start Date from Today | 1                    |
      | Anticipated End Date from Today   | 10                   |
      | Comment                           | True                 |
      | Upload                            | True                 |
      | Credit Hours                      | 20                   |
      And I submit API request to create a an EdGoal application
      And I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <supervisor> username and <supervisorPw> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
      And The edGoalApproveButton is visible
    When I click the edGoalApproveButton element
    Then The comment is visible
    When I enter Test Approver1 in comment textfield
      And I click the submitButton element
      And I wait until the submitButton is not visible
    Then I should be on the EdGoalApprove page
      And The commentsAutTest is visible
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <supervisor2> username and <supervisorPw2> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
      And The edGoalApproveButton is visible
    When I click the edGoalApproveButton element
    Then The comment is visible
    When I enter Test Approver2 in comment textfield
      And I click the submitButton element
      And I wait until the submitButton is not visible
    Then I should be on the EdGoalApprove page
      And The IconProfile in the Header component is visible
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I login with <username> username and <password> password
    Then The tuitionProgramManagement element is enabled
    When I click the tuitionProgramManagement element
    Then I should be on the Home page
    When I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
    When I click the appSummaryCloseEdGoalBtn element
      And I enter Test Close in comment textfield
      And I click the submitButton element
    Then I should be on the EdGoalApprove page
      And I wait until the submitButton is not visible
      And The statusHistoryBlockStatus is visible
      And The exact text in statusHistoryBlockStatus should be CLOSED
      And The exact text in statusHistoryMsgAuttTest0 should be Test Close
      And I report test passing test status
    Examples:
      | client     | username | password | supervisor | supervisorPw | supervisor2 | supervisorPw2 | testCaseID |
      | lr5tu5demo | atest10  | Welcome1 | atest2     | Welcome1     | atest3      | Welcome1      | 124145     |

  @RegressionTest
  Scenario Outline: View Status History for Ed Goal - Verify Display Logic for Denied status (930) (C134502)
    Given I set the <testCaseID>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The addAnotherGoalBtn is visible
    When I click the addAnotherGoalBtn element
    Then I should be on the EdGoalProgramInfo page
    When I select Associate's Degree from the educationProgramDropdown
    Then The fieldOfStudyButton element is enabled
    When I select Accounting from the fieldOfStudyDropdown
    Then The educationGoalRadio element is enabled
    When I check Education Goal radio dial from the programsRadioGroup
      And I enter current date plus 1 days in courseStartDate
      And I enter current date plus 60 days in courseEndDate
    Then The providerInformationAddEducationProviderButton is visible
    When I click the providerInformationAddEducationProviderButton element
      And The providerName is visible
      And I enter Academy of Creative Hair Design in providerName textfield
      And I click the providerSearchSubmitButton element
    Then The providerSearchTbl is visible
    When I click the first selection in the education providers search results table providerSearchTbl
    Then The programInformationContinueButton element is enabled
    When I click the programInformationContinueButton element
    Then I should be on the EdGoalExpenseInfo page
    When I enter <expenseAmt> in expenseAmount textfield
      And I click the following elements
      #| Element ID to click             |
      | grantsEligibleRadioGroup1Label   |
      And I click the financialAidSourceIDButton element
      And I click the discountOption element
      And I enter <aidAmt> in financialAidAmount textfield
      And I enter <creditHrs> in creditHours textfield
      And I click the expenseInformationContinueButton element
    Then I should be on the Agreement page
      And The agreement1Label element is enabled
    When I click the following elements
      #| Element ID to click       |
      | agreement1Label            |
    Then The AgreementContinueButton element is disabled
      And I enter Auto Test10 in signatureInput textfield
    Then The AgreementContinueButton element is enabled
    When I click the AgreementContinueButton element
    Then I should be on the EdGoalReview page
    When I enter Test EdGoal in summaryComment textfield
      And I click the summaryContinueButton element
    Then I should be on the EdGoalSubmitted page
      And The submissionConfirmationStatus is visible
      And The exact text in submissionConfirmationStatus should be Your Education Goal was Denied.
    When I capture the current application ID from the url
      And I navigate to the current educationGoal page
    Then I should be on the EdGoalApprove page
      And The statusHistoryBlockStatus is visible
      And The exact text in statusHistoryBlockStatus should be DENIED
      And The statusHistoryMsgAuttTest0 is visible
      And The exact text in statusHistoryMsgAuttTest0 should be The selected Educational Provider does not hold accreditation required by the program policy.
      And I report test passing test status
    Examples:
      | client     | username | password | expenseAmt | aidAmt | creditHrs | testCaseID |
      | lr5tu5demo | atest10  | Welcome1 | 100        | 25     | 20        | 124536     |
