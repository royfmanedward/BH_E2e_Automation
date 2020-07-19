Feature: Add Loan

  @RegressionTest
  Scenario Outline: LR5 Step 1: Verify "I don't see my loan servicer" link is present and modal links to Support page (C45946)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to <home> page
      And I click newStudentLoanNow to go to AddLoanServicer page
    Then title should be <title>
      And The cancelBtn is visible
      And The iDontSeeMyLoanServicer is visible
      And The loanServicerBtn is visible
    When I click the iDontSeeMyLoanServicer element
    Then I click modalGoToSupportBtn to go to support page
      And I report test passing test status
    Examples:
      | client     | username | password | home      | title                        | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | dashboard | Add Loan Servicer - EdAssist | 112286     |

  @RegressionTest
  Scenario Outline: LR5 Verify Eligible Products for the Client & Verify selecting Loan Servicer without Yodlee throws error (C45944)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I verify number of eligibleProductList on the page should be 2
      And The exact text in tuitionProgramManagement should be Tuition Program Management
      And The exact text in studentLoanRepayment should be Student Loan Repayment
      And I click studentLoanRepayment to go to <home> page
      And I click newStudentLoanNow to go to AddLoanServicer page
    When I click the loanServicerBtn element
      And I enter <loanServicer> in loanServicerSearchInput textfield
      And I click the selectOption element
    Then The alertForNotLinkedServicer is visible
      And The exact text in alertForNotLinkedServicer should be PEAKS Loan is on our list of servicers, but we are not yet able to to link to them directly. We'll send you a note when we can, but in the meantime, you'll need to return each month to make payments.
      And The continueBtn is visible
    When I click the continueBtn element
    Then I should be on the AddLoanDetails page
    When I click the cancelLoanBtn element
      And I click the cancelLoanModalBtn element
    Then I should be on the dashboard page
      And I report test passing test status
    Examples:
      | client     | username | password | home      | loanServicer | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | dashboard | PEAKS Loan   | 112287     |

  @RegressionTest
  Scenario Outline: LR5 Select Loan Servicer with Yodlee, Verify invalid creds doesn't give user access & Unable to link servicer message (C60641)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to <home> page
      And I click newStudentLoanNow to go to AddLoanServicer page
      And I click the loanServicerBtn element
      And I enter <loanServicer> in loanServicerSearchInput textfield
      And I click the selectOption element
    Then The linkYourOnlineAccountBtn is visible
    When I click the linkYourOnlineAccountBtn element
    Then The closeYodleeWindowBtn element is enabled
    When I click the closeYodleeWindowBtn element
    Then I should be on the addLoanDetails page
      And The cancelLoanBtn is visible
    When I click the cancelLoanBtn element
    Then The cancelLoanModalBtn is visible
    When I click the cancelLoanModalBtn element
    Then I should be on the dashboard page
      And The newStudentLoanNow is visible
    When I click newStudentLoanNow to go to AddLoanServicer page
      And I click the loanServicerBtn element
      And I enter <anotherLoanServicer> in loanServicerSearchInput textfield
      And I click the selectOption element
    Then The linkYourOnlineAccountBtn is visible
    When I click the linkYourOnlineAccountBtn element
      And I switch to servicerWindow frame
    Then The servicerLoginInput is visible
      And The servicerPasswordInput is visible
    When I enter Username in servicerLoginInput textfield
      And I enter Password in servicerPasswordInput textfield
    Then The servicerLoginButton element is enabled
    When I click the servicerLoginButton element
    Then The servicerLoginErrorText is visible
      And The exact text in servicerLoginErrorText should be Your login information appears to be incorrect. Please re-enter your credentials. (Error 402)
    When I switch back to main frame
    Then The closeYodleeWindowBtn element is enabled
    When I click the closeYodleeWindowBtn element
    Then I should be on the AddLoanServicer page
      And I should see <errorMsg> text in errorMsgText field
      And I report test passing test status
    Examples:
      | client     | username | password | home      | loanServicer         | anotherLoanServicer | testCaseId | errorMsg                                                                                                                                             |
      | lr5tu5demo | atest1   | Welcome1 | dashboard | Yodlee Test Servicer | Gate City Bank      | 112288     | We're sorry, we don't see an account linked with that servicer. Please try again, try connecting with another servicer, or enter your loan manually. |

  @RegressionTest
  Scenario Outline: LR5 User can create a new loan and upload documents (C45904)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to <home> page
    When I create a new loan and progress to the payments page: loanServicer = <loanServicer>, graduation date = <date>
      And I progress from payments to submission page: user = Auto Test1, upload = true
    Then I should be on the AddLoanConfirmation page
      And The exact text in submissionConfirmationStatus should be Your loan has been saved
    When I click the homeNav in the Header component
    Then I should be on the dashboard page
      And The newStudentLoanNow is visible
      And The new loan ID is deleted from the dashboard
      And I report test passing test status
    Examples:
      | client     | username | password | home      | loanServicer         | date       | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | dashboard | CEFCU                | 01/01/2040 | 117707     |

  @RegressionTest
  Scenario Outline: LR5 Verify loan calculator (C46058)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the advising page
      And The principleTextBox is visible
    When I fillout specified text fields with the following text
      #| Element         | Text to enter |
      | principleTextBox | 1000          |
      | extraTextBox     | 100           |
      | interestTextBox  | 10            |
      | termTextBox      | 10            |
      And I click the calculateLoanInfo element
      And The originalPmtTotal is visible
    Then I verify the text below is present on the page
      #| Element            | Text to verify |
      | monthlyPayment      | $13.22         |
      | termInYears         | 10             |
      | payExtraAmtPerMonth | $113.22        |
      | extraTermInMonths   | 9              |
      | extraTermTotal      | $1,043.04      |
      | originalPmtTotal    | $1,585.81      |
      And I report test passing test status
    Examples:
      | client  | username  | password | testCaseId |
      | eg5demo | ATest2230 | Welcome1 | 112298     |

  @RegressionTest
  Scenario Outline: LR5 Create a payment request (C62832)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
    When I click the activeLoansActionButton element
      And I click the requestPaymentBtn element
    Then The paymentRequestContinue is visible
      And The newPaymentReqDollarAmount is visible
      And The paymentRequestContinue element is disabled
      And I enter 1 in newPaymentReqDollarAmount textfield
      And I enter Test Comments for Payment Request in comments textfield
      And I click the paymentRequestContinue element
      And I wait until the newPaymentReqDollarAmount is not visible
    Then I should be on the dashboard page
      And The paymentSubmitMsgText is visible
      And I should see <submissionMessage> text in paymentSubmitMsgText field
    When I refresh the page
    Then The paymentRequestActiveFirstAppLink is visible
      And I click the paymentRequestActiveFirstAppLink element
    Then I should be on the AddLoanSubmittedPayment page
      And I report test passing test status
    Examples:
      | client     | username | password | submissionMessage                | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | Your request has been submitted. | 112310     |

  @RegressionTest
  Scenario Outline: LR5 User can upload multiple documents (C137408)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to <home> page
      And I create a new loan and progress to the payments page: loanServicer = <loanServicer>, graduation date = <date>
    Then I should be on the AddLoanPayments page
      And The loanType1Option is visible
      And I upload TestFile.pdf file using the sharedFileUpload component
      And I select Proof of Graduation/Completion from the documentTypeDropdown
      And I enter Test:Uploaded correction documents. in commentText textfield
      And I click the submitDocumentButton element
      And The selectFileLink is visible
      And The loanType1Option is visible
    When I click on loanType1Option using jsExecutor
      And I upload TestFile2.pdf file using the sharedFileUpload component
      And I select Proof of Loan/Proof of Loan Payment from the documentTypeDropdown
      And I enter Test:Uploaded Proof of Loan document. in commentText textfield
      And I click the submitDocumentButton element
      And The secondSupportingDocument is visible
      And The firstSupportingDocument is visible
    Then The exact text in firstSupportingDocument should be Proof of Loan/Proof of Loan Payment
      And The exact text in secondSupportingDocument should be Proof of Graduation/Completion
    When I click step3ContinueBtn to go to AddLoanAgreements page
      And I click the participantAgreementCheckbox element
    Then The agreementSignInstructions is visible
    When I enter Auto Test1 in signatureBox textfield
      And I click the step4ContinueBtn element
    Then I should be on the AddLoanConfirmation page
      And The exact text in submissionConfirmationDescription should be This loan will be saved in the Other Loans section of the home page. You can activate payments towards this loan at anytime that a payment request is not processing.
    When I click the homeNav in the Header component
    Then I should be on the dashboard page
      And The new loan ID is deleted from the dashboard
      And I report test passing test status
    Examples:
      | client     | username | password | home      | loanServicer         | date       | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | dashboard | Yodlee Test Servicer | 01/01/2040 | 112301     |

  @RegressionTest
  Scenario Outline: LR5 Verify "Estimated Savings" calculator widget (C73619)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
    Then I should be on the dashboard page
    When I clear the principleTextBox field
    Then I clear the extraTextBox field
      And I clear the interestTextBox field
      And I clear the termTextBox field
    When I fillout specified text fields with the following text
      #| Element         | Text to enter |
      | principleTextBox | 100000        |
      | extraTextBox     | 200           |
      | interestTextBox  | 2.5           |
      | termTextBox      | 30            |
      And I click the calculateLoanInfo element
    Then I verify the text below is present on the page
      #| Element                     | Text to verify |
      | amortizationCalcPrinciple    | $41,408        |
      | amortizationCalcInterest     | $19,028        |
      | amortizationCalcTotalSavings | $60,437        |
      | amortizationCalcDiffInYears  | 12             |
      | amortizationCalcDiffInMonths | 9              |
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | 112302     |

  @RegressionTest
  Scenario Outline: LR5 Verify "Estimated Savings" calculator calculated fields do not appear user has no loans (C73626)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
    Then I should be on the dashboard page
      And The amortizationCalcPrinciple is not visible
      And The amortizationCalcInterest is not visible
      And The amortizationCalcTotalSavings is not visible
      And The amortizationCalcDiffInYears is not visible
      And The amortizationCalcDiffInMonths is not visible
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | lr5tu5demo | atest11   | Welcome1 | 112305     |

  @RegressionTest
  Scenario Outline: LR5 Verify that cancelling a loan deletes it (C65638)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to <home> page
      And I create a new loan and progress to the payments page: loanServicer = <loanServicer>, graduation date = <date>
    Then I should be on the AddLoanPayments page
      And The loanType1Option is visible
    When I click the loanType1Option element
      And I upload TestFile.pdf file using the sharedFileUpload component
      And I select Proof of Loan/Proof of Loan Payment from the documentTypeDropdown
      And I enter Test:Uploaded proof of loan document. in commentText textfield
      And I click the submitDocumentButton element
    Then The exact text in firstSupportingDocument should be Proof of Loan/Proof of Loan Payment
    When I click step3ContinueBtn to go to AddLoanAgreements page
      And I click the participantAgreementCheckbox element
      And I enter Auto Test1 in signatureBox textfield
      And I click the lrpStep4CancelButton element
      And I click the lrpStep4CancelLoanModal element
    Then I should be on the dashboard page
      And The current loan loanNumber is not present on the page
      And I report test passing test status
    Examples:
      | client     | username | password | home      | loanServicer         | date       | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | dashboard | Yodlee Test Servicer | 01/01/2040 | 112304     |

  @RegressionTest
  Scenario Outline: LR5 Verify a user can view previously submitted comments and agreement date appears (C45965)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to <home> page
    Then I should be on the dashboard page
      And The paymentRequestContainer is visible
    When I click the paymentRequestViewMore element
      And I click the paymentRequestFirstAppLink element
    Then I should be on the AddLoanSubmittedPayment page
      And I click the deleteCommentButtonIcon element
      And I wait until the deleteCommentButtonIcon is not visible
      And I click the addNewCommentBtnPaymentRequest element
      And The addNewCommentPayReqTextField element is enabled
    When I enter Test 123 #$& in addNewCommentPayReqTextField textfield
      And I click the saveCommentPayReqButton element
      And The deleteCommentButtonIcon element is enabled
    Then I should see Test 123 #$& text in commentBoxTextPayRequest field
      And Text in agreementsSignedDate field is present
      And I report test passing test status
    Examples:
      | client     | username | password | home      | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | dashboard | 112303     |

  @RegressionTest
  Scenario Outline: LR5 Student loan interest rate should show 2 decimal places with % symbol and verify pagination for other student loan section(C96990)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I click studentLoanRepayment to go to dashboard page
      And The newStudentLoanNow element is enabled
    When I click newStudentLoanNow to go to AddLoanServicer page
      And I click the loanServicerBtn element
      And I enter <loanServicer> in loanServicerSearchInput textfield
      And I click the selectOption element
      And I click the continueBtn element
    Then I should be on the addLoanDetails page
    When I enter 5000 in loanBalance textfield
      And I enter 100 in monthlyPayment textfield
      And I enter random number in accountNumber field
      And The percentSign is visible
      And I enter 4.5667 in interestRate textfield
      And I click the monthlyPayment element
      And The exact text in interestRate field should be 4.567
      And I clear the interestRate field
      And I enter 555555 in interestRate textfield
      And I click the monthlyPayment element
      And The exact text in interestRate field should be 99.999
      And I clear the interestRate field
      And I enter 45.55 in interestRate textfield
      And I click the addEdProviderButton element
      And I enter Seattle in edProviderCity textfield
      And The edProviderStateBtn element is enabled
      And I select WA from the edProviderStateBtn
      And I click the edProviderSearchBtn element
      And The edProviderSearchTable is visible
      And I click the first selection in the education providers search results table edProviderSearchTable
      And I enter <date> in minimumMonthlyDueDate textfield
      And I select Associate's Degree from the edProgram
      And I enter <date> in edGradDate textfield
      And I select English from the edFieldOfStudy
      And I click on edProviderContinueBtn using jsExecutor
    Then I should be on the AddLoanPayments page
      And The loanType1Option is visible
    When I click the loanType1Option element
      And I upload TestFile.pdf file using the sharedFileUpload component
      And I select Proof of Loan/Proof of Loan Payment from the documentTypeDropdown
      And I enter Test:Uploaded proof of loan document. in commentText textfield
      And I click the submitDocumentButton element
    Then The exact text in firstSupportingDocument should be Proof of Loan/Proof of Loan Payment
    When I click step3ContinueBtn to go to AddLoanAgreements page
      And I click the participantAgreementCheckbox element
      And I enter Auto Test1 in signatureBox textfield
    Then I click step4ContinueBtn to go to AddLoanConfirmation page
    When I click the homeNav in the Header component
    Then I should be on the dashboard page
      And I verify current loan is displayed on top of other inactive loans loanNumber
    When I click Edit in actionMenu of new inactive loan
    Then I should be on the AddLoanSummary page
      And The interestRate is visible
      And The percentSign is visible
      And The exact text in interestRate field should be 45.55
    When I click the homeNav in the Header component
    Then I should be on the dashboard page
    When The pagination is visible
      And I verify I am on the page 1 of pagination
    Then I verify number of loanCard on the page should be 5
    When I click the link with text ›
    Then I verify I am on the page 2 of pagination
      And I verify number of loanCard on the page should be 5
    When I click the link with text ‹
    Then I verify I am on the page 1 of pagination
      And I verify number of loanCard on the page should be 5
      And I report test passing test status
    Examples:
      | client     | username  | password | loanServicer                                  | date       | testCaseId |
      | lr5tu5demo | atest1    | Welcome1 | Alaska Commission on Post-Secondary Education | 01/01/2040 | 112306     |

  @RegressionTest
  Scenario Outline: LR5 Start paying This Loan' button activates inactive loan (C100166)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I click studentLoanRepayment to go to dashboard page
    When I create a new loan and progress to the payments page: loanServicer = <loanServicer>, graduation date = <date>
      And I progress from payments to submission page: user = Auto Test13, upload = true
    Then I should be on the AddLoanConfirmation page
    When I click the paymentHistoryNav in the Header component
    Then I should be on the PaymentRequestHistory page
    When I click the inActiveLoanActionMenu element
    Then I verify inActiveLoanActionMenu contains Connect to Loan Servicer text
      And I verify inActiveLoanActionMenu contains Delete text
      And I verify inActiveLoanActionMenu contains Upload Documents text
      And I verify inActiveLoanActionMenu contains Start Paying This Loan text
    When  I click the startPayingLoanMenuBtn element
    Then The commentsTextArea is visible
      And I enter start paying in commentsTextArea textfield
      And I click the modalSubmitBtn element
      And I wait until the modalDialog is not visible
      And I click the homeNav in the Header component
    When The activeLoanActionButton element is enabled
      And I click the activeLoanActionButton element
      And The navigateLoanActionBtn element is enabled
      And I click the navigateLoanActionBtn element
    Then I should be on the AddLoanSummary page
      And The accountNumber is equal to current loan number
      And I report test passing test status
    Examples:
      | client     | username | password | loanServicer   | date       | testCaseId |
      | lr5tu5demo | atest13  | Welcome1 | Gate City Bank | 01/01/2040 | 112307     |

  @RegressionTest
  Scenario Outline: LR5 Editing loan type and Loan Payment address radio buttons is remembered and docs can be uploaded in loan summary (C106162)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to <home> page
    Then I should be on the Dashboard page
    When I click newStudentLoanNow to go to AddLoanServicer page
      And The loanServicerBtn element is enabled
      And I click the loanServicerBtn element
      And I enter <loanServicer> in loanServicerSearchInput textfield
      And I click the selectOption element
      And The enterInfoManually element is enabled
      And I click the enterInfoManually element
    Then I should be on the addLoanDetails page
    When I enter 500 in loanBalance textfield
      And I enter 2 in monthlyPayment textfield
      And I enter random number in accountNumber field
      And I enter 5 in interestRate textfield
      And I enter <date> in minimumMonthlyDueDate textfield
      And I click the addEdProviderButton element
      And I enter Seattle in edProviderCity textfield
      And I select WA from the edProviderStateBtn
      And I click the edProviderSearchBtn element
      And The edProviderSearchTable is visible
      And I click the first selection in the education providers search results table edProviderSearchTable
      And I enter <date> in edGradDate textfield
      And I select Associate's Degree from the edProgram
      And I select English from the edFieldOfStudy
      And I click the edProviderContinueBtn element
    Then I should be on the AddLoanPayments page
      And The loanType1Option element is enabled
    When I click the loanType1Option element
      And I upload TestFile.pdf file using the sharedFileUpload component
      And I select Proof of Loan/Proof of Loan Payment from the documentTypeDropdown
      And I click the submitDocumentButton element
    Then The exact text in firstSupportingDocument should be Proof of Loan/Proof of Loan Payment
      And I click the paymentActive1Label element
      And I enter 2 in paymentAmountBox textfield
    When I click step3ContinueBtn to go to AddLoanAgreements page
      And I click the participantAgreementCheckbox element
      And I enter Auto Test6 in signatureBox textfield
      And I click step4ContinueBtn to go to AddLoanConfirmation page
      And I click the homeNav in the Header component
    Then I should be on the dashboard page
    When I click the activeLoansActionButton element
      And The editLoanButton element is enabled
      And I click the editLoanButton element
    Then I should be on the AddLoanSummary page
      And The loanTypeLabelOne is visible
    When I upload TestFile.pdf file using the sharedFileUpload component
      And I select Proof of Graduation/Completion from the loanSummaryDocumentTypeDropDown
      And I click the loanSummarySubmitDocumentButton element
    Then The exact text in loanSummarySecondSupportingDocument should be Proof of Graduation/Completion
    When I click the loanTypeLabel3 element
      And I click the otherLoanPaymentAddress element
      And I click the loanSummarySubmitButton element
    Then I should be on the dashboard page
    When I click the activeLoansActionButton element
    Then The editLoanButton element is enabled
    When I click the editLoanButton element
    Then I should be on the AddLoanSummary page
      And The loanType3Radio element is enabled
      And The radio dial with Private Student Loan text from the loanType group is selected
      And The otherLoanPaymentAddress element is enabled
      And The radio dial with The Payment Address for my loan servicer is different from what is shown here. text from the loanPaymentAddressType group is selected
    When I click the loanSummarySubmitButton element
    Then I should be on the dashboard page
    When I click the paymentRequestActiveFirstAppLink element
    Then I should be on the AddLoanSubmittedPayment page
      And The submittedPaymentStopPaymentBtn element is enabled
    When I click the submittedPaymentStopPaymentBtn element
      And I enter Test in reasonForStoppingTextField textfield
      And I click the cancelPaymentConfirmButton element
    Then I should be on the dashboard page
    When I click the activeLoansActionButton element
      And I click the deleteButton element
    Then The lrpDeleteLoanModalConfirmButton element is enabled
    When I click the lrpDeleteLoanModalConfirmButton element
    Then The lrpBannerAddloanButton element is enabled
      And I report test passing test status
    Examples:
      | client     | username | password | home      | loanServicer | date       | testCaseId |
      | lr5tu5demo | Atest6   | Welcome1 | dashboard | Navient      | 01/01/2040 | 115985     |

  @RegressionTest
  Scenario Outline: LR5 Verify that Continue button should throw validation Errors before entering any details in Loan details page (C45909)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I click studentLoanRepayment to go to dashboard page
      And The newStudentLoanNow element is enabled
    When I click newStudentLoanNow to go to AddLoanServicer page
      And The loanServicerBtn element is enabled
      And I click the loanServicerBtn element
      And I enter <loanServicer> in loanServicerSearchInput textfield
      And I click the selectOption element
      And The enterInfoManually element is enabled
      And I click the enterInfoManually element
    Then I should be on the addLoanDetails page
      And The edProviderContinueBtn element is disabled
    When I enter 500 in loanBalance textfield
    Then The edProviderContinueBtn element is disabled
    When I enter 2 in monthlyPayment textfield
    Then The edProviderContinueBtn element is disabled
    Then The edProviderContinueBtn element is disabled
    When I enter random number in accountNumber field
    Then The edProviderContinueBtn element is disabled
    When I enter 5 in interestRate textfield
    Then The edProviderContinueBtn element is disabled
    When I enter <date> in minimumMonthlyDueDate textfield
    Then The edProviderContinueBtn element is disabled
    When I click the addEdProviderButton element
      And I enter Seattle in edProviderCity textfield
      And I select WA from the edProviderStateBtn
    When I click the edProviderSearchBtn element
      And The edProviderSearchTable is visible
      And I click the first selection in the education providers search results table edProviderSearchTable
    Then The edProviderContinueBtn element is disabled
    When I enter <date> in edGradDate textfield
      And I select Associate's Degree from the edProgram
    Then The edProviderContinueBtn element is disabled
    When I select English from the edFieldOfStudy
    Then The edProviderContinueBtn element is enabled
    When I click the edProviderContinueBtn element
    Then I should be on the AddLoanPayments page
      And I report test passing test status
    Examples:
      | client     | username | password | loanServicer | date       | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | Navient      | 01/01/2040 | 114288     |

  @SmokeTest
  Scenario Outline: LR5 Create a Non-integrated loan and a payment request-loan and Verify "One-Time" payment option  (C69059)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
    Then I should be on the Dashboard page
      And I scroll to newStudentLoanNow element
    When I click newStudentLoanNow to go to AddLoanServicer page
      And The loanServicerBtn element is enabled
      And I click the loanServicerBtn element
      And I enter <loanServicer> in loanServicerSearchInput textfield
      And I click the selectOption element
      And The enterInfoManually element is enabled
      And I click the enterInfoManually element
    Then I should be on the addLoanDetails page
    When I enter 500 in loanBalance textfield
      And I enter 2 in monthlyPayment textfield
      And I enter random number in accountNumber field
      And I enter 5 in interestRate textfield
      And I enter <date> in minimumMonthlyDueDate textfield
      And I click the addEdProviderButton element
      And I enter Seattle in edProviderCity textfield
      And I select WA from the edProviderStateBtn
      And I click the edProviderSearchBtn element
      And The edProviderSearchTable is visible
      And I click the first selection in the education providers search results table edProviderSearchTable
      And I enter <date> in edGradDate textfield
      And I select Associate's Degree from the edProgram
      And I select English from the edFieldOfStudy
      And The edProviderContinueBtn element is enabled
      And I click the edProviderContinueBtn element
    Then I should be on the AddLoanPayments page
      And The paymentActive1Label element is enabled
      And I click the paymentActive1Label element
      And The paymentFrequencyBtn is not visible
      And I scroll to loanType1Option element
    When I click the loanType1Option element
      And I upload TestFile.pdf file using the sharedFileUpload component
      And I select Proof of Loan/Proof of Loan Payment from the documentTypeDropdown
      And I click the submitDocumentButton element
    Then The exact text in firstSupportingDocument should be Proof of Loan/Proof of Loan Payment
      And I click the paymentActive1Label element
      And I enter 2 in paymentAmountBox textfield
    When I click step3ContinueBtn to go to AddLoanAgreements page
      And I click the participantAgreementCheckbox element
      And I enter Auto Test6 in signatureBox textfield
      And I click step4ContinueBtn to go to AddLoanConfirmation page
      And I click the homeNav in the Header component
    Then I should be on the dashboard page
      And I should see One Time text in activeLoanCardLoanFrequency field
    When I click the paymentRequestActiveFirstAppLink element
    Then I should be on the AddLoanSubmittedPayment page
      And The submittedPaymentStopPaymentBtn element is enabled
    When I click the submittedPaymentStopPaymentBtn element
      And I enter Test in reasonForStoppingTextField textfield
      And I click the cancelPaymentConfirmButton element
    Then I should be on the dashboard page
    When I click the activeLoansActionButton element
      And I click on deleteButton using jsExecutor
    Then The lrpDeleteLoanModalConfirmButton element is enabled
    When I click the lrpDeleteLoanModalConfirmButton element
    Then The lrpBannerAddloanButton element is enabled
      And I report test passing test status
    Examples:
      | client     | username | password | loanServicer | date       | stgTestCaseId | uatTestCaseId |  prodTestCaseId |
      | lr5tu5demo | Atest6   | Welcome1 | CEFCU        | 01/01/2040 |  146688       | 146689        |  146690         |

  @RegressionTest
  Scenario Outline: LR5 Verify payment request modal has all documents bound to component (C73375)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
    Then I should be on the Dashboard page
    When I click the activeLoansActionButton element
      And I click the requestPaymentBtn element
    Then I should see Proof of Loan/Proof of Loan Payment text in firstSupportingDocumentLR5PR field
      And I should see Proof of Graduation/Completion text in secondSupportingDocumentLR5PR field
      And The thirdSupportingDocumentLR5PR is not visible
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | 124323     |

  @RegressionTest
  Scenario Outline: LR5 Other Student Loans Should Pull in Actual Status (C106161)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
    Then I should be on the Dashboard page
    When The newStudentLoanNow is visible
    Then I verify number of grayTileNotSubmitted on the page should be 1
      And I verify number of greenTileInactive on the page should be 1
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest8   | Welcome1 | 128871     |

  @RegressionTest
  Scenario Outline: LR5 Verify that the account number must be unique before a user can continue to the Payments Page (C45910)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
    Then The newStudentLoanNow element is enabled
    When I click newStudentLoanNow to go to AddLoanServicer page
      And I click the loanServicerBtn element
      And I enter 3 Rivers in loanServicerSearchInput textfield
      And I click the selectOption element
    Then The enterInfoManually element is enabled
    When I click the enterInfoManually element
    Then I should be on the addLoanDetails page
    When I enter 5000 in loanBalance textfield
      And I enter 100 in monthlyPayment textfield
      And I enter 123 in accountNumber textfield
    Then The percentSign is visible
    When I enter 5 in interestRate textfield
      And I click the monthlyPayment element
      And I click the addEdProviderButton element
      And I enter Seattle in edProviderCity textfield
    Then The edProviderStateBtn element is enabled
    When I select WA from the edProviderStateBtn
      And I click the edProviderSearchBtn element
    Then The edProviderSearchTable is visible
    When I click the first selection in the education providers search results table edProviderSearchTable
      And I enter 01/01/2040 in edGradDate textfield
      And I enter 01/01/2040 in minimumMonthlyDueDate textfield
      And I select Associate's Degree from the edProgram
      And I select English from the edFieldOfStudy
      And I click the edProviderContinueBtn element
    Then I should see Already a loan with same Account number exists text in errorMessage field
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | 130573     |

  @RegressionTest
  Scenario Outline: Verify LR5 Account Numbers are Masked (C142592)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
      And I create a new loan and progress to the payments page: loanServicer = 3 Rivers, graduation date = 01/01/2040
      And I progress from payments to submission page: user = Auto Test1, upload = true
    Then I should be on the AddLoanConfirmation page
    When I click the homeNav in the header component
    Then I should be on the dashboard page
      And The firstLoanNumber is visible
      And I should see masked text in firstLoanNumber field
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | 117510     |

    @RegressionTest
  Scenario Outline: LR5 Verify header navigation icons (C137394)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I click studentLoanRepayment to go to dashboard page
    When I click the supportNav in the header component
    Then The supportLink in the header component is visible
      And The liveChatLink in the header component is visible
      And The liveChatLink in the header component is enabled
    When I click the viewMessages in the header component
    Then The messageContent in the header component is visible
    When I click the productSelectionIcon in the header component
    Then The tuitionProductSelection in the header component is visible
      And The loanProductSelection in the header component is disabled
    When I click the iconProfile in the header component
    Then The profileNav in the header component is visible
      And The logoutNav in the header component is visible
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | 133546     |
