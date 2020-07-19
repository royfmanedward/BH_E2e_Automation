Feature: Client Landing Page

  @RegressionTest
  Scenario Outline: Verify Client Landing Page - Single LOB (C122215)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I go to the ClientLanding page
    Then The edAssistSolutionCard is visible
      And The accessCollegeCoachCard is not visible
      And The studentLoanRepaymentCard is not visible
      And The tuitionProgramManagementCard is not visible
    When I click the edAssistSolution element
      And I click the edAssistSolutionUseItBtn element
      And I switch to second tab
    Then I should be on the BhLogin page
      And I report test passing test status
    Examples:
      | client          | testCaseId |
      | lr5demotestperf | 131478     |

  @RegressionTest
  Scenario Outline: Verify Client Landing Page - Multi LOB (C170074)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I go to the ClientLanding page
    Then The accessCollegeCoachCard is visible
      And The studentLoanRepaymentCard is visible
      And The tuitionProgramManagementCard is visible
    When I click the edAssistSolution element
      And I click the tuitionProgramManagementUseItBtn element
      And I switch to second tab
    Then I should be on the BhLogin page
    When I change focus to tab 0
    Then I should be on the ClientLanding page
    When I click the edAssistSolution element
      And I click the studentLoanRepaymentUseItBtn element
      And I change focus to tab 2
    Then I should be on the BhLogin page
      And I report test passing test status
    Examples:
      | client            | testCaseId |
      | lrtu5demotestperf | 131081     |

  @RegressionTest
  Scenario Outline: Verify user can login to College Coach, login to EdAssist from College Coach, then logout - Multi LOB client (C137829)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I go to the ClientLanding page
      And I click the familySolutions element
      And I click the collegeCoachUseItBtn element
      And I switch to second tab
    Then I should be on the BhLogin page
    When I login with <username> username and <password> password
    Then I should be on the CollegeCoachHome page
    When I select edAssistSolution from the otherServices combobox
      And I change focus to tab 2
    Then I should be on the EdAssistLogin page
    When I click the studentLoanRepayment element
    Then I should be on the Dashboard page
    When I click the IconProfile in the Header component
      And I click the LogoutNav in the Header component
      And I click the logOutButton in the Header component
    Then I should be on the Logout page
    When I change focus to tab 1
      And I refresh the page
    Then I should be on the CollegeCoachLogout page
      And I report test passing test status
    Examples:
      | client            | username        | password  | testCaseId |
      | lrtu5demotestperf | 120919CcMTestv1 | Password1 | 112605     |

  @RegressionTest
  Scenario Outline: Verify user can login to College Coach then login to EdAssist from client landing page without login - Multi LOB client (C185301)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I go to the ClientLanding page
      And I click the familySolutions element
      And I click the collegeCoachUseItBtn element
      And I switch to second tab
    Then I should be on the BhLogin page
    When I login with <username> username and <password> password
    Then I should be on the CollegeCoachHome page
    When I change focus to tab 0
      And I go to the ClientLanding page
      And I click the edAssistSolution element
      And I click the studentLoanRepaymentUseItBtn element
      And I switch to second tab
    Then I should be on the EdAssistLogin page
      And I report test passing test status
    Examples:
      | client            | username        | password  | testCaseId |
      | lrtu5demotestperf | 120919CcMTestv1 | Password1 |  138147    |