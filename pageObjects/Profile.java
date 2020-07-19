package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class Profile {

	public Profile(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}

	private String url = "profile";

	public String getUrl() {
		return url;
	}

	//Your Informaion
	@FindBy(id = "yourInformationChangePasswordButton")
	private WebElement changePasswordButton;

	@FindBy(id = "profilePersonalInformationNameText")
	private WebElement nameText;

	@FindBy(id = "profilePersonalInformationUsernameText")
	private WebElement usernameText;

	//Education Information
	@FindBy(id = "programRadioGroup")
	private WebElement programsRadioGroup;

	@FindBy(id = "whoIsYourEducationProviderEditButton")
	private WebElement providerEditButton;

	@FindBy(id = "providerSearchSubmitButton")
	private WebElement providerSearchButton;

	@FindBy(id = "providerSearchTbl")
	private WebElement providerSearchResultsTable;

	@FindBy(id = "providerName")
	private WebElement providerName;

	@FindBy(id = "degreeObjective-dropdown")
	private WebElement educationProgramDropdown;

	@FindBy(id = "fieldOfStudy-dropdown")
	private WebElement fieldOfStudyDropdown;

	@FindBy(id = "profileEducationInfoSubmitButton")
	private WebElement educationInformationSaveButton;

	@FindBy(id = "profileEducationInfoCancelButton")
	private WebElement profileEdInfoCancelBtn;

	@FindBy(id = "tuitionReimbursementProgramButton")
	private WebElement tuitionAssistanceProgramButton;

	@FindBy(id = "virtualCardCertificationprogramButton")
	private WebElement certificationProgramButton;

	@FindBy(id = "virtualCardButton")
	private WebElement virtualCardProgramButton;

	@FindBy(id = "programDescriptionModalText")
	private WebElement ProgramModalText;

	@FindBy(id = "programDescriptionOkButton")
	private WebElement ProgramModalOkButton;

	@FindBy(id = "otherCourseOfStudy")
	private WebElement otherCourseOfStudyInput;

	@FindBy(id = "contactInformationContinueButton")
	private WebElement continueButton;

	@FindBy(xpath = "//button[(@id='profileEducationInfoCancelButton')]/following-sibling::span")
	private WebElement educationProfileSave;

	//Your Team
	@FindBy(className = "tile-header")
	private WebElement yourTeamHeader;

	@FindBy(id = "whoseTuitionApplicationsCanIReviewHeaderText")
	private WebElement yourTeamQuestionHeader;

	@FindBy(id = "supervisorTeamListParticipantName")
	private WebElement participantNameHeader;

	@FindBy(id = "supervisorTeamListEmployeeID")
	private WebElement employeeIDHeader;

	@FindBy(id = "supervisorTeamListApprovalLevel")
	private WebElement approvalLevelHeader;

	@FindBy(id = "supervisorTeamListParticipantStatus")
	private WebElement participantStatusHeader;

	@FindBy(id = "supervisorTeamListParticipantRole")
	private WebElement participantRoleHeader;

	@FindBy(id = "supervisorTeamListAlternateReviewer")
	private WebElement alternateReviewerHeader;

   	@FindBy(id = "supervisorTeamListBulkChooseProxyReviewer")
	private WebElement headerTooltipProxyReviewer;

	@FindBy(xpath = "//td[@id='yourTeamStatusText']/descendant::div[@id='tooltipText']")
	private List<WebElement> toolTipText;

	@FindBy(xpath = "//tooltip[@id=\"supervisorTeamListYourTeamToolTip\"]/descendant::div[@id='tooltipText']")
	private List<WebElement> toolTipTextHeader;

	@FindBy(className = "paricipant-proxy-review-test")
	private List<WebElement> participantProxyEdit;

	@FindBy(id = "yourTeamNameText")
	private WebElement employeeName;

	@FindBy(id = "yourTeamEmployeeIdText")
	private WebElement employeeID;

	@FindBy(id = "yourTeamApprovalLevelText")
	private WebElement approvalLevel;

	@FindBy(id = "yourTeamStatusText")
	private WebElement yourTeamMemberStatus;

	@FindBy(id = "yourTeamRoleText")
	private WebElement yourTeamMemberRole;

	@FindBy(id = "modal-title")
	private WebElement alternateReviewerModalHeader;

	@FindBy(id = "alternateReviewerTxt")
	private WebElement alternateReviewerTxt;

	@FindBy(id = "participantTypeaheadInputLabel")
	private WebElement alternateReviewerSearchLabel;

	@FindBy(id = "participantTypeaheadInput")
	private WebElement alternateReviewerSearchField;

	@FindBy(id = "searchIcon-participantTypeaheadInput")
	private WebElement alternateReviewerSearchIcon;

	@FindBy(className = "uib-typeahead-match")
	private List<WebElement> reviewerSearchList;

	@FindBy(id = "reviewerStartDateLabel")
	private WebElement startDateSearchLabel;

	@FindBy(id = "reviewerStartDate")
	private WebElement startDateSearch;

	@FindBy(id = "reviewerEndDateLabel")
	private WebElement endDateSearchLabel;

	@FindBy(id = "reviewerEndDate")
	private WebElement endDateSearch;

	@FindBy(id = "reason-label")
	private WebElement reasonLabel;

	@FindBy(id = "reason-button")
	private WebElement reasonDropDown;

	@FindBy(xpath = "//li[contains(@id,'reason-option-')]")
	private List<WebElement> reasonOptions;

	@FindBy(id = "alternateReviewerFormSubmitButton")
	private WebElement alternateReviewerSaveButton;

	@FindBy(id = "modalCloseBtnFooter")
	private WebElement alternateReviewerCloseButton;

	@FindBy(id = "participantTypeaheadInputValidationText")
	private WebElement reviewerSearchError;

	@FindBy(id = "reviewerStartDateValidationText")
	private WebElement reviewerStartDateError;

	@FindBy(id = "reviewerEndDateValidationText")
	private WebElement reviewerEndDateError;

	@FindBy(id = "reasonValidationText")
	private WebElement reviewerReasonError;

	//Payment Preference
	@FindBy(id = "howWouldYouLikeToReceiveReimbursementPaymentsHeaderText")
	private WebElement paymentPreference;

	@FindBy(id = "whatProgramWouldYouLikeToUseHeaderText")
	private WebElement program;

	@FindBy(id = "whoIsYourEducationProviderHeaderText")
	private WebElement provider;

	@FindBy(id = "whatWillBeYourDegreeHeaderText")
	private WebElement degree;

	@FindBy(id = "paymentPreference1")
	private WebElement paymentPreferenceCheck;

	@FindBy(id = "savePaymentPreferenceButton")
	private WebElement paymentPreferenceSave;

	@FindBy(id = "paymentPreference2")
	private WebElement paymentPreferenceEDeposit;

	@FindBy(id = "paymentPreference1Label")
	private WebElement paymentPreferenceCheckLabel;

	@FindBy(id = "paymentPreference2Label")
	private WebElement paymentPreferenceEDepositLabel;

	@FindBy(id = "paymentPreferenceType2Label")
	private WebElement paymentPreferenceMobileLabel;

	@FindBy(id = "paymentPreferencePhoneNumberInput")
	private WebElement paymentPreferencePhoneInput;

	@FindBy(id = "linkContactInfoButton")
	private WebElement paymentPreferenceLinkContactInfo;

	@FindBy (className = "payment-preference-modal")
	private WebElement overlayTitle;

	@FindBy(id = "termsConditionsLabel")
	private WebElement paymentPreferenceZeleTerms;

	@FindBy(id = "acceptTermsConditionsButton")
	private WebElement paymentPreferenceAcceptTerms;

	@FindBy (id = "profileContactInfoSaveButton")
	private WebElement contactInfoSaveButton;

	@FindBy (id = "profileContactInfoCancelButton")
	private WebElement contactInfoCancelButton;

	@FindBy (id = "providerinstructionreviewLabel")
	private WebElement providerInstructionCheckBox;

	//Your Application Reviewers
	@FindBy(id = "approverInformationTile")
	private WebElement approverInformationTile;

	@FindBy(xpath = "//profile-approver[@approval-level = '1']//span[@id = 'approverNameLevel']")
	private WebElement firstApproverName;

	@FindBy(xpath = "//profile-approver[@approval-level = '2']//span[@id = 'approverNameLevel']")
	private WebElement secondApproverName;

	@FindBy(xpath = "//profile-approver[@approval-level = '1']//span[@id = 'approverPhoneLevel']")
	private WebElement firstApproverPhone;

	@FindBy(xpath = "//profile-approver[@approval-level = '2']//span[@id = 'approverPhoneLevel']")
	private WebElement secondApproverPhone;

	@FindBy(xpath = "//profile-approver[@approval-level = '1']//span[@id = 'approverEmailLevel']")
	private WebElement firstApproverEmail;

	@FindBy(xpath = "//profile-approver[@approval-level = '2']//span[@id = 'approverEmailLevel']")
	private WebElement secondApproverEmail;

	@FindBy(id = "addressRadioGroup")
	private WebElement addressRadioGroup;

	@FindBy(id = "phoneRadioGroup")
	private WebElement phoneRadioGroup;

	@FindBy(id = "emailRadioGroup")
	private WebElement emailRadioGroup;

	@FindBy(id = "applicationErrorMessage")
	private WebElement genericErrorBanner;

	@FindBy(id = "modal")
	private WebElement modal;

	@FindBy(id = "yourAddressHeaderText")
	private WebElement yourAddressHeaderText;

	@FindBy(xpath = "//button[contains(text(), 'View More')]")
	private WebElement viewMoreButton;

	@FindBy(id = "whoElseWillYouSubmitApplicationsForHeaderText")
	private WebElement whoElseWillYouSubmitApplicationsForHeaderText;

	@FindBy (className = "add-dependent-btn")
	private WebElement addDependentBtn;

	@FindBy(id = "yourFamilyHeader")
	private WebElement yourFamilyHeader;

	@FindBy(id = "relationshipType-button")
	private WebElement relationshipTypeButton;

	@FindBy(id = "relationshipType-label")
	private WebElement relationshipTypeHeader;

	@FindBy(id = "relationshipType-option-0")
	private WebElement relationshipType0;

	@FindBy(id = "relationshipType-option-1")
	private WebElement relationshipType1;

	@FindBy(id = "firstNameLabelText")
	private WebElement dependentFirstNameLabel;

	@FindBy(id = "lastNameLabelText")
	private WebElement dependentLastNameLabel;

	@FindBy(id = "dateOfBirthLabel")
	private WebElement dateOfBirthLabel;

	@FindBy(id = "dependentAcknowledgementLabel")
	private WebElement dependentAcknowledgementLabel;

	@FindBy(id = "modalSubmitBtn")
	private WebElement modalSubmitBtn;

	@FindBy(id = "firstName")
	private WebElement dependentFirstProfile;

	@FindBy(id = "lastName")
	private WebElement dependentLastProfile;

	@FindBy(id = "dateOfBirth")
	private WebElement dateOfBirth;

	@FindBy(id = "dependentAcknowledgement")
	private WebElement dependentAcknowledgement;

	@FindBy(xpath = "//div[contains(@class, 'table-responsive')]/descendant::tr/td[1]")
	private List<WebElement> dependentFirstName;

	@FindBy(id = "appAlertBanner")
	private WebElement appAlertBanner;

	public WebElement getViewMoreButton() {
		return viewMoreButton;
	}

	public WebElement getYourAddressHeaderText() {
		return yourAddressHeaderText;
	}

	public WebElement getModal() {
		return modal;
	}

	public WebElement getAddressRadioGroup() {
		return addressRadioGroup;
	}

	public WebElement getPhoneRadioGroup() {
		return phoneRadioGroup;
	}

	public WebElement getEmailRadioGroup() {
		return emailRadioGroup;
	}

	public WebElement getProfileEdInfoCancelBtn() {
		return profileEdInfoCancelBtn;
	}

	public WebElement getChangePasswordButton() {
		return changePasswordButton;
	}

	public WebElement getNameText() {
		return nameText;
	}

	public WebElement getUsernameText() {
		return usernameText;
	}

	public WebElement getProviderEditButton() {
		return providerEditButton;
	}

	public WebElement getEducationInformationSaveButton() {
		return educationInformationSaveButton;
	}

	public WebElement getProviderSearchButton() {
		return providerSearchButton;
	}

	public WebElement getProviderSearchResultsTable() {
		return providerSearchResultsTable;
	}

	public WebElement getProviderName() {
		return providerName;
	}

	public WebElement getEducationProgramDropdown() {
		return educationProgramDropdown;
	}

	public WebElement getFieldOfStudyDropdown() {
		return fieldOfStudyDropdown;
	}

	public WebElement getTuitionAssistanceProgramButton() {
		return tuitionAssistanceProgramButton;
	}

	public WebElement getCertificationProgramButton() {
		return certificationProgramButton;
	}

	public WebElement getVirtualCardProgramButton() {
		return virtualCardProgramButton;
	}

	public WebElement getProgramModalText() {
		return ProgramModalText;
	}

	public WebElement getProgramModalOkButton() {
		return ProgramModalOkButton;
	}

	public WebElement getOtherCourseOfStudyInput() {
		return otherCourseOfStudyInput;
	}

	public WebElement getContinueButton() {
		return continueButton;
	}

	public WebElement getYourTeamHeader() {
		return yourTeamHeader;
	}

	public WebElement getYourTeamQuestionHeader() {
		return yourTeamQuestionHeader;
	}

	public WebElement getParticipantNameHeader() {
		return participantNameHeader;
	}

	public WebElement getEmployeeIDHeader() {
		return employeeIDHeader;
	}

	public WebElement getApprovalLevelHeader() {
		return approvalLevelHeader;
	}

	public WebElement getParticipantStatusHeader() {
		return participantStatusHeader;
	}

	public WebElement getParticipantRoleHeader() {
		return participantRoleHeader;
	}

	public WebElement getAlternateReviewerHeader() {
		return alternateReviewerHeader;
	}

	public WebElement getHeaderTooltipProxyReviewer() {
		return headerTooltipProxyReviewer;
	}

	public List<WebElement> getToolTipText() {
		return toolTipText;
	}

	public List<WebElement> getToolTipTextHeader() {
		return toolTipTextHeader;
	}

	public List<WebElement> getParticipantProxyEdit() {
		return participantProxyEdit;
	}

	public WebElement getEmployeeName() {
		return employeeName;
	}

	public WebElement getEmployeeID() {
		return employeeID;
	}

	public WebElement getApprovalLevel() {
		return approvalLevel;
	}

	public WebElement getYourTeamMemberStatus() {
		return yourTeamMemberStatus;
	}

	public WebElement getYourTeamMemberRole() {
		return yourTeamMemberRole;
	}

	public WebElement getAlternateReviewerModalHeader() {
		return alternateReviewerModalHeader;
	}

	public WebElement getAlternateReviewerTxt() {
		return alternateReviewerTxt;
	}

	public WebElement getAlternateReviewerSearchLabel() {
		return alternateReviewerSearchLabel;
	}

	public WebElement getAlternateReviewerSearchField() {
		return alternateReviewerSearchField;
	}

	public WebElement getAlternateReviewerSearchIcon() {
		return alternateReviewerSearchIcon;
	}

	public List<WebElement> getReviewerSearchList() {
		return reviewerSearchList;
	}

	public WebElement getStartDateSearchLabel() {
		return startDateSearchLabel;
	}

	public WebElement getStartDateSearch() {
		return startDateSearch;
	}

	public WebElement getEndDateSearchLabel() {
		return endDateSearchLabel;
	}

	public WebElement getEndDateSearch() {
		return endDateSearch;
	}

	public WebElement getReasonLabel() {
		return reasonLabel;
	}

	public WebElement getReasonDropDown() {
		return reasonDropDown;
	}

	public List<WebElement> getReasonOptions() {
		return reasonOptions;
	}

	public WebElement getAlternateReviewerSaveButton() {
		return alternateReviewerSaveButton;
	}

	public WebElement getAlternateReviewerCloseButton() {
		return alternateReviewerCloseButton;
	}

	public WebElement getReviewerSearchError() {
		return reviewerSearchError;
	}

	public WebElement getReviewerStartDateError() {
		return reviewerStartDateError;
	}

	public WebElement getReviewerEndDateError() {
		return reviewerEndDateError;
	}

	public WebElement getReviewerReasonError() {
		return reviewerReasonError;
	}

	public WebElement getPaymentPreference() {
		return paymentPreference;
	}

	public WebElement getProgram() {
		return program;
	}

	public WebElement getProvider() {
		return provider;
	}

	public WebElement getDegree() {
		return degree;
	}

	public WebElement getPaymentPreferenceCheck() {
		return paymentPreferenceCheck;
	}

	public WebElement getPaymentPreferenceEDeposit() {
		return paymentPreferenceEDeposit;
	}

	public WebElement getPaymentPreferenceSave() {
		return paymentPreferenceSave;
	}

	public WebElement getPaymentPreferenceCheckLabel() {
		return paymentPreferenceCheckLabel;
	}

	public WebElement getPaymentPreferenceEDepositLabel() {
		return paymentPreferenceEDepositLabel;
	}

	public WebElement getPaymentPreferenceMobileLabel() {
		return paymentPreferenceMobileLabel;
	}

	public WebElement getPaymentPreferenceLinkContactInfo() {
		return paymentPreferenceLinkContactInfo;
	}

	public WebElement getOverlayTitle() {
		return overlayTitle;
	}

	public WebElement getPaymentPreferenceZeleTerms() {
		return paymentPreferenceZeleTerms;
	}

	public WebElement getPaymentPreferenceAcceptTerms() {
		return paymentPreferenceAcceptTerms;
	}

	public WebElement getPaymentPreferencePhoneInput() {
		return paymentPreferencePhoneInput;
	}

	public WebElement getContactInfoSaveButton() {
		return contactInfoSaveButton;
	}

	public WebElement getContactInfoCancelButton() {
		return contactInfoCancelButton;
	}

	public WebElement getProviderInstructionCheckBox() {
		return providerInstructionCheckBox;
	}

	public WebElement getApproverInformationTile() {
	    return approverInformationTile;
    }

	public WebElement getFirstApproverName() {
		return firstApproverName;
	}

	public WebElement getSecondApproverName() {
		return secondApproverName;
	}

	public WebElement getFirstApproverPhone() {
		return firstApproverPhone;
	}

	public WebElement getSecondApproverPhone() {
		return secondApproverPhone;
	}

	public WebElement getFirstApproverEmail() {
		return firstApproverEmail;
	}

	public WebElement getSecondApproverEmail() {
		return secondApproverEmail;
	}

	public WebElement getProgramsRadioGroup() {
		return programsRadioGroup;
	}

	public WebElement getGenericErrorBanner() {
		return genericErrorBanner;
	}

	public WebElement getWhoElseWillYouSubmitApplicationsForHeaderText() {
		return whoElseWillYouSubmitApplicationsForHeaderText;
	}

	public WebElement getAddDependentBtn() {
		return addDependentBtn;
	}

	public WebElement getYourFamilyHeader() {
		return yourFamilyHeader;
	}

	public WebElement getRelationshipTypeHeader() {
		return relationshipTypeHeader;
	}

	public WebElement getRelationshipTypeButton() {
		return relationshipTypeButton;
	}

	public WebElement getRelationshipType0() {
		return relationshipType0;
	}

	public WebElement getRelationshipType1() {
		return relationshipType1;
	}

	public WebElement getDependentFirstNameLabel() {
		return dependentFirstNameLabel;
	}

	public WebElement getDependentLastNameLabel() {
		return dependentLastNameLabel;
	}

	public WebElement getDateOfBirthLabel() {
		return dateOfBirthLabel;
	}

	public WebElement getDependentAcknowledgementLabel() {
		return dependentAcknowledgementLabel;
	}

	public WebElement getModalSubmitBtn() {
		return modalSubmitBtn;
	}

	public WebElement getDependentFirstProfile() {
		return dependentFirstProfile;
	}

	public WebElement getDependentLastProfile() {
		return dependentLastProfile;
	}

	public WebElement getDateOfBirth() {
		return dateOfBirth;
	}

	public WebElement getDependentAcknowledgement() {
		return dependentAcknowledgement;
	}

	public List<WebElement> getDependentFirstName() {
		return dependentFirstName;
	}

	public WebElement getAppAlertBanner() {
		return appAlertBanner;
	}

	public WebElement getEducationProfileSave() {
		return educationProfileSave;
	}
}
