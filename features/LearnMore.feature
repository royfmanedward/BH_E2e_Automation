Feature: Learn More

  @RegressionTest
  Scenario Outline: LR5: Verify Browse Helpful Content (C50517)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I click studentLoanRepayment to go to <home> page
      And The educationCoachingNav in the Header component is visible
    When I click the educationCoachingNav in the Header component
    Then I should be on the Advising page
    When I click the lrpBrowseHelpfulContentButton element
    Then I should be on the learnMore page
      And The advisingLearnMoreResourcesForBorrowersContent is visible
      And The learnMoreTab1 is visible
      And The learnMoreTab2 is visible
      And The learnMoreTab3 is visible
      And The learnMoreTab4 is visible
      And The learnMoreTab5 is visible
      And The learnMoreTab6 is visible
      And I report test passing test status
    Examples:
      | client     | username | password | home      | testCaseId |
      | lr5tu5demo | atest1   | Welcome1 | dashboard | 112482     |
