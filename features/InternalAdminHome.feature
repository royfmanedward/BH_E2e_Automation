Feature: Internal Admin Home

  @RegressionTest
  Scenario Outline: IA5: Your Processing Tasks (C137396)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And I confirm there is a column where the title is App #
      And I confirm there is a column where the title is Client
      And I confirm there is a column where the title is Participant
      And I confirm there is a column where the title is Program
      And I confirm there is a column where the title is Status
      And I confirm there is a column where the title is Work Type
      And I confirm there is a column where the title is Days
      And I confirm there is a column where the title is Submitted
      And I confirm there is a column where the title is Provider
      And I confirm there is a column where the title is Program Name
      And I confirm there is a column where the title is Employee ID
      And I confirm there is a column where the title is Unique ID
      And I confirm there is a column where the title is Assignee
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | Herpel30 | THerpel1 | 116302     |

  @SmokeTest
  Scenario Outline: IA5: Header Banner and Site Navigation (C137397)
    Given I set the <stgTestCaseId>, <uatTestCaseId> and <prodTestCaseId>
      And I'm on the <client> site
    When I go to the InternalAdminLogin page
    Then The usernameInput element is enabled
      And The navBar in the InternalAdminHeader component is not visible
      And The logo in the InternalAdminHeader component is not visible
      And The title in the InternalAdminHeader component is not visible
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The logo in the InternalAdminHeader component is visible
      And The title in the InternalAdminHeader component is visible
      And The exact text in title from the InternalAdminHeader component should be EdAssist Solutions Administration
      And The homeTab in the InternalAdminHeader component is highlighted
      And The clientTab in the InternalAdminHeader component is not highlighted
      And The navBar is not fixed to page
    When I click the clientTab in the InternalAdminHeader component
    Then I should be on the InternalAdminClient page
    When I click the homeTab in the InternalAdminHeader component
    Then I should be on the InternalAdminHome page
      And The firstAppNumberLink element is enabled
    When I click the firstAppNumberLink element
    Then I should be on the InternalAdminApplication page
      And The logo in the InternalAdminHeader component is visible
      And The title in the InternalAdminHeader component is visible
      And The exact text in title from the InternalAdminHeader component should be EdAssist Solutions Administration
      And The homeTab in the InternalAdminHeader component is not highlighted
      And The navBar is not fixed to page
    When I click the homeTab in the InternalAdminHeader component
    Then I should be on the InternalAdminHome page
      And The logo in the InternalAdminHeader component is visible
      And The title in the InternalAdminHeader component is visible
      And The exact text in title from the InternalAdminHeader component should be EdAssist Solutions Administration
      And The homeTab in the InternalAdminHeader component is highlighted
    When I click the logoutBtn in the InternalAdminHeader component
    Then I should be on the InternalAdminLogin page
      And I report test passing test status
    Examples:
      | client        | username | password | stgTestCaseId | uatTestCaseId | prodTestCaseId |
      | internaladmin | Herpel85 | THerpel1 | 112233        | 128866        | 128868         |

    @RegressionTest
    Scenario Outline: Your Processing Tasks - Pagination (C150795)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The 10 items on application-task element are visible
      And The page 1 navigation is selected
      And The page 2 navigation is unselected
    When I click on the page 2 navigation inactive link
    Then I should be on the InternalAdminHome page
      And The 10 items on application-task element are visible
      And The page 1 navigation is unselected
      And The page 2 navigation is selected
    When I click on the page 1 navigation active link
    Then I should be on the InternalAdminHome page
      And The 10 items on application-task element are visible
      And The page 1 navigation is selected
      And The page 2 navigation is unselected
      And The pageNavLeftArrow is visible
    When I wait for and click on the getPageNavRightArrow element
    Then I should be on the InternalAdminHome page
    When I wait for and click on the getPageNavLeftArrow element
    Then I should be on the InternalAdminHome page
      And The 10 items on application-task element are visible
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | Herpel30 | THerpel1 | 120135     |

  @RegressionTest
  Scenario Outline: Quick Application Search (C185304)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The quickSearchField is visible
    When I capture the application number firstApplicationNumber from the submission page
      And I enter application number in the quickSearchField textfield
      And I click RETURN key in quickSearchField textfield
    Then I should be on the InternalAdminApplication page
      And The application number is present within applicationHeader element
    When I click the homeTab element
    Then I should be on the InternalAdminHome page
      And The quickSearchField is visible
    When I clear the quickSearchField field
      And I capture the application number secondApplicationNumber from the submission page
      And I enter application number in the quickSearchField textfield
      And I click RETURN key in quickSearchField textfield
    Then I should be on the InternalAdminApplication page
      And The applicationHeader is visible
      And The application number is present within applicationHeader element
    When I click the homeTab element
    Then I should be on the InternalAdminHome page
      And The firstUserProfileLink is visible
    When I click the firstUserProfileLink element
    Then I should be on the InternalAdminParticipant page
      And The quickSearchField is visible
    When I enter application number in the quickSearchField textfield
      And I click RETURN key in quickSearchField textfield
    Then I should be on the InternalAdminApplication page
      And The application number is present within applicationHeader element
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | Herpel30 | THerpel1 | 138165     |

  @MockDataRegressionTest
  Scenario Outline: Your Processing Tasks - Pagination Less than 30 applications (C164356)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The 10 items on application-task element are visible
      And The page 1 navigation is selected
      And The page 2 navigation is unselected
    When I click on the page 2 navigation inactive link
    Then I should be on the InternalAdminHome page
      And The 10 items on application-task element are visible
      And The page 1 navigation is unselected
      And The page 2 navigation is selected
    When I click on the page 3 navigation inactive link
    Then I should be on the InternalAdminHome page
      And The 4 items on application-task element are visible
      And The page 1 navigation is unselected
      And The page 2 navigation is unselected
      And The page 3 navigation is selected
    When I wait for and click on the getPageNavLeftArrow element
    Then I should be on the InternalAdminHome page
      And The 10 items on application-task element are visible
      And The page 1 navigation is selected
      And The page 2 navigation is unselected
      And The page 3 navigation is unselected
    When I wait for and click on the getPageNavRightArrow element
    Then I should be on the InternalAdminHome page
      And The 4 items on application-task element are visible
      And The page 1 navigation is unselected
      And The page 2 navigation is unselected
      And The page 3 navigation is selected
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | Daly35   | TDaly1   | 134384     |

  @MockDataRegressionTest
  Scenario Outline: Your Processing Tasks - Pagination Less than 10 applications(C178154)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The 9 items on application-task element are visible
      And The tasklistPageOne is not visible
      And The pageNavLeftArrow is not visible
      And The pageNaveLeftArrow is not visible
      And The tasklistEllipsisRight is not visible
      And The tasklistEllipsisLeft is not visible
    When I click the logoutBtn in the InternalAdminHeader component
    Then I should be on the InternalAdminLogin page
    When I login with <username2> username and <password2> password
    Then I should be on the InternalAdminHome page
      And The 0 items on application-task element are visible
      And I should see No results found text in noResultsFound field
      And The tasklistPageOne is not visible
      And The pageNavLeftArrow is not visible
      And The pageNaveLeftArrow is not visible
      And The tasklistEllipsisRight is not visible
      And The tasklistEllipsisLeft is not visible
      And I report test passing test status
    Examples:
      | client        | username | password | username2 | password2 | testCaseId |
      | internaladmin | JMarchik | TAMS4    | 30015299  | TAMS4     | 134385     |

  @MockDataRegressionTest
  Scenario Outline: Your Processing Tasks - Pagination More than 60 applications (C178156)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the InternalAdminHome page
      And The 10 items on application-task element are visible
      And The page 1 navigation is selected
      And The pageNavLeftArrow is visible
      And The pageNavRightArrow is visible
      And The tasklistEllipsisRight is visible
      And The tasklistEllipsisLeft is not visible
      And I should not see 8 text in one of the tasklistPage fields
      And I should see 10 text in one of the tasklistPage fields
    When I click the tasklistEllipsisRight element
    Then I should be on the InternalAdminHome page
      And The 10 items on application-task element are visible
      And The page 6 navigation is selected
      And The pageNavLeftArrow is visible
      And The pageNavLeftArrow is visible
      And The tasklistEllipsisRight is visible
      And The tasklistEllipsisLeft is visible
      And I should not see 2 text in one of the tasklistPage fields
      And I should not see 9 text in one of the tasklistPage fields
    When I click on the page 10 navigation inactive link
    Then I should be on the InternalAdminHome page
      And The 7 items on application-task element are visible
      And The page 1 navigation is unselected
      And The page 10 navigation is selected
      And The pageNavLeftArrow is visible
      And The pageNavRightArrow is visible
      And The tasklistEllipsisRight is not visible
      And The tasklistEllipsisLeft is visible
    When I click the tasklistPageOne element
    Then I should be on the InternalAdminHome page
      And The 10 items on application-task element are visible
      And The page 1 navigation is selected
      And I should not see 9 text in one of the tasklistPage fields
      And I report test passing test status
    Examples:
      | client        | username | password | testCaseId |
      | internaladmin | King35   | TKing1   | 134386     |
