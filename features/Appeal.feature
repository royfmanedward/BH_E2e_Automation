Feature: Appeal (Tuition)

  @RegressionTest
  Scenario Outline: TU5 Verify Reasons for Appeal and Appeal option not available in doc dropdown prior to Appeal submission (C108581)
    #Keeping this as UI test
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I submit a new application: program = Tuition Reimbursement Program, expense type = NA, user = Auto Test1, start date from today = -300, end date from today = -250, comment = false and upload = false
    Then I should be on the Submission page
      And The submissionIdLink is visible
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
    When I upload TestFile.pdf file using the sharedFileUpload component
    Then The uploadDocSuccessMessage is visible
      And The documentTypeButton element is enabled
    When I scroll to documentTypeButton element
      And I click the documentTypeButton element
    Then The appealsOptionInDropDown is not visible
    When I scroll to submittedApplicationActionMenuButton element
      And I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is visible
    When I click the appealDenyButton element
    Then I should be on the Appeal page
    When I scroll to reasonForAppealDropdown element
      And I verify dropDown reasonForAppealDropdown should contain 2 elements of list appealDropDownList with following text
      #| DropDown options Text                                                                |
      | I have a medical Issue or some other personal hardship that I would like considered   |
      | Other                                                                                 |
    Then I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest1_210   | Welcome1 | 112463     |

  @RegressionTest
  Scenario Outline: TU5 Step 3: Reason for Appeal drop-down has only 1 reason and Verify site does NOT display Course Related Expenses for a client with this functionality disabled (C94566)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                  |
      | Program                           | Certification Program  |
      | Session Start Date from Today     | -110                   |
      | Session End Date from Today       | -100                   |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is visible
    When I click the appealDenyButton element
    Then I should be on the Appeal page
    When I scroll to reasonForAppealDropdown element
      And I verify dropDown reasonForAppealDropdown should contain 1 elements of list appealDropDownList with following text
      #| DropDown options Text |
      | Other                  |
    Then I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest5   | Welcome1 | 112466     |

  @RegressionTest
  Scenario Outline: TU5: Verify Appeal Creation Page UI & Verify Appeal Confirmation Page Content is Correct (C94546)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                          |
      | Program                           | Tuition Reimbursement Program  |
      | Session Start Date from Today     |-200                            |
      | Session End Date from Today       |-190                            |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is visible
    When I click the appealDenyButton element
      And I wait until the appealDenyButton is not visible
    Then I should be on the Appeal page
      And The exact text in appealHeader should be Appeal a Denied Application
      And The appealHeaderText element is present
      And The exact text in reasonsForDenialHeader should be Reasons For Denial
      And The exact text in denialFrom0 should be From Program Rules
      And The denialReason0 element is present
      And The denialDatetime0 element is present
      And The exact text in reasonForAppealHeader should be Reason for Appeal
      And The reasonForAppealLabel element is present
      And The reasonForAppealDropdown element is present
      And The exact text in commentsHeader should be Comments
      And The commentHeaderText element is present
      And The appealCommentText element is present
      And The exact text in supportingDocumentationHeader should be Supporting Documentation
      And The submitDocsAdditionalInfoText element is present
      And The DocumentUploadLink element is enabled
      And The sendAppealButton element is disabled
      And The cancelAppealsButton element is enabled
    When I scroll to reasonForAppealDropdown element
      And I select Other from the reasonForAppealDropdown
      And I enter Appeal Comment by PPT in appealCommentText textfield
    Then The sendAppealButton element is enabled
    When I click the sendAppealButton element
      And I wait until the sendAppealButton is not visible
    Then I should be on the AppealConfirmation page
      And The exact text in submissionConfirmationDescription should be Appeal Submitted Confirmation Message
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest5   | Welcome1 | 120095     |

  @SmokeTest
  Scenario Outline: TU5: Verify Appeal submitted successfully and application goes to correct Appeal Submitted Pending Review status (C94548)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
    And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I submit a new application: program = Tuition Reimbursement Program, expense type = NA, user = Auto Test5, start date from today = -200, end date from today = -190, comment = false and upload = false
    Then I should be on the Submission page
      And The submissionIdLink is visible
    When I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is visible
    When I click the appealDenyButton element
    Then I should be on the Appeal page
    When I scroll to reasonForAppealDropdown element
      And I select Other from the reasonForAppealDropdown
      And I enter Appeal Comment by PPT in appealCommentText textfield
    Then The sendAppealButton element is enabled
    When I click the sendAppealButton element
      And I wait until the sendAppealButton is not visible
    Then I should be on the AppealConfirmation page
      And The returnHomePageButton element is enabled
      And The logoutButton element is enabled
    When I click the applicationNumberLink element
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatusHeaderStatus should be APPEAL SUBMITTED FOR REVIEW
      And I report test passing test status
    Examples:
      | client  | username | password | stgTestCaseId | uatTestCaseId | prodTestCaseId |
      | tu5demo | atest5   | Welcome1 | 86088         | 124290        | 126604         |

  @RegressionTest
  Scenario Outline: TU5 Client Admin can cancel out of creating Appeal and cancel own appeal when in "Appeal Submitted Pending Review" status (C131344)
    Given I set the <testCaseID>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                          |
      | Program                           | Tuition Reimbursement Program  |
      | Session Start Date from Today     |-110                            |
      | Session End Date from Today       |-100                            |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is visible
    When I click the appealDenyButton element
    Then I should be on the Appeal page
    When I scroll to reasonForAppealDropdown element
      And I select Other from the reasonForAppealDropdown
      And I enter Appeal Comment by Admin in appealCommentText textfield
    Then The cancelAppealsButton element is enabled
    When I click the cancelAppealsButton element
      And I click the modalNo element
    Then I should be on the Appeal page
    When I scroll to reasonForAppealDropdown element
    Then The cancelAppealsButton element is enabled
    When I click the cancelAppealsButton element
      And I click the modalYes element
    Then I should be on the Application page
      And The exact text in applicationStatus should be DENIED
      And The submittedApplicationActionMenuButton element is enabled
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is visible
    When I click the appealDenyButton element
    Then I should be on the Appeal page
    When I scroll to reasonForAppealDropdown element
      And I select Other from the reasonForAppealDropdown
      And I enter Appeal Comment by Admin in appealCommentText textfield
    Then The sendAppealButton element is enabled
    When I click the sendAppealButton element
      And I wait until the sendAppealButton is not visible
    Then I should be on the AppealConfirmation page
    When I click the applicationNumberLink element
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatusHeaderStatus should be APPEAL SUBMITTED FOR REVIEW
    When I click the submittedApplicationActionMenuButton element
      And I click the cancelAppealButton element
      And I click the confirm element
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
      And I should see APPEAL CANCELLED text in one of the appSummaryHistoryStatus fields
      And I report test passing test status
    Examples:
      | client | username | password | testCaseID |
      | tu5demo| atest3   | Welcome1 | 126371     |

  @RegressionTest
  Scenario Outline: TU5: Verify PPT appeal submission comment is listed as reviewed & Verify that new comment can be entered only after previous comment is reviewed (C115231)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                          |
      | Program                           | Tuition Reimbursement Program  |
      | Session Start Date from Today     |-200                            |
      | Session End Date from Today       |-190                            |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is visible
    When I click the appealDenyButton element
      And I wait until the appealDenyButton is not visible
    Then I should be on the Appeal page
    When I scroll to reasonForAppealDropdown element
      And I select Other from the reasonForAppealDropdown
      And I enter Appeal Comment by PPT in appealCommentText textfield
    Then The sendAppealButton element is enabled
    When I click the sendAppealButton element
      And I wait until the sendAppealButton is not visible
    Then I should be on the AppealConfirmation page
    When I click the applicationNumberLink element
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatusHeaderStatus should be APPEAL SUBMITTED FOR REVIEW
      And The exact text in commentsEntered should be Appeal Comment by PPT
      And I should see Reviewed text in one of the commentContainer fields
      And The appSummaryAddNewCommentBtn element is enabled
    When I click the appSummaryAddNewCommentBtn element
      And I enter test comment on application summary page in appSummaryCommentInput textfield
      And I click the appSummarySaveCommentBtn element
      And I wait until the appSummarySaveCommentBtn is not visible
    Then I should not see Reviewed text in first field of the commentContainer fields
      And The appSummaryAddNewCommentBtn element is enabled
    When I click the appSummaryAddNewCommentBtn element
    Then The modalContent is visible
      And I should see You will be able to add new comments once they are reviewed. text in modalBody field
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest5   | Welcome1 | 126489     |

  @RegressionTest
  Scenario Outline: TU5: Submit Appeal along with Uploading Appeal Documents and each Document is visible on 5.0 AppSummary page  (C115229)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                         |
      | Program                           | Tuition Reimbursement Program |
      | Session Start Date from Today     |-300                           |
      | Session End Date from Today       |-250                           |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is visible
    When I click the appealDenyButton element
    Then I should be on the Appeal page
    When I scroll to reasonForAppealDropdown element
      And I select Other from the reasonForAppealDropdown
      And I enter Appeal Comment by PPT in appealCommentText textfield
      And I upload TestFile.pdf file using the sharedFileUpload component
    Then I click the submitDocumentButton element
      And The exact text in supportingDocumentType should be Appeal
      And The sendAppealButton element is enabled
    When I upload TestFile2.pdf file using the sharedFileUpload component
      And I click the submitDocumentButton element
    Then The exact text in supportingDocumentType should be Appeal
      And The sendAppealButton element is enabled
    When I click the sendAppealButton element
      And I wait until the sendAppealButton is not visible
    Then I should be on the AppealConfirmation page
      And The submissionIdLink is visible
    When I click the submissionIdLink element
    Then I should be on the Application page
      And The exact text in supportingDocument1 should be Appeal
      And The exact text in supportingDocument2 should be Appeal
    When I click the supportingDocument1 element
    Then The current date is present in documentUploadedDate field with format MM/dd/yy
      And The exact text in statusOfDocumentUploaded should be Pending
      And The exact text in documentReviewedDate should be N/A
      And The deleteDocumentButton is visible
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest5   | Welcome1 | 124542     |

  @RegressionTest
  Scenario Outline: TU5: PPT can upload appeal document for an appeal in Appeal Submitted for Review status (C100159)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                           |
      | Program                           | Tuition Reimbursement Program   |
      | Session Start Date from Today     |-300                             |
      | Session End Date from Today       |-250                             |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is visible
    When I click the appealDenyButton element
      And I wait until the appealDenyButton is not visible
    Then I should be on the Appeal page
    When I scroll to reasonForAppealDropdown element
      And I select Other from the reasonForAppealDropdown
      And I enter Appeal Comment by PPT in appealCommentText textfield
    Then The sendAppealButton element is enabled
    When I click the sendAppealButton element
      And I wait until the sendAppealButton is not visible
    Then I should be on the AppealConfirmation page
    When I click the applicationNumberLink element
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatusHeaderStatus should be APPEAL SUBMITTED FOR REVIEW
    When I upload TestFile2.pdf file using the sharedFileUpload component
      And The uploadDocSuccessMessage is visible
    Then Text in uploadDocSuccessMessage field is present
      And The cancelDocumentButton is visible
    When I select Appeal from the documentTypeDropdown
      And I click the submitDocumentButton element
    Then The supportingDocument1 is visible
      And The exact text in supportingDocument1 should be Appeal
      And The exact text in applicationStatusHeaderStatus should be APPEAL SUBMITTED FOR REVIEW
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest5   | Welcome1 | 126675     |

  @RegressionTest
  Scenario Outline: TU5: When Appeal Approver = EdAssist Admin + Appeal Designee but NO Appeal Designee assigned to PPT (C100965)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                         |
      | Program                           | Tuition Reimbursement Program |
      | Session Start Date from Today     |-300                           |
      | Session End Date from Today       |-250                           |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is visible
    When I click the appealDenyButton element
    Then I should be on the Appeal page
    When I scroll to reasonForAppealDropdown element
      And I select Other from the reasonForAppealDropdown
      And I enter Appeal Comment by PPT in appealCommentText textfield
    Then The sendAppealButton element is enabled
    When I click the sendAppealButton element
      And I wait until the sendAppealButton is not visible
    Then I should be on the AppealConfirmation page
      And The exact text in submissionConfirmationDescription should be Appeal Submitted Confirmation Message
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest20  | Welcome1 | 126676     |

  @RegressionTest
  Scenario Outline: TU5: Verify Supervisor can cancel his own Appeal application when it is in Appeal Submitted Pending Review status (C122480)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                           |
      | Program                           | Tuition Reimbursement Program   |
      | Session Start Date from Today     |-300                             |
      | Session End Date from Today       |-250                             |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is visible
    When I click the appealDenyButton element
    Then I should be on the Appeal page
    When I scroll to reasonForAppealDropdown element
      And I select Other from the reasonForAppealDropdown
      And I enter Appeal Comment by Supervisor in appealCommentText textfield
    Then The sendAppealButton element is enabled
    When I click the sendAppealButton element
      And I wait until the sendAppealButton is not visible
    Then I should be on the AppealConfirmation page
    When I click the applicationNumberLink element
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatusHeaderStatus should be APPEAL SUBMITTED FOR REVIEW
    When I click the submittedApplicationActionMenuButton element
    Then The cancelAppealButton is visible
    When I click the cancelAppealButton element
      And I click the confirm element
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
      And I should see APPEAL CANCELLED text in one of the appSummaryHistoryStatus fields
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest2   | Welcome1 | 128873     |

  @RegressionTest
  Scenario Outline: User can submit new appeal if previous appeal (on the same application) is "Cancelled" (C124135)
    Given I set the <testCaseID>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                         |
      | Program                           | Tuition Reimbursement Program |
      | Session Start Date from Today     |-300                           |
      | Session End Date from Today       |-250                           |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
    When I click the submittedApplicationActionMenuButton element
      And I click the appealDenyButton element
    Then I should be on the Appeal page
    When I scroll to reasonForAppealDropdown element
      And I select Other from the reasonForAppealDropdown
      And I enter Appeal Comment1 in appealCommentText textfield
    Then The sendAppealButton element is enabled
    When I click the sendAppealButton element
    Then I should be on the AppealConfirmation page
    When I click the applicationNumberLink element
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatusHeaderStatus should be APPEAL SUBMITTED FOR REVIEW
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is not visible
      And The cancelAppealButton is visible
    When I click the cancelAppealButton element
      And I click the confirm element
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
      And I should see APPEAL CANCELLED text in one of the appSummaryHistoryStatus fields
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is visible
      And The cancelAppealButton is not visible
    When I click the appealDenyButton element
    Then I should be on the Appeal page
    When I scroll to reasonForAppealDropdown element
      And I select Other from the reasonForAppealDropdown
      And I enter Appeal Comment2 in appealCommentText textfield
    Then The sendAppealButton element is enabled
    When I click the sendAppealButton element
    Then I should be on the AppealConfirmation page
    When I click the applicationNumberLink element
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatusHeaderStatus should be APPEAL SUBMITTED FOR REVIEW
      And I report test passing test status
    Examples:
      | client | username | password | testCaseID |
      | tu5demo| atest1   | Welcome1 | 131048     |

  @RegressionTest
  Scenario Outline: TU5: Verify CancelAppeal option not displayed for Supervisor viewing his team's application with Appeal Submitted Pending Review status (C109029)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                 |
      | Program                           | Direct Bill Program   |
      | Session Start Date from Today     |-110                  |
      | Session End Date from Today       |-100                  |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The applicationStatus is visible
      And The exact text in applicationStatus should be DENIED
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is visible
    When I click the appealDenyButton element
    Then I should be on the Appeal page
    When I scroll to reasonForAppealDropdown element
      And I select Other from the reasonForAppealDropdown
      And I enter Appeal Comment by Participant in appealCommentText textfield
    Then The sendAppealButton element is enabled
    When I click the sendAppealButton element
      And I wait until the sendAppealButton is not visible
    Then I should be on the AppealConfirmation page
      And The exact text in submissionConfirmationDescription should be Appeal Submitted Confirmation Message
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
    Then The logOutButton in the Header component is visible
    When I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <supervisor1> username and <supervisor1pw> password
    Then I should be on the Home page
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And The teamMember element is enabled
    When I click the appHistoryTeamMemberDropdown element
      And I clear the teamMemberSearch field
      And I enter Auto Test1 in teamMemberSearch textfield
      And I click the firstTeamMemberInList element
      And I wait until the firstTeamMemberInList is not visible
    Then The firstAppNumber is visible
      And I verify applicationStatusText is APPEAL SUBMITTED FOR REVIEW and click appNumberLink
      And I should be on the Application page
      And The submittedApplicationActionMenuButton is not visible
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
    Then The logOutButton in the Header component is visible
    When I click the logOutButton in the Header component
    Then I should be on the Login page
    When I login with <supervisor2> username and <supervisor2pw> password
    Then I should be on the Home page
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
      And The teamMember element is enabled
    When I click the appHistoryTeamMemberDropdown element
      And I clear the teamMemberSearch field
      And I enter Auto Test1 in teamMemberSearch textfield
      And I click the appHistoryYourCompanyOption element
      And I wait until the firstTeamMemberInList is not visible
    Then The firstAppNumber is visible
      And I verify applicationStatusText is APPEAL SUBMITTED FOR REVIEW and click appNumberLink
      And I should be on the Application page
      And The submittedApplicationActionMenuButton is not visible
      And I report test passing test status
    Examples:
      | client     | username | password | supervisor1 | supervisor1pw  | supervisor2  | supervisor2pw | testCaseId |
      | tu5demo    | atest1   | Welcome1 | atest2      | Welcome1       | atest10      | Welcome1      | 131094     |
