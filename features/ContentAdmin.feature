Feature: Content Admin

  @RegressionTest
  Scenario Outline: CA5 Participant Search (C79510)
    Given I set the <testCaseId>
      And I'm on the <admin> site
    When I login with <username> username and <password> password
    Then I should be on the ContentAdmin page
      And The userAdmin in the ContentAdminHeader component is visible
      And The addNewContentBtn is visible
    When I click the userAdmin in the ContentAdminHeader component
    Then I should be on the ContentAdminUser page
    When I select eg5tu5demo from the clientListDropdown
      And I select Participant from the userTypeDropdown
      And I click the searchButton element
    Then The userNameLink element is enabled
    When I click the userNameLink element
    Then The firstName is visible
      And The lastName is visible
      And The exact text in userTypeButton should be Participant
      And I report test passing test status
    Examples:
      | admin | username | password  | testCaseId |
      | admin | ATestCA  | AClientA1 | 112473     |

  @RegressionTest
  Scenario Outline: CA5 Verify content slots populate options related to loan content admin 5 (C78980)
    Given I set the <testCaseId>
      And I'm on the <admin> site
    When I login with <username> username and <password> password
    Then I should be on the ContentAdmin page
      And The contentAdminContentType element is present
      And I select loan from contentAdminContentType dropdown
      And I select home from contentAdminContentCategory dropdown
      And I select policy from contentAdminContentName dropdown
      And I select policyText from contentAdminContentName dropdown
      And I select preferredLenderText from contentAdminContentName dropdown
      And I select preferredLender from contentAdminContentName dropdown
    When I click the addNewContentBtn element
    Then I should be on the AddNewManagedContent page
      And I select Loan from addContentFormContentType dropdown
      And I select Home from addContentCategory dropdown
      And I select Policy Text from addContentName dropdown
      And I select Policy Documents from addContentName dropdown
      And I select Preferred Lender Text from addContentName dropdown
      And I select Preferred Lender Documents from addContentName dropdown
      And I report test passing test status
    Examples:
      | admin | username | password  | testCaseId |
      | admin | ATestCA  | AClientA1 | 112472     |

  @RegressionTest
  Scenario Outline: CA5 Verify character limits for content title on site maintenance notification (C145684)
    Given I set the <testCaseId>
      And I'm on the <admin> site
    When I login with <username> username and <password> password
    Then I should be on the ContentAdmin page
      And The addNewContentBtn element is enabled
    When I select eg5tu5demo from clientDropdown dropdown
      And I select Client Default from programDropdown dropdown
      And I select general from contentAdminContentType dropdown
      And I select home from contentAdminContentCategory dropdown
      And I select siteMaintenanceNotification from contentAdminContentName dropdown
      And I click the searchContent element
      And I click the siteMaintenanceNotification element
    Then The editContentTitle element is enabled
      And I validate maxlength attribute value of editContentTitle is equal to 100
    Then I report test passing test status
    Examples:
      | admin | username | password  | testCaseId |
      | admin | ATestCA  | AClientA1 | 117740     |
