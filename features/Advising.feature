Feature: Advising and Message An Expert

  @RegressionTest
  Scenario Outline: TU5 Advising page elements are present if enabled for client both Loan and Tuition Advising (C1909)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click the tuitionProgramManagement element
    Then I should be on the Home page
      And The scheduleFreeAdvisingLink is visible
    When I click the educationCoachingNav in the Header component
    Then I should be on the Advising page
      And The scheduleFreeAdvising is visible
      And The advisingLearnMoreBtn is visible
      And The advisingNetworkUrlButton is visible
    When I click the advisingLearnMoreBtn element
      And I switch to second tab
    Then The url should be https://clients.brighthorizons.com/brighthorizons
      And I change focus to tab 0
    When I click the advisingNetworkUrlButton element
      And I change focus to tab 2
    Then The url should be https://clients.brighthorizons.com/brighthorizons/matrix
    When I change focus to tab 0
    When I click the productSelectionIcon in the header component
      And I click the loanProductSelection in the header component
    Then I should be on the dashboard page
      And The advisingTileLearnMore element is enabled
    When I click the advisingTileLearnMore element
    Then I should be on the advising page
      And The scheduleFreeAdvising element is enabled
      And The messageExpertBtn element is enabled
      And The lrpBrowseHelpfulContentButton element is enabled
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | 112340     |

  @RegressionTest
  Scenario Outline: TU5 Verify submit message an expert ticket with valid and invalid documents (C55974)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Advising page
    When I click the messageExpertBtn element
    Then The commentsTextArea is visible
      And The submitMessageBtn element is disabled
    When I upload InvalidPTMFileType file using the sharedFileUpload component
    Then I should see Invalid File Type text in invalidFileMessage field
      And The submitMessageBtn element is disabled
    When I upload TestTooLarge.pdf file using the sharedFileUpload component
    Then I should see File Size should be less than 3 MB text in errorFileSize field
      And The submitMessageBtn element is disabled
    When I enter <text> in commentsTextArea textfield
      And I upload <fileName> file using the sharedFileUpload component
    Then Text in uploadDocSuccessMessage field is present
    When I click the submitMessageBtn element
    Then The successMessage is visible
      And I report test passing test status
    Examples:
      | client  | username  | password | text        | fileName     | testCaseId |
      | eg5demo | ATest1230 | Welcome1 | Test upload | TestFile.pdf | 112342     |

  @SmokeTest
  Scenario Outline: TU5 Verify creating, updating and canceling an Advising Appointment (C94221)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I click the educationCoachingNav in the Header component
    Then I should be on the Advising page
    When I click the scheduleFreeAdvising element
    Then The reasonForAdvisingSessionDropdown is visible
    When I select specified text from dropdown
      #| Element                             | Specified Text to select                                                                 |
      | reasonForAdvisingSessionDropdown     | ACADEMIC – Would like help with finding a school or program that would best fit my needs |
      | highestLevelFfEducationEarned        | High School                                                                              |
      | whatTypeOfEducationAreYouSeeking     | Individual courses or Pre-requisites                                                     |
      | whereAreYouInTheEnrollmentProcess    | Applied                                                                                  |
      | numberOfYearsInCurrentPosition       | 1                                                                                        |
      | currentlyEnrolledInProgram           | Yes                                                                                      |
      | inTheProcessOfPayingBackStudentLoans | No                                                                                       |
      | yearsOfProfessionalExperience        | 1-5 Years                                                                                |
      | yearsWithCurrentEmployer             | 5 or More Years                                                                          |
      | currentEmployeeStatus                | Full-Time                                                                                |
      And I click the scheduleApptSubmitBtn element
    Then The scheduleApptCancelBtn is visible
    When I select the radio dial with Use Work Address text from the addressRadioGroup group
      And I select the radio dial with Use Work Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the scheduleApptSubmitBtn element
    Then The previousMonthBtn is visible
      And The nextMonthBtn is visible
    When I click first available day with available time
      And The firstAvailableTime is visible
      And I click the firstAvailableTime element
    Then I should see Academic text in appointmentAdvisorText field
    When I click the loanAdvisingSubmitButton element
      And The loanAdvisingSubmitButton element is enabled
    Then I click the loanAdvisingSubmitButton element
      And The submitSuccessIcon is visible
      And The modalCloseBtn element is enabled
    When I click the modalCloseBtn element
      And I wait until the modalCloseBtn is not visible
    Then I should be on the Advising page
      And The advisingAptSeeMoreBtn is visible
    When I click the advisingAptSeeMoreBtn element
    Then The advisingAptUpdateBtn is visible
    When I click the advisingAptUpdateBtn element
    Then The previousMonthBtn is visible
      And The nextMonthBtn is visible
    When I click first available day with available time
      And The firstAvailableTime is visible
    Then I click the firstAvailableTime element
      And I click the loanAdvisingSubmitButton element
    When The loanAdvisingSubmitButton element is enabled
    Then I click the loanAdvisingSubmitButton element
    When I click the modalCloseBtn element
    Then I should be on the Advising page
      And The advisingAptSeeMoreBtn element is enabled
      And I scroll to advisingAptSeeMoreBtn element
    When I click the advisingAptSeeMoreBtn element
    Then The advisingAptCancelBtn is visible
      And I scroll to advisingAptCancelBtn element
      And The advisingAptCancelBtn element is enabled
    When I click the advisingAptCancelBtn element
    Then The advisingAptCancelModalYesBtn is visible
      And The advisingAptCancelModalNoBtn is visible
    When I click the advisingAptCancelModalYesBtn element
      And I wait until the advisingAptCancelModalYesBtn is not visible
    Then I should be on the Advising page
      And The advisingAptStatusText is visible
    Then I should see CANCELLED text in advisingAptStatusText field
      And I report test passing test status
    Examples:
      | client  | username | password | stgTestCaseId | uatTestCaseId | prodTestCaseId |
      | tu5demo | atest1   | Welcome1 | 85754         | 122193        | 126603         |

  @SmokeTest
  Scenario Outline: LR5 Create an Advising Appointment (C73435)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
    When I navigate to Education Coaching web page
    Then I should be on the Advising page
    When I click the loanScheduleAdvisingButton element
      And The typesOfLoanHeader is visible
      And The howMuchStudentLoanDebtHeader is visible
      And I click the loanTypes0 element
      And I click the loanTypes1 element
      And I enter <debtAmount> in debtAmountText textfield
      And I select Default from the loanStatusDropdown
    Then The loanAdvisingSubmitButton element is enabled
      And I click the loanAdvisingSubmitButton element
    Then The yourAddressHeaderText is visible
    When I select the radio dial with Use Work Address text from the addressRadioGroup group
      And I select the radio dial with Use Work Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the loanAdvisingSubmitButton element
    Then The previousMonthBtn is visible
      And The nextMonthBtn is visible
    When I click first available day with available time
      And The firstAvailableTime is visible
      And I click the firstAvailableTime element
      And I click the loanAdvisingSubmitButton element
    #Following steps are commented out because of ED-20070
    #Then The relevantDocumentHeader is visible
      And I click the loanAdvisingSubmitButton element
    Then I should be on the Advising page
      And I report test passing test status
    Examples:
      | client     | username | password |  debtAmount | stgTestCaseId | uatTestCaseId | prodTestCaseId |
      | lr5tu5demo | atest1   | Welcome1 |  12345.00   | 112356        | 122192        | 126602         |

  @SmokeTest
  Scenario Outline: Create an Advising Appointment for Financial Wellness Coaching with a document (C73436)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Advising page
      And The loanScheduleAdvisingButton element is enabled
    When I click the loanScheduleAdvisingButton element
    Then The loanTypes0 element is enabled
      And The loanTypes1 element is enabled
    When I click the loanTypes0 element
      And I click the loanTypes1 element
      And I enter <debtAmount> in debtAmountText textfield
      And I select Default from the loanStatusDropdown
    Then The loanAdvisingSubmitButton element is enabled
      And I click the loanAdvisingSubmitButton element
    Then The yourAddressHeaderText is visible
    When I select the radio dial with Use Work Address text from the addressRadioGroup group
      And I select the radio dial with Use Work Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the loanAdvisingSubmitButton element
    Then The previousMonthBtn element is enabled
      And The nextMonthBtn element is enabled
    When I click first available day with available time
      And I click the loanAdvisingSubmitButton element
    #Following steps are commented out because of ED-20070
    Then The relevantDocumentHeader is not visible
      #And I upload <fileName> file using the sharedFileUpload component
      #And I enter <text> in commentsTextArea textfield
      #And Text in uploadDocSuccessMessage field is present
      And I click the scheduleApptSubmitBtn element
      And I click the modalCloseBtn element
    Then I should be on the advising page
      And I report test passing test status
    Examples:
      | client  | username  | password |  debtAmount | stgTestCaseId | uatTestCaseId | prodTestCaseId |
      | eg5demo | ATest1230 | Welcome1 |  12345.00   | 73577         | 144371        | 144370         |

  @RegressionTest
  Scenario Outline: LR5 Update appointment time and cancel appointment from PPT site (C60836)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to <home> page
      And I click the educationCoachingNav in the Header component
    Then I should be on the Advising page
      And The loanScheduleAdvisingButton element is enabled
    When I click the loanScheduleAdvisingButton element
    Then The loanTypes0 element is enabled
      And The loanTypes1 element is enabled
    When I click the loanTypes0 element
      And I click the loanTypes1 element
      And I enter <debtAmount> in debtAmountText textfield
      And I select Default from the loanStatusDropdown
    Then The loanAdvisingSubmitButton element is enabled
      And I click the loanAdvisingSubmitButton element
    Then The yourAddressHeaderText is visible
    When I select the radio dial with Use Work Address text from the addressRadioGroup group
      And I select the radio dial with Use Work Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Work Email text from the emailRadioGroup group
      And I click the loanAdvisingSubmitButton element
    Then The previousMonthBtn element is enabled
      And The nextMonthBtn element is enabled
    When I click first available day with available time
      And The firstAvailableTime is visible
      And I click the firstAvailableTime element
      And I click the loanAdvisingSubmitButton element
      And I click the scheduleApptSubmitBtn element
      And I click the modalCloseBtn element
      And I refresh the page
    Then I should be on the advising page
    When I scroll to advisingAptSeeMoreBtn element
      And I click the advisingAptSeeMoreBtn element
      And I click the advisingAptUpdateBtn element
    Then The previousMonthBtn element is enabled
      And The nextMonthBtn element is enabled
    When I click first available day with available time
      And The firstAvailableTime is visible
    Then I click the firstAvailableTime element
      And I click the loanAdvisingSubmitButton element
      And I click the scheduleApptSubmitBtn element
      And I click the modalCloseBtn element
      And I refresh the page
    Then I should be on the advising page
    When I scroll to advisingAptSeeMoreBtn element
      And I click the advisingAptSeeMoreBtn element
      And I click the advisingAptCancelBtn element
    When I click the advisingAptCancelModalYesBtn element
      And I wait until the advisingAptCancelModalYesBtn is not visible
    Then I should be on the Advising page
      And The advisingAptStatusText is visible
    Then I should see CANCELLED text in advisingAptStatusText field
      And I report test passing test status
    Examples:
      | client     | username | password |  debtAmount | home       | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 |  12345.00   | dashboard  | 112343     |

  @RegressionTest
  Scenario Outline: LR5 Verify a user can create and submit a message to an expert (C45960)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
      And I click the educationCoachingNav in the Header component
    Then I should be on the Advising page
      And The loanScheduleAdvisingButton is visible
    When I click the messageExpertBtn element
      And I enter TEST in commentsTextArea textfield
      And I upload TestFile.pdf file using the sharedFileUpload component
      And The cancelBtn is visible
      And I click the submitMessageBtn element
    Then I should be on the Advising page
      And I validate the color of the messageExpertSucess using CssProperty:background-color should be rgba(21, 133, 100, 1)
      And I should see Your message has been successfully submitted! An expert will respond soon. text in successMessage field
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | 112341     |

  @RegressionTest
  Scenario Outline: LR5 Verify More Calculators section links (C94549)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
      And I click the educationCoachingNav in the Header component
    Then I should be on the Advising page
      And The advisingCalculatorHeading is visible
      And The exact text in advisingCalculatorHeading should be More Calculators
    When I click the link with text US Department of Ed
    Then The modalContinueButton is visible
      And I click the modalContinueButton element
      And I switch to second tab
    Then The url should be https://studentaid.gov/
      And I change focus to tab 0
    When I click the link with text Bankrate
    Then The modalContinueButton is visible
      And I click the modalContinueButton element
      And I switch to second tab
    Then The url should be https://www.bankrate.com/calculators/college-planning/loan-calculator.aspx
      And I change focus to tab 0
    When I click the link with text The New York Times
    Then The modalContinueButton is visible
      And I click the modalContinueButton element
      And I switch to second tab
    Then The url should be https://www.nytimes.com/interactive/2017/your-money/student-loan-repayment-calculator.html
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | 112346     |

  @RegressionTest
  Scenario Outline: LR5 Verify Exit Message appears when leaving EdAssist Solutions Student Loan for third Party Hyperlinks (C116556)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
      And I scroll to preferredLenderTile element
      And I click the link with text Compare Lenders
    Then The modalTitle is visible
      And The exact text in modalTitle should be Opening Third-Party Website
      And The thirdPartySiteWarning is visible
      And The exact text in thirdPartySiteWarning should be <warningMessage>
      And The exact text in externalWebsiteText should be External Website
      And The exact text in externalWebsiteUrl should be https://www.magnifymoney.com/compare/student-loan-refi/
      And  The modalContinueButton is visible
    When I click the modalContinueButton element
      And I switch to second tab
    Then The url should be https://www.magnifymoney.com/compare/student-loan-refi/
    When I close the current tab
      And I change focus to tab 0
    Then I should be on the dashboard page
    When I refresh the page
      And I click the advisingTileLearnMore element
    Then I should be on the advising page
      And The lrpBrowseHelpfulContentButton element is enabled
    When I click the lrpBrowseHelpfulContentButton element
    Then I should be on the browseHelpfulContent page
    When I click the link with text The U.S. Department of Education’s Direct Loan Program
    Then The modalTitle is visible
      And The exact text in modalTitle should be Opening Third-Party Website
      And The exact text in thirdPartySiteWarning should be <warningMessage>
    When I click the modalContinueButton element
      And I switch to second tab
    Then The url should be https://studentaid.gov/understand-aid/types/loans
    When I close the current tab
      And I change focus to tab 0
    Then I should be on the browseHelpfulContent page
    When  I refresh the page
    Then I verify that href of link with text Federal Direct Consolidation Loan process should be https://studentloans.gov/
      And I verify that href of link with text Federal Loan Repayment Plans should be https://studentaid.ed.gov/sa/repay-loans/understand/plans
      And I verify that href of link with text National Student Loan Data System (NSLDS) should be https://nslds.ed.gov/nslds/nslds_SA/
      And I verify that href of link with text Federal Loan Servicers should be https://studentaid.ed.gov/sa/repay-loans/understand/servicers
    When I click the StudentLoan101 element
      And I click on Organizing Education Loan Information text in articleOneContainer container
    Then I verify that href of link with text https://studentloans.gov should be https://studentloans.gov/
      And I verify that href of link with text www.annualcreditreport.com should be http://www.annualcreditreport.com/
    When I click the link with text https://nslds.ed.gov/nslds/nslds_SA/
    Then The modalTitle is visible
      And The exact text in modalTitle should be Opening Third-Party Website
      And The exact text in thirdPartySiteWarning should be <warningMessage>
    When I click the modalContinueButton element
      And I switch to second tab
    Then The url should be https://studentaid.gov/
    When I close the current tab
      And I change focus to tab 0
    Then I should be on the browseHelpfulContent page
    When I refresh the page
      And I scroll to StudentLoanConsolidationAndRefinance element
    Then The StudentLoanConsolidationAndRefinance element is enabled
    When I click the StudentLoanConsolidationAndRefinance element
    Then I verify that href of link with text https://nslds.ed.gov/nslds/nslds_SA/ should be https://nslds.ed.gov/nslds/nslds_SA/
    When I click on Federal Loan Consolidation and Student Loan Refinance text in articleOneContainer container
    Then I verify that href of link with text https://studentloans.gov should be https://studentloans.gov/
    When I click the link with text https://studentaid.ed.gov/npas/index.htm
    Then The modalTitle is visible
      And The exact text in modalTitle should be Opening Third-Party Website
      And The exact text in thirdPartySiteWarning should be <warningMessage>
    When I click the modalContinueButton element
      And I switch to second tab
    Then The url should be https://studentaid.gov/
    When I close the current tab
      And I change focus to tab 0
    Then I should be on the browseHelpfulContent page
    When I refresh the page
      And I scroll to StudentLoanForgiveness element
      And I click the StudentLoanForgiveness element
      And I click on Student Loan Forgiveness Programs text in articleOneContainer container
    Then I verify that href of link with text https://bhw.hrsa.gov/loansscholarships/nursecorps/lrp should be https://bhw.hrsa.gov/loansscholarships/nursecorps/lrp
      And I verify that href of link with text https://studentaid.ed.gov/sa/repay-loans/forgiveness-cancellation/teacher should be https://studentaid.ed.gov/sa/repay-loans/forgiveness-cancellation/teacher
    When I click the link with text https://studentaid.ed.gov/sa/repay-loans/forgiveness-cancellation/public-service#receiving-forgiveness
    Then The modalTitle is visible
      And The exact text in modalTitle should be Opening Third-Party Website
      And The exact text in thirdPartySiteWarning should be <warningMessage>
    When I click the modalContinueButton element
      And  I switch to second tab
    Then The url should be https://studentaid.gov/manage-loans/forgiveness-cancellation/public-service#receiving-forgiveness
    When I close the current tab
      And I change focus to tab 0
    Then I should be on the browseHelpfulContent page
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId | warningMessage                                                                                                                                                                                         | 
      | lr5tu5demo | atest1   | Welcome1 | 120220     | By clicking "Continue", you are opening a third-party website in a new browser tab. Please note that Bright Horizons privacy policy and security practices are not applicable on third-party websites. |

  @RegressionTest
  Scenario Outline: LR5 Financial Wellness Coaching Advising/Expert Flags = NO (C73411)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanExpertGuidance to go to advising page
    Then I should be on the advising page
    When I click the loanScheduleAdvisingButton element
    Then The modalTitle is visible
      And The exact text in modalTitle should be You are currently not eligible.
    When I click the modalCloseBtn element
      And I refresh the page
      And I click the messageExpertBtn element
    Then The modalTitle is visible
      And The exact text in modalTitle should be You are currently not eligible.
    When I click the modalCloseBtn element
    Then I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | eg5tu5demo | ATest1141 | Welcome1 | 130812     |
