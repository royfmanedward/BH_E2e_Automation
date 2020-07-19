Feature: Client Administrator

  @RegressionTest
  Scenario Outline: TU5 Admin tab: Advanced Search: Search by User ID (C2089)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the home page
      And The adminNav in the Header component is visible
    When I click the adminNav in the Header component
    Then I should be on the ClientAdminUsageOverview page
    When I click the link with text Search Users & Applications
    Then I should be on the ClientAdmin page
    When I enter atest1 in clientAdminIdSearchInput textfield
      And I scroll to clientAdminSearchButton element
      And I click the clientAdminSearchButton element
    Then The dataTable is visible
      And The clientAdminAppNumberLink is visible
    When I click the clientAdminAppNumberLink element
    Then I should be on the Application page
    When I wait until the loadingSpinner is not visible
    Then I should see $ text in requestedText field
      And I should see $ text in coursesExpensesRequested field
      And I should see $ text in coursesExpensesApproved field
      And I should see $ text in totalBenefitText field
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest3   | Welcome1 | 112314     |

  @RegressionTest
  Scenario Outline: TU5 Admin Tab: Advanced Search: Search by Application Number (C2090)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The adminNav in the header component is visible
      And The scheduleFreeAdvisingLink is visible
    When I click the adminNav in the header component
    Then I should be on the ClientAdminUsageOverview page
    When I click the link with text Search Users & Applications
    Then I should be on the ClientAdmin page
    When I click the adminPageAdvancedSearch element
      And I enter <application> in adminApplicationNum textfield
      And The clientAdminSearchButton element is enabled
      And I click the clientAdminSearchButton element
    Then The dataTable is visible
      And I report test passing test status
    Examples:
      | client  | username | password | application | testCaseId |
      | tu5demo | atest3   | Welcome1 | 5336649     | 112315     |

  @SmokeTest
  Scenario Outline: TU5 Admin Tab: Verify client admin advanced search (C2084)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
      And I should be on the home page
      And The adminNav in the Header component is visible
    When I click the adminNav in the Header component
    Then I should be on the ClientAdminUsageOverview page
    When I click the link with text Search Users & Applications
    Then I should be on the ClientAdmin page
    When I enter atest1 in clientAdminIdSearchInput textfield
      And I enter Auto in clientAdminFnameSearchInput textfield
      And I enter Test1 in clientAdminLnameSearchInput textfield
      And I click the clientAdminSearchButton element
    Then The dataTable is visible
    When I click on the element 1 of the list appSearchAppNumberLink
    Then I should be on the application page
      And The backToSearchResults element is enabled
    When I click the backToSearchResults element
    Then I should be on the ClientAdmin page
    When I click the clientAdminAdvanceSearchButton element
      And I enter Boston University in clientAdminEducationProviderInput textfield
      And I select Application approved from the clientAdminAppStatusDropdown
      And I select 2019 from the clientAdminAppSessionStartDateDropdown
      And I select Active from the clientAdminActiveInactiveDropdown
    Then The clientAdminSearchButton is visible
    When I click the clientAdminSearchButton element
    Then The dataTable is visible
    When I click on the element 1 of the list appSearchAppNumberLink
    Then I should be on the application page
      And I report test passing test status
    Examples:
      | client  | username | password | stgTestCaseId | uatTestCaseId | prodTestCaseId |
      | tu5demo | atest3   | Welcome1 | 107809        | 122185        | 126595         |

  @RegressionTest
  Scenario Outline: TU5 Admin Tab: Verify client admin Application History link from search result (C2094)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the home page
      And The adminNav in the Header component is visible
    When I click the adminNav in the Header component
    Then I should be on the ClientAdminUsageOverview page
    When I click the link with text Search Users & Applications
    Then I should be on the ClientAdmin page
    When I enter atest2 in clientAdminIdSearchInput textfield
      And The clientAdminSearchButton element is enabled
      And I click the clientAdminSearchButton element
  # Admin tab: Admin Search: See existing applications
    Then The dataTable is visible
      And The clientAdminAppNumLink is visible
  # Verify Application History displays when clicking on a search result
    When I click the appHistoryLink element
      And I wait until the appHistoryLink is not visible
    Then I should be on the ApplicationHistory page
      And I wait until the loadingSpinner is not visible
      And The appNumberLink in the first appHistoryTile is visible
  # Verify download icon/link
      And The appHistoryAppDownloadLink element is enabled
  # Verify default Sort is by Application Number & other sorting options work as well
      And The exact text in sortByDropDownButton should be Application Number
      And I verify sorting worked for appNumber according to descending order
    When I select Education Provider from the appHistorySortByDropdown
    Then I verify sorting worked for applicationSchool according to ascending order
  # Verify search using Your Company or Your Team
    When I click the appHistoryTeamMemberDropdown element
      And I clear the teamMemberSearch field
      And I enter Your Team in teamMemberSearch textfield
      And I click the firstTeamMemberInList element
      And I wait until the firstTeamMemberInList is not visible
    Then The exact text in appHistoryTeamMemberDropdown should be Your Team
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest3   | Welcome1 | 112316     |

  @RegressionTest
  Scenario Outline: TU5 Verify Client Admin "Your Team" section on their Profile page and profile link in admin search result (C2095)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the home page
    When I navigate to Profile web page
    Then I should be on the Profile page
      And The yourTeamHeader is visible
      And The adminNav in the Header component is visible
    When I click the adminNav in the Header component
    Then I should be on the ClientAdminUsageOverview page
    When I click the link with text Search Users & Applications
    Then I should be on the ClientAdmin page
    When I enter Auto in clientAdminFnameSearchInput textfield
      And I enter Test1 in clientAdminLnameSearchInput textfield
      And I enter atest1 in clientAdminIdSearchInput textfield
      And I click the clientAdminSearchButton element
    # Verify participant's profile displayed when clicking on a search result
    Then The dataTable is visible
      And The userProfileLink element is enabled
    # Admin Search: open PPT profile page
    When I click the userProfileLink element
    # Admin tab: Admin Search: Verify Change Password button is not displayed
      And I change focus to tab 1
    Then I should be on the profile page
      And The changePasswordButton is not visible
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest3   | Welcome1 | 112317     |

  @RegressionTest
  Scenario Outline: TU5 Client Admin: Admin can add comments to their own apps (C2086)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                           |
      | Program                           | Tuition Reimbursement Program   |
      | Session Start Date from Today     | 1                               |
      | Session End Date from Today       | 60                              |
    Then I create tuition application using API
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The appSummaryAddNewCommentBtn is visible
    When I click the appSummaryAddNewCommentBtn element
      And I enter Test comment for admin in appSummaryCommentInput textfield
      And I click the appSummarySaveCommentBtn element
    Then The appSummaryDeleteCommentBtn is visible
    When I click the appSummaryDeleteCommentBtn element
    Then I should be on the Application page
      And The appSummaryAddNewCommentBtn is visible
    When I cancel an application from the Application Page Actions menu
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest3   | Welcome1 | 112313     |

  @RegressionTest
  Scenario Outline: TU5 Client Admin: View Support Ticket History (C2083)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The adminNav in the Header component is visible
    When I click the adminNav in the Header component
    Then I should be on the ClientAdminUsageOverview page
    When I click the link with text Search Users & Applications
    Then I should be on the ClientAdmin page
    When I enter atest3 in clientAdminIdSearchInput textfield
    Then I should be on the ClientAdmin page
      And I click the clientAdminSearchButton element
    Then The dataTable is visible
    When I click the clientAdminTicketsLink element
    Then I should be on the ClientAdminTickets page
      And The dataTable is visible
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest3   | Welcome1 | 112311     |

  @RegressionTest
  Scenario Outline: TU5 Verify AppealDeniedApplication option not displayed for Client Admin viewing his team's application (C100854)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                           |
      | Program                           | Tuition Reimbursement Program   |
      | Session Start Date from Today     | -200                            |
      | Session End Date from Today       | -180                            |
    Then I create tuition application using API
      And I retrieve application number from applicationId
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatus should be DENIED
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton element is enabled
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I'm on the <client> site
    When I login with <CAUsername> username and <CAPassword> password
    Then I should be on the home page
      And The adminNav in the Header component is visible
    When I click the adminNav in the Header component
    Then I should be on the ClientAdminUsageOverview page
    When I click the link with text Search Users & Applications
    Then I should be on the ClientAdmin page
    When I click the clientAdminAdvanceSearchButton element
    Then The adminApplicationNum is visible
    When I enter application number in the adminApplicationNum textfield
      And I click the clientAdminSearchButton element
    Then The dataTable is visible
      And The clientAdminAppNumLink is visible
    When I click the clientAdminAppNumberLink element
    Then I should be on the Application page
      And The exact text in applicationStatus should be DENIED
      And The submittedApplicationActionMenuButton is not visible
      And I report test passing test status
    Examples:
      | client  | username | password | CAUsername | CAPassword | testCaseId |
      | tu5demo | atest17  | Welcome1 | atest3     | Welcome1   | 112318     |

  @RegressionTest
  Scenario Outline: TU5 Verify CancelAppeal option not displayed for Client Admin viewing his team's application (with appeal in progress) (C109030)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I Update the tuition API request
      #| Attribute                        | Value                           |
      | Program                           | Tuition Reimbursement Program   |
      | Session Start Date from Today     | -200                            |
      | Session End Date from Today       | -180                            |
    Then I create tuition application using API
      And I retrieve application number from applicationId
    When I navigate to the current application summary page
    Then I should be on the Application page
      And The exact text in applicationStatus should be DENIED
    When I click the submittedApplicationActionMenuButton element
    Then The appealDenyButton is visible
    When I click the appealDenyButton element
    Then I should be on the Appeal page
    When I scroll to reasonForAppealDropdown element
      And I select Other from the reasonForAppealDropdown
      And I enter Appeal Comment1 in appealCommentText textfield
      And I click the SendAppealButton element
    Then I should be on the Appeal page
      And The submissionIdLink is visible
      And I click on submissionIdLink using jsExecutor
    Then I should be on the Application page
      And The exact text in applicationStatus should be APPEAL SUBMITTED FOR REVIEW
    When I click the submittedApplicationActionMenuButton element
    Then The CancelAppealButton is visible
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And The logOutButton in the Header component is visible
      And I click the logOutButton in the Header component
    Then I'm on the <client> site
    When I login with <CAUsername> username and <CAPassword> password
    Then I should be on the Home page
      And The adminNav in the Header component is visible
    When I click the adminNav in the Header component
    Then I should be on the ClientAdminUsageOverview page
    When I click the link with text Search Users & Applications
    Then I should be on the ClientAdmin page
    When I click the clientAdminAdvanceSearchButton element
    Then The adminApplicationNum is visible
    When I enter application number in the adminApplicationNum textfield
      And I click the clientAdminSearchButton element
    Then The dataTable is visible
      And The clientAdminAppNumLink is visible
    When I click the clientAdminAppNumberLink element
    Then I should be on the Application page
      And The exact text in applicationStatus should be APPEAL SUBMITTED FOR REVIEW
      And The submittedApplicationActionMenuButton is not visible
      And I report test passing test status
    Examples:
      | client  | username | password | CAUsername | CAPassword | testCaseId |
      | tu5demo | atest1   | Welcome1 | atest3     | Welcome1   | 112449     |

  @RegressionTest
  Scenario Outline: Hyperlink Participant Name Throughout for Client Admin View (C178425)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I click the pptNameLink in first appActionNeededTile
      And I switch to second tab
    Then I should be on the Profile page
    When I close the current tab
      And I change focus to tab 0
    Then I should be on the Home page
    When I navigate to History web page
    Then I should be on the ApplicationHistory page
    When I wait until the loadingSpinner is not visible
      And I select Your Team from the teamMemberDropdown
      And I wait until the loadingSpinner is not visible
      And I click the pptNameLink in first appHistoryTile
      And I switch to second tab
    Then I should be on the Profile page
    When I close the current tab
      And I change focus to tab 0
    Then I should be on the ApplicationHistory page
    When I select Your Team from the teamMemberDropdown
      And I wait until the loadingSpinner is not visible
      And I click the appNumberLink in first appHistoryTile
    Then I should be on the Application page
    When I click the pptNameLink element
      And I switch to second tab
    Then I should be on the Profile page
    When I close the current tab
      And I change focus to tab 0
    Then I should be on the Application page
      And I report test passing test status
    Examples:
      | client  | username | password | testCaseId |
      | tu5demo | atest3   | Welcome1 | 134345     |
