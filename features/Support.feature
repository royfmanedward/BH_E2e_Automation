Feature: Support Ticket and Live Chat

  @SmokeTest
  Scenario Outline: TU5 Submit support ticket with document (C55973)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click tuitionProgramManagement to go to <home> page
    When I navigate to Support web page
    Then I should be on the Support page
      And The createSupportTicketBtn element is enabled
    When I click the createSupportTicketBtn element
      And I enter text in commentsTextArea textfield
      And I select School Question from the topicDropdown
      And The subTopicDropdown is visible
      And I select I can't find my school from the subTopicDropdown
      And I upload TestFile.pdf file using the sharedFileUpload component
      And I click the submitSupportTicketBtn element
    Then Text in successMessage field is present
      And I report test passing test status
    Examples:
      | client      | username  | password  | home   | stgTestCaseId | uatTestCaseId |  prodTestCaseId  |
      | lr5tu5demo  | atest1    | Welcome1  | home   | 73574         | 122189        |  126599          |

  @SmokeTest
  Scenario Outline: LR5 Create a support ticket with document (C45919)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
      And The supportNav in the Header component is visible
    When I click the supportNav in the Header component
      And I click the supportButton in the ChatSupport component
    Then I should be on the Support page
      And The createSupportTicketBtn is visible
    When I click the createSupportTicketBtn element
      And The commentsTextArea is visible
    When I enter text in commentsTextArea textfield
      And I select How to obtain my Loan Documentation from the subTopicDropdown
      And I upload TestFile.pdf file using the sharedFileUpload component
      And I click the submitSupportTicketBtn element
    Then Text in successMessage field is present
      And I report test passing test status
    Examples:
      | client      | username  | password  | stgTestCaseId | uatTestCaseId | prodTestCaseId  |
      | lr5tu5demo  | atest1    | Welcome1  | 73571         | 122188        | 126598          |

  @RegressionTest
  Scenario Outline: LR5 Verify a user can not submit ticket with invalid file (C156005)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
    Then The supportNav in the Header component is visible
    When I click the supportNav in the Header component
      And I click the supportButton in the ChatSupport component
    Then I should be on the Support page
      And The createSupportTicketBtn is visible
    When I click the createSupportTicketBtn element
    Then The commentsTextArea is visible
    When I select How to obtain my Loan Documentation from the subTopicDropdown
      And I upload InvalidPTMFileType file using the sharedFileUpload component
    Then I should see Invalid File Type text in errorTypeInvalidMsg field
      And The submitSupportTicketBtn element is disabled
    When I enter text in commentsTextArea textfield
      And I click the submitSupportTicketBtn element
    Then The successMessage is visible
      And I wait until the submitSupportTicketBtn is not visible
    When I click the firstViewMore element
    Then The docAttachmentSection is not visible
      And I report test passing test status
    Examples:
      | client      | username  | password  | stgTestCaseId |
      | lr5tu5demo  | atest1    | Welcome1  | 122831        |

  @RegressionTest
  Scenario Outline: TU5 Submit support ticket without document (C137411)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click tuitionProgramManagement to go to <home> page
      And I click the supportNav in the Header component
      And I click the supportButton in the ChatSupport component
    Then I should be on the Support page
    When I click the createSupportTicketBtn element
      And I enter <text> in commentsTextArea textfield
      And I select Site Questions from the topicDropdown
      And I select How to create application from the subTopicDropdown
      And I click the submitSupportTicketBtn element
    Then Text in successMessage field is present
      And I report test passing test status
    Examples:
      | client     | username   | password  | home  | text        | testCaseId |
      | lr5tu5demo | atest2     | Welcome1  | home  | Test Help   | 112392     |

  @RegressionTest
  Scenario Outline: LR5 Submit support ticket without a document (C45920)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to <home> page
      And The supportNav in the Header component is visible
    When I click the supportNav in the Header component
      And I click the supportButton in the ChatSupport component
    Then I should be on the Support page
    When I click the createSupportTicketBtn element
      And I enter <text> in commentsTextArea textfield
      And I select Other Policy Related Questions from the subTopicDropdown
      And I click the submitSupportTicketBtn element
    Then Text in successMessage field is present
      And I report test passing test status
    Examples:
      | client      | username   | password  | home       | text        | testCaseId |
      | lr5tu5demo  | atest1     | Welcome1  | dashboard  | Test Help   | 112292     |

  @LocalTest
    # NOTE: As Live chat hours are limited, we mark it as Local Test
  Scenario Outline: Verify Live Chat functionality for Tuition & Loan Products (C62678)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click tuitionProgramManagement to go to home page
      And I click the supportNav in the Header component
      And I click the supportButton in the ChatSupport component
    Then I should be on the Support page
      And The exact text in supportTicketsHeaderText should be Need Further Assistance?
    When I click the createSupportTicketBtn element
    Then The topicDropdown is visible
      And The commentsTextArea is visible
      And The uploadAppDocsInput is visible
      And The submitSupportTicketBtn element is disabled
    When I click the supportTicketCancelBtn element
    Then I should be on the Support page
    When I click on liveChatSuppPageButton using jsExecutor
    Then The liveChatTop is visible
    When I enter Atest1 in liveChatNameField textfield
      And I enter Automated TEST1: disregard in liveChatIDNum textfield
      And I select Other from liveChatTopic dropdown
      And I click the LiveChatSubmitButton element
    Then I should see Thank you for choosing to chat with us. An agent will be with you shortly. text in LiveChatSubmitInto field
    When I click the liveChatClose element
    Then The liveChatTop is not visible
    When I click the productSelectionIcon in the Header component
      And I click the loanProductSelection in the Header component
    Then I should be on the dashboard page
    When I click the supportNav in the Header component
      And I click the supportButton in the ChatSupport component
    Then I should be on the Support page
      And The exact text in supportTicketsHeaderText should be Need Further Assistance?
    When I click the createSupportTicketBtn element
    Then The subTopicDropdown is visible
      And The commentsTextArea is visible
      And The uploadAppDocsInput is visible
      And The submitSupportTicketBtn element is disabled
    When I click the supportTicketCancelBtn element
    Then I should be on the Support page
    When I click on liveChatSuppPageButton using jsExecutor
      And I enter Atest1 in liveChatNameField textfield
      And I enter Automated TEST2: disregard in liveChatIDNum textfield
      And I select Other from liveChatTopic dropdown
      And I click the LiveChatSubmitButton element
    Then I should see Thank you for choosing to chat with us. An agent will be with you shortly. text in LiveChatSubmitInto field
    When I click the liveChatClose element
    Then The liveChatTop is not visible
      And I report test passing test status
    Examples:
      | client      | username  | password  | testCaseId |
      | lr5tu5demo  | atest1    | Welcome1  | 112293     |

  @RegressionTest
  Scenario Outline: TU5 Verify LivePerson does not display when it is disabled  (C34349)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The supportNav in the Header component is visible
    #Support Page
    When I click the supportNav in the Header component
    Then I should be on the Support page
      And The supportLiveChatButton in the ChatSupport component is not visible
    #Home Page
    When I click the homeNav in the Header component
    Then I should be on the Home page
      And The supportLiveChatButton in the ChatSupport component is not visible
    #New App flow
    When I click the NewApplicationButton in the Header component
      And I should be on the ContactInformation page
      And The radio dial with Use Home Address text in the addressRadioGroup group is visible
    Then The supportLiveChatButton in the ChatSupport component is not visible
      And I report test passing test status
    Examples:
      | client   | username  | password  | testCaseId |
      | tu5demo  | atest1    | Welcome1  | 112294     |

  @RegressionTest
  Scenario Outline: TU5 Verify live chat button in new application flow (C13240)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click tuitionProgramManagement to go to home page
    Then I should be on the home page
      And The addAnotherGoalBtn is visible
      And The NewApplicationButton in the Header component is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The supportLiveChatButton in the ChatSupport component is visible
    When I click the supportLiveChatButton in the ChatSupport component
    Then The livePersonChat in the ChatSupport component is visible
    When I click on continueButton using jsExecutor
    Then I should be on the EducationInformation page
      And The firstEdGoal is visible
      And The supportLiveChatButton in the ChatSupport component is visible
      And The livePersonChat in the ChatSupport component is visible
    When I click the firstEdGoal element
    Then The programsRadioGroup element is enabled
    When I check Direct Bill radio dial from the programsRadioGroup
      And I click on continueButton using jsExecutor
    Then I should be on the Courses page
      And The sessionStartDateInput is visible
      And The supportLiveChatButton in the ChatSupport component is visible
      And The livePersonChat in the ChatSupport component is visible
    When I enter current date plus 1 days in sessionStartDateInput
      And I enter current date plus 10 days in sessionEndDateInput
      And I click the addCourseAndExpensesButton element
      And I fillout specified text fields with the following text
      #| Element          | Text to enter    |
      | courseNameInput   | Computer Science |
      | courseNumberInput | CompScience 101  |
      | amountInput       | 1                |
      And I select Online from the instructionTypeDropdown
      And I click the addCourseButton element
    Then I wait until the cancelEditsButton is not visible
    When I click on continueButton using jsExecutor
    Then I should be on the Agreement page
    When I click the eligibleGrantsNoRadioLabel element
      And I click the agreement1Label element
      And I enter Auto Test5 in signatureInput textfield
    Then The supportLiveChatButton in the ChatSupport component is visible
      And The livePersonChat in the ChatSupport component is visible
    When I click on continueButton using jsExecutor
    Then I should be on the Application page
      And The supportLiveChatButton in the ChatSupport component is visible
      And The livePersonChat in the ChatSupport component is visible
    When I click the livePersonClose in the ChatSupport component
      And I wait until the livePersonChat in the ChatSupport component is not visible
      And I click the submitApplicationButton element
    Then I should be on the Submission page
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
    When I click the livePersonButton element
    Then The livePersonChat in the ChatSupport component is visible
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | lr5tu5demo | atest5   | Welcome1 | 112295     |

  @RegressionTest
  Scenario Outline: LR5 Verify "Using Your Benefits" content (C45974)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to <home> page
      And I should be on the <home> page
    When I click the supportNav in the Header component
      And I click the supportButton in the ChatSupport component
    Then I should be on the Support page
      And I should see LR5TU5Demo Company Prog Resource test file text in one of the loanUsingYourBenefitsDoc fields
      And I report test passing test status
    Examples:
      | client     | username | password   | home       | testCaseId |
      | lr5tu5demo | atest1   | Welcome1   | dashboard  | 112296     |

  @RegressionTest
  Scenario Outline: TU5 Disable Virtual Help desk configuration (C127641)
    Given I set the <testCaseID>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click tuitionProgramManagement to go to <home> page
    Then I should be on the <home> page
    When I click the supportNav in the Header component
      And I click the supportButton in the ChatSupport component
    Then I should be on the Support page
      And The createSupportTicketBtn is not visible
      And I report test passing test status
    Examples:
      | client     | username  | password | home | testCaseID |
      | eg5tu5demo | ATest1141 | Welcome1 | home | 120094     |

  @RegressionTest
  Scenario Outline: LR5 Verify pagination for Message an Expert pagination & Support tickets(C108580)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I click studentLoanRepayment to go to dashboard page
      And I click the supportNav in the Header component
      And I click the supportLink in the Header component
    Then I should be on the Support page
      And I verify number of supportTicketCard on the page should be 5
    When I click on the 0 child element of paginationNext
    Then I verify number of supportTicketCard on the page should be 5
    When I click the educationCoachingNav in the Header component
    Then I should be on the advising page
      And I verify number of supportTicketCard on the page should be 5
    When I click on the 0 child element of paginationNext
    Then I verify number of supportTicketCard on the page should be 5
      And I report test passing test status
    Examples:
      | client      | username  | password  | testCaseId |
      | lr5tu5demo  | atest6    | Welcome1  | 124568     |
