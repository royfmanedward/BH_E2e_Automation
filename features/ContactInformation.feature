Feature: Contact Information (Tuition Step 1)

  @RegressionTest
  Scenario Outline: TU5 Contact Info: Verify address, phone number, Email address verification and selection (C55915)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    Then I should be on the ContactInformation page
      And The continueButton is visible
    When I select the radio dial with Use Home Address text from the addressRadioGroup group
    Then The radio dial with Use Home Address text from the addressRadioGroup group is selected
      And The radio dial with Use Work Address text in the addressRadioGroup group is visible
      And The exact text in homeStreetAddress1Text from the ContactInfo component should be 123 Fake Home
      And The exact text in homeAddressCityText from the ContactInfo component should be FakeHome, MA 12345
    When I select the radio dial with Use Work Address text from the addressRadioGroup group
    Then The radio dial with Use Work Address text from the addressRadioGroup group is selected
      And The radio dial with Use Home Address text in the addressRadioGroup group is visible
      And The exact text in workStreetAddress1Text from the ContactInfo component should be 123 Fake Work
      And The exact text in workAddressCityText from the ContactInfo component should be FakeWork, MA 67890
    When I select the radio dial with Use Work Phone text from the phoneRadioGroup group
    Then The radio dial with Use Work Phone text from the phoneRadioGroup group is selected
      And The radio dial with Use Home Phone text in the phoneRadioGroup group is visible
      And The radio dial with Use Other Phone text in the phoneRadioGroup group is visible
      And The exact text in workPhoneText from the ContactInfo component should be (800) 649-2568
    When I select the radio dial with Use Home Phone text from the phoneRadioGroup group
    Then The radio dial with Use Home Phone text from the phoneRadioGroup group is selected
      And The radio dial with Use Work Phone text in the phoneRadioGroup group is visible
      And The radio dial with Use Other Phone text in the phoneRadioGroup group is visible
      And The exact text in homePhoneText from the ContactInfo component should be (617) 867-5309
    When I select the radio dial with Use Other Phone text from the phoneRadioGroup group
    Then The radio dial with Use Other Phone text from the phoneRadioGroup group is selected
      And The radio dial with Use Home Phone text in the phoneRadioGroup group is visible
      And The radio dial with Use Work Phone text in the phoneRadioGroup group is visible
      And The exact text in otherPhoneInput from the ContactInfo component should be (555) 111-2222
    When I select the radio dial with Use Work Email text from the emailRadioGroup group
    Then The radio dial with Use Work Email text from the emailRadioGroup group is selected
      And The radio dial with Use Home Email text in the emailRadioGroup group is visible
      And The radio dial with Use Other Email text in the emailRadioGroup group is visible
     And The exact text in workEmailText from the ContactInfo component should be tamssupport@edassist.com
    When I select the radio dial with Use Home Email text from the emailRadioGroup group
    Then The radio dial with Use Home Email text from the emailRadioGroup group is selected
      And The radio dial with Use Work Email text in the emailRadioGroup group is visible
      And The radio dial with Use Other Email text in the emailRadioGroup group is visible
      And The exact text in homeEmailText from the ContactInfo component should be tamssupport@edassist.com
    When I select the radio dial with Use Other Email text from the emailRadioGroup group
    Then The radio dial with Use Other Email text from the emailRadioGroup group is selected
      And The radio dial with Use Home Email text in the emailRadioGroup group is visible
      And The radio dial with Use Work Email text in the emailRadioGroup group is visible
      And The exact text in otherEmailInput from the ContactInfo component should be test@test.com
    When I click the cancelButton element
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | tu5demo    | atest1    | Welcome1 | 112469     |

  @RegressionTest
  Scenario Outline: TU5 Contact Info: Verify Field Validations (C52494)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
    When I navigate to Contact Information web page
    # Positive test
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Work Phone text from the phoneRadioGroup group
    Then The exact text in workPhoneText from the ContactInfo component should be (800) 649-2568
    When I select the radio dial with Use Home Phone text from the phoneRadioGroup group
    Then The exact text in homePhoneText from the ContactInfo component should be (617) 867-5309
    When I select the radio dial with Use Work Email text from the emailRadioGroup group
    Then The exact text in workEmailText from the ContactInfo component should be tamssupport@edassist.com
    When I select the radio dial with Use Home Email text from the emailRadioGroup group
    Then The exact text in homeEmailText from the ContactInfo component should be tamssupport@edassist.com
    When I select the radio dial with Use Other Phone text from the phoneRadioGroup group
      And I clear the otherPhoneInput field in the ContactInfo component
      And I enter 555-111-2222 in otherPhoneInput textfield in the ContactInfo component
    Then The exact text in otherPhoneInput from the ContactInfo component should be (555) 111-2222
    When I select the radio dial with Use Other Email text from the emailRadioGroup group
      And I clear the otherEmailInput field in the ContactInfo component
      And I enter test@test.com in otherEmailInput textfield in the ContactInfo component
    Then The exact text in otherEmailInput from the ContactInfo component should be test@test.com
    When I click the continueButton element
    Then I should be on the EducationInformation page
    # Negative tests
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
    When I select the radio dial with Use Other Phone text from the phoneRadioGroup group
      And I clear the otherPhoneInput field in the ContactInfo component
      And I select the radio dial with Use Other Email text from the emailRadioGroup group
    Then I clear the otherEmailInput field in the ContactInfo component
    When The continueButton element is enabled
      And I click the continueButton element
    Then The exact text in otherEmailError from the ContactInfo component should be This field is required
      And I enter 555-111-222 in otherPhoneInput textfield in the ContactInfo component
    Then The exact text in otherPhoneInput from the ContactInfo component should be (555) 111-222_
    When I enter test.test.com in otherEmailInput textfield in the ContactInfo component
    Then The continueButton element is enabled
    When I click the continueButton element
    Then I should be on the ContactInformation page
      And The exact text in otherPhoneError from the ContactInfo component should be Invalid data
      And The exact text in otherEmailError from the ContactInfo component should be Invalid email address
    When I select the radio dial with Use Other Email text from the emailRadioGroup group
      And I clear the otherEmailInput field in the ContactInfo component
    Then I enter test#test!.com in otherEmailInput textfield in the ContactInfo component
    When The continueButton element is enabled
      And I click the continueButton element
    Then I should be on the ContactInformation page
      And The exact text in otherEmailError from the ContactInfo component should be Invalid email address
    When I click the cancelButton element
    Then I should be on the Home page
      And I report test passing test status
    Examples:
      | client     | username  | password | testCaseId |
      | tu5demo    | atest1    | Welcome1 | 112470     |

  @RegressionTest
  Scenario Outline: TU5 Step 1: Contact Information address/home/email pre-populated (C100162)
    Given I set the <testCaseId>
      And I'm on the <client> site
    When I login with <username> username and <password> password
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton is visible
    When I select the radio dial with Use Home Address text from the addressRadioGroup group
      And I select the radio dial with Use Home Phone text from the phoneRadioGroup group
      And I select the radio dial with Use Home Email text from the emailRadioGroup group
      And I click the continueButton element
    Then I should be on the EducationInformation page
    When I click the cancelButton element
    Then I should be on the Home page
      And The NewApplicationButton in the Header component is visible
    When I click the NewApplicationButton in the Header component
    Then I should be on the ContactInformation page
      And The continueButton is visible
      And The radio dial with Use Home Address text from the addressRadioGroup group is selected
      And The radio dial with Use Home Phone text from the phoneRadioGroup group is selected
      And The radio dial with Use Home Email text from the emailRadioGroup group is selected
      And I report test passing test status
    Examples:
      | client     | username | password | testCaseId |
      | tu5demo | atest8   | Welcome1 | 112471     |
