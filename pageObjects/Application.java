package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class Application {

    public Application(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "application";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "contactInformationEditButton")
    private WebElement contactInformationEditButton;

    @FindBy(id = "contactInformationPhone")
    private WebElement phoneText;

    @FindBy(id  = "contactInformationEmail")
    private WebElement emailText;

    @FindBy(id  = "programsEditButton")
    private WebElement programseEditButton;

    @FindBy(id  = "programsEmployeeProgram")
    private WebElement employeeProgramText;

    @FindBy(id  = "programsEmployeeProgramModalButton")
    private WebElement employeeProgramModalButton;

    @FindBy(id  = "programsEducationProgram")
    private WebElement educationProgramText;

    @FindBy(id  = "programSpecialty")
    private WebElement specialityText;

    @FindBy(xpath = "//dt[text()='Other Field of Study']/following-sibling::dd")
    private WebElement otherFOS;

    @FindBy(xpath = "//dt[text()='Student']/following-sibling::dd")
    private WebElement studentName;

    @FindBy(xpath = "//dt[text()='Academic Calendar']/following-sibling::dd")
    private WebElement academicCalendar;

    @FindBy(xpath = "//dt[text()='Term']/following-sibling::dd")
    private WebElement term;

    @FindBy(id  = "programsName")
    private WebElement providerNameText;

    @FindBy(id  = "programsProviderCode")
    private WebElement providerCodeText;

    @FindBy(id  = "programsAddress1")
    private WebElement providerAddressText;

    @FindBy(id  = "programsAddress2")
    private WebElement providerAddress2Text;

    @FindBy(id  = "programsAddress3")
    private WebElement providerAddress3Text;

    @FindBy(id  = "coursesAndExpensesHeaderText")
    private WebElement coursesAndExpensesHeader;

    @FindBy(id  = "expensesHeaderText")
    private WebElement expensesHeaderText;

    @FindBy(id  = "expensesEditButton")
    private WebElement coursesAndExpensesEditButton;

    @FindBy(id = "coursesExpensesSessionDates")
    private WebElement sessionDatesText;

    @FindBy(xpath = "//dt[text()='Session Start Date']/following-sibling::dd")
    private WebElement sessionStartDate;

    @FindBy(xpath = "//dt[text()='Session End Date']/following-sibling::dd")
    private WebElement sessionEndDate;

    @FindBy(id = "coursesExpensesCourseName")
    private WebElement courseAndExpensesName;

    @FindBy(id = "coursesExpensesCourseCredits")
    private WebElement creditsText;

    @FindBy(id = "coursesExpensesCourseGrade")
    private WebElement gradeText;

    @FindBy(id = "coursesExpensesCourseVerified")
    private WebElement verifiedText;

    @FindBy(id = "coursesExpensesCourseViewMoreButton")
    private WebElement viewMoreButton;

    @FindBy(id = "coursesExpensesCourseRequested")
    private WebElement requestedText;

    @FindBy(id = "coursesExpensesCourseTotalBenefitAmount")
    private WebElement totalBenefitText;

    @FindBy(id = "agreementsEditButton")
    private WebElement agreementsEditButton;

    @FindBy(id = "agreementsGrantsScholarshipsAmount")
    private WebElement grantsScholarshipsDiscountsText;

    @FindBy(id = "grantScholarshipDiscount")
    private WebElement grantScholarshipDiscount;

    @FindBy(id = "reviewSubmitApplicationButton")
    private WebElement submitApplicationButton;

    @FindBy(id = "reviewSubmitCancelApplicationButton")
    private WebElement cancelButton;

    @FindBy(id = "cancelApplicationButton")
    private WebElement cancelApplicationButton;

    @FindBy(id = "editApplicationButton")
    private WebElement editApplicationButton;

    @FindBy(id = "submittedAppAddOtherExpenseBtn")
    private WebElement addOtherExpenseButton;

    @FindBy(id = "comments")
    private WebElement cancelApplicationConfirmationInput;

    @FindBy(id = "summaryComment")
    private WebElement applicationConfirmationCommentInput;

    @FindBy(id = "submittedApplicationActionMenuButton")
    private WebElement submittedApplicationActionMenuButton;

    @FindBy(id = "applicationCancelConfirmationYes")
    private WebElement cancelApplicationConfirmationYes;

    @FindBy(id = "applicationCancelConfirmationNo")
    private WebElement cancelApplicationConfirmationNo;

    @FindBy(id = "approveApplicationButton")
    private WebElement approveApplicationButton;

    @FindBy(id = "reviewApplicationCommentsBox")
    private WebElement approveApplicationCommentTextInput;

    @FindBy(id = "cancelApplicationWithCommentsButton")
    private WebElement cancelApprovalWithCommentsButton;

    @FindBy(id = "approveApplicationWithCommentsButton")
    private WebElement approveApplicationWithCommentsButton;

    @FindBy(id = "denyApplicationButton")
    private WebElement denyApplicationButton;

    @FindBy(id = "reviewApplicationCommentsBox")
    private WebElement denyApplicationCommentTextInput;

    @FindBy(id = "cancelApplicationWithCommentsButton")
    private WebElement cancelDenialWithCommentsButton;

    @FindBy(id = "denyApplicationWithCommentsButton")
    private WebElement denyApplicationWithCommentsButton;

    @FindBy(id = "supportingDocumentationSelectFileLink")
    private WebElement selectFileLink;

    @FindBy(id = "supportingDocumentationFileSelectedHeaderText")
    private WebElement uploadDocSuccessMessage;

    @FindBy(id = "documentType-dropdown")
    private WebElement documentTypeDropdown;

    @FindBy(id = "documentType-button")
    private WebElement documentTypeButton;

    @FindBy(xpath = "//span[text()='Appeal']")
    private WebElement appealsOptionInDropDown;

    @FindBy(id = "courseGradeComboBoxesmath101-dropdown")
    private WebElement gradeListBox;

    @FindBy(id = "supportingDocumentComment")
    private WebElement commentText;

    @FindBy(id = "supportingDocumentationSubmitDocumentButton")
    private WebElement submitDocumentButton;

    @FindBy(id = "supportingDocumentationCancelDocumentButton")
    private WebElement cancelDocumentButton;

    @FindBy(id = "supportingDocumentationDocument0")
    private WebElement supportingDocument1;

    @FindBy(id = "supportingDocumentationDocument1")
    private WebElement supportingDocument2;

    @FindBy(id = "supportingDocumentationDocument2")
    private WebElement supportingDocument3;

    @FindBy(id = "lrpAddLoanStep3SubmitButton")
    private WebElement step3ContinueBtn;

    @FindBy(id = "saveForLaterButton")
    private WebElement saveApplicationForLaterButton;

    @FindBy(id = "deleteApplicationButton")
    private WebElement deleteApplicationButton;

    @FindBy(id = "summaryComment")
    private WebElement summaryCommentInput;

    @FindBy (xpath = "//textarea[@name='summaryComment']")
    private WebElement placeholderPurposeStmt;

    @FindBy(id = "summaryCommentValidationText")
    private WebElement requiredMessage;

    @FindBy(id = "appSummaryLinkedAppBtn")
    private WebElement appSummaryLinkedAppBtn;

    @FindBy(id ="viewAllStatusHistoryButton")
    private WebElement appSummaryViewAllStatusHistoryBtn;

    @FindBy(className = "status-history-msg-aut-test-0")
    private WebElement statusHistoryMsgAutTest0;

    @FindBy(className = "application-status-block-container")
    private List<WebElement> appSummaryHistoryStatus;

    @FindBy(className = "status-history-aut-test-0")
    private WebElement messageStatusHistoryAutTest;

    @FindBy(className = "message-from-aut-test-0")
    private WebElement messageFromAutTest;

    @FindBy(id = "statusHistoryBlockStatus")
    private WebElement applicationStatus;

    @FindBy(id = "examGradeErrText")
    private WebElement examGradeErrText;

    @FindBy(id = "courseGradeErrText")
    private WebElement courseGradeErrText;

    @FindBy(className = "forwardedToSupervisorForReviewStatusHistoryText")
    private List<WebElement> appSummaryStatus1Text;

    @FindBy(className = "virtualCreditCardIssuedStatusHistoryText")
    private List<WebElement> appStatusHistoryVirtualCreditCardIssued;

    @FindBy(className = "submittedPendingReviewStatusHistoryText")
    private List<WebElement> appStatusHistoryPendingReview;

    @FindBy(className = "submittedIncompleteStatusHistoryText")
    private List<WebElement> appStatusHistorySubmittedIncomplete;

    @FindBy(className = "savedNotSubmittedStatusHistoryText")
    private List<WebElement> appStatusHistorySavedNotSubmitted;

    @FindBy(className = "deniedStatusHistoryText")
    private List<WebElement> appStatusHistoryDenied;

    @FindBy(className = "application-status")
    private WebElement appActionNeededStatus;

    @FindBy(id = "addNewCommentButton")
    private WebElement appSummaryAddNewCommentBtn;

    @FindBy(id = "commentsTextAreaInput")
    private WebElement appSummaryCommentInput;

    @FindBy(id = "saveCommentButton")
    private WebElement appSummarySaveCommentBtn;

    @FindBy(id = "cancelCloseCommentsBoxButton")
    private WebElement appSummaryCancelBtn;

    @FindBy(id = "deleteCommentButtonIcon")
    private WebElement appSummaryDeleteCommentBtn;

    @FindBy(id = "programsEmployeeProgramModalButton")
    private WebElement appSummaryProgramModalBtn;

    @FindBy(id = "whatDocumentTypesAreSupportedButton")
    private WebElement appSummarywhatDocumentTypesAreSupportedBtn;

    @FindBy(id = "submittedAppAddOtherExpenseBtn")
    private WebElement submittedAppAddOtherExpenseBtn;

    @FindBy(id = "addCourseRelatedExpenseButton")
    private WebElement addCourseRelatedExpenseButton;

    @FindBy(id = "relatedCourse-dropdown")
    private WebElement relatedCourseDropdown;

    @FindBy(id = "relatedCourse-button")
    private WebElement relatedCourseButton;

    @FindBy(id = "numberOfBooks")
    private WebElement numberOfBooks;

    @FindBy(id = "expenseRequestedAmount")
    private WebElement expenseRequestedAmount;

    @FindBy(id = "cancelAddCourseRelatedExpenseButton")
    private WebElement cancelRelatedExpense;

    @FindBy(className = "card-item")
    private List<WebElement> relatedExpenseCard;

    @FindBy(id = "saveEditCourseRelatedExpenseButton")
    private WebElement saveEditCourseRelatedExpenseButton;

    @FindBy(id = "removeCourseExpense1Button")
    private WebElement removeSecondCourseExpense;

    @FindBy(id = "editCourseExpense0Button")
    private WebElement editFirstCourseExpense;

    @FindBy(id = "removeCourseExpense0Button")
    private WebElement removeFirstCourseExpense;

    @FindBy(id = "grantsEligibleRadioGroup2Label")
    private WebElement eligibleGrantsNoRadioLabel;

    @FindBy(id = "agreement1CheckboxLabel")
    private WebElement agreement1Label;

    @FindBy(id = "signature")
    private WebElement signatureInput;

    @FindBy(id = "coursesExpensesCourseTotalRequested")
    private WebElement coursesExpensesRequested;

    @FindBy(id = "coursesExpensesCourseTotalApproved")
    private WebElement coursesExpensesApproved;

    @FindBy(id = "agreementsViewMoreButton")
    private WebElement viewMoreAgreementButton;

    @FindBy(id = "degreeComplete1Label")
    private WebElement degreeCompleteYesLabel;

    @FindBy(id = "seeCreditCardDetailsButton")
    private WebElement seeCreditCardDetailsButton;

    @FindBy(id = "paymentPreferenceHeader")
    private WebElement paymentPreferenceHeader;

    @FindBy(id = "howWouldYouLikeToReceiveReimbursementPaymentsHeaderText")
    private WebElement paymentPreferenceQuestion;

    @FindBy(id = "paymentPreference1Label")
    private WebElement paymentPreferenceCheckLabel;

    @FindBy(id = "paymentPreference2Label")
    private WebElement paymentPreferenceEDepositLabel;

    @FindBy(id = "paymentPreferencePhoneNumberInput")
    private WebElement paymentPreferencePhoneInput;

    @FindBy(id = "paymentPreferenceType2Label")
    private WebElement paymentPreferenceMobileLabel;

    @FindBy(id = "linkContactInfoButton")
    private WebElement paymentPreferenceLinkContactInfo;

    @FindBy(id = "acceptTermsConditionsButton")
    private WebElement paymentPreferenceAcceptTerms;

    @FindBy(id = "appAccountLinkedConfirm")
    private WebElement accountLinked;

    @FindBy(id = "paymentPreference1")
    private WebElement paymentPreferenceCheck;

    @FindBy(id = "paymentPreference2")
    private WebElement paymentPreferenceEDeposit;

    @FindBy(id = "savePaymentPreferenceButton")
    private WebElement paymentPreferenceSave;

    @FindBy(id= "commentsHeaderText")
    private WebElement commentsHeaderText;

    @FindBy(id= "programsHeaderText")
    private WebElement programsHeaderText;

    @FindBy(id = "supportingDocumentationHeaderText")
    private WebElement supportingDocumentationHeaderText;

    @FindBy(className = "comments-aut-test")
    private WebElement commentsEntered;

    @FindBy(id = "supportingDocumentationDocumentStatus0")
    private WebElement statusOfDocumentUploaded;

    @FindBy(id = "supportingDocumentationDocumentStatus1")
    private WebElement statusOfDocumentUploaded1;

    @FindBy(className = "fa-trash-o")
    private WebElement documentDelete;

    @FindBy(className = "modal-content")
    private WebElement modalContent;

    @FindBy(id = "modal-content-inner")
    private WebElement modalBody;

    @FindBy(id = "genericConfirmationYesBtn")
    private WebElement confirm;

    @FindBy(className = "application-action-block")
    private List<WebElement> supportingDocuments;

    @FindBy(id = "printFaxCoverSheetButton")
    private WebElement printFaxCoverSheetButton;

    @FindBy(id = "closeSupportedDocumentsModal")
    private WebElement closeSupportedDocumentsModal;

    @FindBy(id = "signedAgreementDate")
    private WebElement signedAgreementDate;

    public WebElement getSignedAgreementDate() {
        return signedAgreementDate;
    }

    @FindBy (id = "courseExpenseDescription0")
    private WebElement firstCourseExpenseDescription;

    @FindBy (id = "courseExpenseDescription1")
    private WebElement secondCourseExpenseDescription;

    @FindBy (id = "courseExpenseDescription2")
    private WebElement thirdCourseExpenseDescription;

    @FindBy (id = "courseExpenseDescription3")
    private WebElement fourthCourseExpenseDescription;

    @FindBy (id = "courseExpenseDescription4")
    private WebElement fifthCourseExpenseDescription;

    @FindBy (id = "courseExpenseCost0")
    private WebElement firstNonCourseExpenseRequestedAmt;

    @FindBy (id = "courseExpenseCost1")
    private WebElement secondNonCourseExpenseRequestedAmt;

    @FindBy (id = "registerWithZelleBtn")
    private WebElement registerWithZelleBtn;

    @FindBy (xpath = "//*[contains(@id,'courseExpenseCost')]")
    private List<WebElement> courseExpenseCosts;

    @FindBy (id = "appealDeniedApplicationButton")
    private WebElement appealDenyButton;

    @FindBy (id = "cancelAppealButton")
    private WebElement cancelAppealButton;

    @FindBy (id = "modalSubmitBtn")
    private WebElement continueToWebsiteButton;

    @FindBy(id = "courseGradeComboBoxesExam")
    private WebElement courseGradeComboBoxesExam;

    @FindBy (className = "application-status")
    private WebElement applicationStatusHeaderStatus;

    @FindBy (className = "loading")
    private WebElement loadingSpinner;

    @FindBy (id = "statusHistoryHeaderText")
    private WebElement statusHistoryHeaderText;

    @FindBy (id = "appAlertBanner")
    private WebElement applicationHasBeenSavedBanner;

    @FindBy(id = "coursesExpensesCourseNumber")
    private WebElement coursesExpensesCourseNumber;

    @FindBy(id = "tuitionAmt")
    private WebElement tuitionAmt;

    @FindBy(id = "numOfBooks")
    private WebElement numOfBooks;

    @FindBy(id = "requestedBooksAmt")
    private WebElement requestedBooksAmt;

    @FindBy(id = "discountAmt")
    private WebElement discountAmt;

    @FindBy(id = "coursesRequestedAmt")
    private WebElement coursesRequestedAmt;

    @FindBy(id = "coursesApprovalAmt")
    private WebElement coursesApprovalAmt;

    @FindBy(id = "coursesPaidAmt")
    private WebElement coursesPaidAmt;

    @FindBy(id = "coursesExpensesCourseViewMoreButton")
    private WebElement coursesViewMoreButton;

    @FindBy (id = "agreementsHeaderText")
    private WebElement agreementsHeaderText;

    @FindBy (id = "reviewSubmitTileHeader")
    private WebElement reviewSubmitTileHeader;

    @FindBy (id = "accessLetterOfCreditButton")
    private WebElement accessLetterOfCreditButton;

    @FindBy (id = "contactInformationCancelButton")
    private WebElement contactInformationCancelButton;

    @FindBy(className = "application-reason-text")
    private WebElement appReasonText;

    @FindBy (id = "navigateToParentAppLink")
    private WebElement navigateToParentAppLink;

    @FindBy (id= "accessLetterOfCreditButton")
    private WebElement letterOfCreditButton;

    @FindBy (id = "modal-title")
    private WebElement overlayTitle;

    @FindBy (id = "modalCloseButton")
    private WebElement modalCloseButton;

    @FindBy (id = "expenseTypeName-dropdown")
    private WebElement expenseTypeNameDropdown;

    @FindBy(className = "agreement-header-aut")
    private WebElement agreementHeader;

    @FindBy(className = "agreement-text-aut")
    private WebElement agreementText;

    @FindBy (id = "ferpaAgreementCheckboxLabel")
    private WebElement agreementCheckboxLabel;

    @FindBy(className= "status-history-msg-aut-test-1")
    private WebElement statusHistoryMsg1;

    @FindBy(id= "submittedApplicationSavedBanner")
    private WebElement submittedApplicationSavedBanner;

    @FindBy(id= "courseExpenseViewMoreBtn")
    private WebElement nonCourseExpenseViewMoreBtn;

    @FindBy(id= "nonCourseExpensesRequestedAmt")
    private WebElement nonCourseExpensesRequestedAmt;

    @FindBy(id= "nonCourseExpensesApprovalAmt")
    private WebElement nonCourseExpensesApprovalAmt;

    @FindBy(id= "nonCourseExpensesPaidAmt")
    private WebElement nonCourseExpensesPaidAmt;

    @FindBy(className= "status-history-msg-aut-test-0")
    private WebElement statusHistoryMsg0;

    @FindBy(className= "status-history-msg-aut-test-3")
    private WebElement statusHistoryMsg3;

    @FindBy(className = "checkbox-label")
    private WebElement agreementCheckbox;

    @FindBy(id = "graduationDate")
    private WebElement graduationDate;

    @FindBy(className = "comment-list-box")
    private List<WebElement> commentContainer;

    @FindBy(id = "termsConditionsLabel")
    private WebElement termsConditionsCheckbox;

    @FindBy(className = "help-block")
    private WebElement commentValidationText;

    public WebElement getCommentValidationText() {
        return commentValidationText;
    }

    @FindBy(id = "purposeHeaderText")
    private WebElement purposeHeaderText;

    @FindBy(id = "applicationDetailPurpose")
    private WebElement purposeComment;

    @FindBy(id = "supportingDocumentationUploadedDate0")
    private WebElement documentUploadedDate;

    @FindBy(id = "supportingDocumentationDateReviewed0")
    private WebElement documentReviewedDate;

    @FindBy(id = "deleteAppDocumentBtn")
    private WebElement deleteDocumentButton;

    @FindBy(id = "subscriptionAmount")
    private WebElement subscriptionAmount;

    @FindBy(id = "edAccessSubscriptionTaxExempt")
    private WebElement edAccessSubscriptionTaxExempt;

    @FindBy(id = "edAccessSubscriptionCost")
    private WebElement edAccessSubscriptionCost;

    @FindBy(id = "coursesExpensesCourseRequested")
    private WebElement courseRequested;

    @FindBy(className = "maintainSkills-test")
    private WebElement maintainSkillsQuestion;

    @FindBy(className = "minQuals-test")
    private WebElement minQualsQuestion;

    @FindBy(className = "career-test")
    private WebElement careerQuestion;

    @FindBy(id = "courseExpenseViewMoreBtn")
    private WebElement courseExpenseViewMoreBtn;

    @FindBy(id = "supportLiveChatButton-fixed")
    private WebElement livePersonButton;

    @FindBy(xpath = "//expense-card")
    private List<WebElement> expenseCardList;

    @FindBy(xpath = "//dt[text() = 'Student']")
    private WebElement studentField;

    @FindBy (xpath = "//dt[text()='Credits']/following-sibling::dd")
    private WebElement credits;

    @FindBy (id = "openUserProfileLink")
    private WebElement pptNameLink;

    @FindBy(xpath = "//button/span[contains(text(),'Back to Search Results')]")
    private WebElement backToSearchResults;

    public WebElement getStudentField() {
        return studentField;
    }

    public List<WebElement> getExpenseCardList() {
        return expenseCardList;
    }

    public WebElement getCoursesExpensesRequested() {
        return coursesExpensesRequested;
    }

    public WebElement getCourseExpenseViewMoreBtn() {
        return courseExpenseViewMoreBtn;
    }

    public WebElement getMaintainSkillsQuestion() {
        return maintainSkillsQuestion;
    }

    public WebElement getMinQualsQuestion() {
        return minQualsQuestion;
    }

    public WebElement getCareerQuestion() {
        return careerQuestion;
    }

    public WebElement getCourseRequested() {
        return courseRequested;
    }

    public WebElement getEdAccessSubscriptionTaxExempt() {
        return edAccessSubscriptionTaxExempt;
    }

    public WebElement getEdAccessSubscriptionCost() {
        return edAccessSubscriptionCost;
    }

    public WebElement getSubscriptionAmount() {
        return subscriptionAmount;
    }

    public WebElement getAgreementCheckbox() {
        return agreementCheckbox;
    }

    public WebElement getExpenseTypeNameDropdown() {
        return expenseTypeNameDropdown;
    }

    public WebElement getModalCloseButton() {
        return modalCloseButton;
    }

    public WebElement getOverlayTitle() {
        return overlayTitle;
    }

    public WebElement getNavigateToParentAppLink() {
        return navigateToParentAppLink;
    }

    public WebElement getReviewSubmitTileHeader() {
        return reviewSubmitTileHeader;
    }

    public WebElement getAgreementsHeaderText() {
        return agreementsHeaderText;
    }

    public WebElement getApplicationHasBeenSavedBanner() {
        return applicationHasBeenSavedBanner;
    }

    public WebElement getAppSummaryLinkedAppBtn() {
        return appSummaryLinkedAppBtn;
    }

    public WebElement getPhoneText() {
        return phoneText;
    }

    public WebElement getEmailText() {
        return emailText;
    }

    public WebElement getEmployeeProgramText() {
        return employeeProgramText;
    }

    public WebElement getEducationProgramText() {
            return educationProgramText;
    }

    public WebElement getSpecialityText() {
        return specialityText;
    }

    public WebElement getStudentName() {
        return studentName;
    }

    public WebElement getAcademicCalendar() {
        return academicCalendar;
    }

    public WebElement getTerm() {
        return term;
    }

    public WebElement getProviderNameText() {
        return providerNameText;
    }

    public WebElement getProviderCodeText() {
        return providerCodeText;
    }

    public WebElement getProviderAddressText() {
        return providerAddressText;
    }

    public WebElement getProviderAddress2Text() {
        return providerAddress2Text;
    }

    public WebElement getProviderAddress3Text() {
        return providerAddress3Text;
    }

    public WebElement getContactInformationEditButton() {
        return contactInformationEditButton;
    }

    public WebElement getProgramseEditButton() {
        return programseEditButton;
    }

    public WebElement getEmployeeProgramModalButton() {
        return employeeProgramModalButton;
    }

    public WebElement getExpensesHeaderText() {
        return expensesHeaderText;
    }

    public WebElement getCoursesAndExpensesHeader() {
        return coursesAndExpensesHeader;
    }

    public WebElement getCoursesAndExpensesEditButton() {
        return coursesAndExpensesEditButton;
    }

    public WebElement getSessionDatesText() {
        return sessionDatesText;
    }

    public WebElement getCreditsText() {
        return creditsText;
    }

    public WebElement getGradeText() {
        return gradeText;
    }

    public WebElement getVerifiedText() {
        return verifiedText;
    }

    public WebElement getViewMoreButton() {
        return viewMoreButton;
    }

    public WebElement getAgreementsEditButton() {
        return agreementsEditButton;
    }

    public WebElement getRequestedText() {
        return requestedText;
    }

    public WebElement getTotalBenefitText() {
        return totalBenefitText;
    }

    public WebElement getGrantsScholarshipsDiscountsText() {
        return grantsScholarshipsDiscountsText;
    }

    public WebElement getGrantScholarshipDiscount() {
        return grantScholarshipDiscount;
    }

    public WebElement getSubmitApplicationButton() {
        return submitApplicationButton;
    }

    public WebElement getCancelApplicationConfirmationInput() {
        return cancelApplicationConfirmationInput;
    }

    public WebElement getApplicationConfirmationCommentInput() {
        return applicationConfirmationCommentInput;
    }

    public WebElement getSubmittedApplicationActionMenuButton() {
        return submittedApplicationActionMenuButton;
    }

    public WebElement getCancelApplicationConfirmationYes() {
        return cancelApplicationConfirmationYes;
    }

    public WebElement getCancelApplicationConfirmationNo() {
        return cancelApplicationConfirmationNo;
    }

    public WebElement getApproveApplicationButton() {
        return approveApplicationButton;
    }

    public WebElement getApproveApplicationCommentTextInput() {
        return approveApplicationCommentTextInput;
    }

    public WebElement getCancelApprovalWithCommentsButton() {
        return cancelApprovalWithCommentsButton;
    }

    public WebElement getApproveApplicationWithCommentsButton() {
        return approveApplicationWithCommentsButton;
    }

    public WebElement getDenyApplicationButton() {
        return denyApplicationButton;
    }

    public WebElement getDenyApplicationCommentTextInput() {
        return denyApplicationCommentTextInput;
    }

    public WebElement getCancelDenialWithCommentsButton() {
        return cancelDenialWithCommentsButton;
    }

    public WebElement getDenyApplicationWithCommentsButton() {
        return denyApplicationWithCommentsButton;
    }

    public WebElement getSelectFileLink() {
        return selectFileLink;
    }

    public WebElement getUploadDocSuccessMessage() {
        return uploadDocSuccessMessage;
    }

    public WebElement getDocumentTypeDropdown() {
        return documentTypeDropdown;
    }

    public WebElement getCommentText() {
        return commentText;
    }

    public WebElement getSubmitDocumentButton() {
        return submitDocumentButton;
    }

    public WebElement getCancelDocumentButton() {
        return cancelDocumentButton;
    }

    public WebElement getSupportingDocument1() {
        return supportingDocument1;
    }

    public WebElement getSupportingDocument2() {
        return supportingDocument2;
    }

    public WebElement getSupportingDocument3() {
        return supportingDocument3;
    }

    public WebElement getCancelApplicationButton() {
        return cancelApplicationButton;
    }

    public WebElement getStep3ContinueBtn() {
        return step3ContinueBtn;
    }

    public WebElement getSaveApplicationForLaterButton() {
        return saveApplicationForLaterButton;
    }

    public WebElement getDeleteApplicationButton() {
        return deleteApplicationButton;
    }

    public WebElement getCancelButton() {
        return cancelButton;
    }

    public WebElement getSummaryCommentInput() {
        return summaryCommentInput;
    }

    public WebElement getAppSummaryViewAllStatusHistoryBtn() {
        return appSummaryViewAllStatusHistoryBtn;
    }

    public List<WebElement> getAppSummaryHistoryStatus() {
        return appSummaryHistoryStatus;
    }

    public List<WebElement> getAppSummaryStatus1Text() {
        return appSummaryStatus1Text;
    }

    public WebElement getAppSummaryAddNewCommentBtn() {
        return appSummaryAddNewCommentBtn;
    }

    public WebElement getAppSummaryCommentInput() {
        return appSummaryCommentInput;
    }

    public WebElement getAppSummarySaveCommentBtn() {
        return appSummarySaveCommentBtn;
    }

    public WebElement getAppSummaryCancelBtn() {
        return appSummaryCancelBtn;
    }

    public WebElement getAppSummaryDeleteCommentBtn() {
        return appSummaryDeleteCommentBtn;
    }

    public WebElement getAppSummaryProgramModalBtn() {
        return appSummaryProgramModalBtn;
    }

    public WebElement getAppSummarywhatDocumentTypesAreSupportedBtn() {
        return appSummarywhatDocumentTypesAreSupportedBtn;
    }

    public WebElement getCoursesExpensesApproved() {
        return coursesExpensesApproved;
    }

    public WebElement getSignatureInput() {
        return signatureInput;
    }

    public WebElement getAgreement1Label() {
        return agreement1Label;
    }

    public WebElement getEligibleGrantsNoRadioLabel() {
        return eligibleGrantsNoRadioLabel;
    }

    public WebElement getEditFirstCourseExpense() {
        return editFirstCourseExpense;
    }

    public WebElement getRemoveSecondCourseExpense() {
        return removeSecondCourseExpense;
    }

    public WebElement getRemoveFirstCourseExpense() {
        return removeFirstCourseExpense;
    }

    public WebElement getSaveEditCourseRelatedExpenseButton() {
        return saveEditCourseRelatedExpenseButton;
    }

    public List<WebElement> getRelatedExpenseCard() {
        return relatedExpenseCard;
    }

    public WebElement getCancelRelatedExpense() {
        return cancelRelatedExpense;
    }

    public WebElement getExpenseRequestedAmount() {
        return expenseRequestedAmount;
    }

    public WebElement getNumberOfBooks() {
        return numberOfBooks;
    }

    public WebElement getRelatedCourseDropdown() {
        return relatedCourseDropdown;
    }

    public WebElement getAddCourseRelatedExpenseButton() {
        return addCourseRelatedExpenseButton;
    }

    public WebElement getSubmittedAppAddOtherExpenseBtn() {
        return submittedAppAddOtherExpenseBtn;
    }

    public WebElement getViewMoreAgreementButton() {
        return viewMoreAgreementButton;
    }

    public WebElement getCourseAndExpensesName() {
        return courseAndExpensesName;
    }

    public WebElement getApplicationStatus() {
        return applicationStatus;
    }

    public WebElement getEditApplicationButton() {
        return editApplicationButton;
    }

    public WebElement getAddOtherExpenseButton() {
        return addOtherExpenseButton;
    }

    public WebElement getGradeListBox() {
        return gradeListBox;
    }

    public List<WebElement> getAppStatusHistoryVirtualCreditCardIssued() {
        return appStatusHistoryVirtualCreditCardIssued;
    }

    public List<WebElement> getAppStatusHistoryPendingReview() {
        return appStatusHistoryPendingReview;
    }

    public List<WebElement> getAppStatusHistorySubmittedIncomplete() {
        return appStatusHistorySubmittedIncomplete;
    }

    public List<WebElement> getAppStatusHistorySavedNotSubmitted() {
        return appStatusHistorySavedNotSubmitted;
    }

    public List<WebElement> getAppStatusHistoryDenied() {
        return appStatusHistoryDenied;
    }

    public WebElement getDegreeCompleteYesLabel() {
        return degreeCompleteYesLabel;
    }

    public WebElement getSeeCreditCardDetailsButton() {
        return seeCreditCardDetailsButton;
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

    public WebElement getPaymentPreferencePhoneInput() {
        return paymentPreferencePhoneInput;
    }

    public WebElement getPaymentPreferenceMobileLabel() {
        return paymentPreferenceMobileLabel;
    }

    public WebElement getPaymentPreferenceLinkContactInfo() {
        return paymentPreferenceLinkContactInfo;
    }

    public WebElement getPaymentPreferenceAcceptTerms() {
        return paymentPreferenceAcceptTerms;
    }

    public WebElement getAccountLinked () { return accountLinked;
    }

    public WebElement getCommentsHeaderText() {
        return commentsHeaderText;
    }

    public WebElement getProgramsHeaderText() {
        return programsHeaderText;
    }

    public WebElement getSupportingDocumentationHeaderText() {
        return supportingDocumentationHeaderText;
    }

    public WebElement getCommentsEntered () {
        return commentsEntered;
    }

    public WebElement getDocumentDelete() {
        return documentDelete;
    }

    public WebElement getConfirm() {
        return confirm;
    }

    public WebElement getStatusOfDocumentUploaded() {
        return statusOfDocumentUploaded;
    }

    public List<WebElement> getSupportingDocuments() {
        return supportingDocuments;
    }

    public WebElement getPrintFaxCoverSheetButton() {
        return printFaxCoverSheetButton;
    }

    public WebElement getCloseSupportedDocumentsModal() {
        return closeSupportedDocumentsModal;
    }

    public WebElement getStatusHistoryMsgAutTest0() {
        return statusHistoryMsgAutTest0;
    }

    public WebElement getMessageStatusHistoryAutTest() {
        return messageStatusHistoryAutTest;
    }

    public WebElement getMessageFromAutTest() {
        return messageFromAutTest;
    }

    public WebElement getFirstCourseExpenseDescription() {
        return firstCourseExpenseDescription;
    }

    public WebElement getSecondCourseExpenseDescription() {
        return secondCourseExpenseDescription;
    }

    public WebElement getThirdCourseExpenseDescription() {
        return thirdCourseExpenseDescription;
    }

    public WebElement getFourthCourseExpenseDescription() {
        return fourthCourseExpenseDescription;
    }

    public WebElement getFifthCourseExpenseDescription() {
        return fifthCourseExpenseDescription;
    }

    public WebElement getFirstNonCourseExpenseRequestedAmt() {
        return firstNonCourseExpenseRequestedAmt;
    }

    public WebElement getSecondNonCourseExpenseRequestedAmt() {
        return secondNonCourseExpenseRequestedAmt;
    }

    public List<WebElement> getCourseExpenseCosts() {
        return courseExpenseCosts;
    }

    public WebElement getRegisterWithZelleBtn() {
        return registerWithZelleBtn;
    }

    public WebElement getPaymentPreferenceHeader() {
        return paymentPreferenceHeader;
    }

    public WebElement getPaymentPreferenceQuestion() {
        return paymentPreferenceQuestion;
    }

    public WebElement getAppealDenyButton() {
        return appealDenyButton;
    }

    public WebElement getCancelAppealButton() {
        return cancelAppealButton;
    }

    public WebElement getStatusOfDocumentUploaded1() {
        return statusOfDocumentUploaded1;
    }

    public WebElement getContinueToWebsiteButton() {
        return continueToWebsiteButton;
    }

    public WebElement getCourseGradeComboBoxesExam() {
        return courseGradeComboBoxesExam;
    }

    public WebElement getExamGradeErrText() {
        return examGradeErrText;
    }

    public WebElement getCourseGradeErrText() {
        return courseGradeErrText;
    }

    public WebElement getApplicationStatusHeaderStatus() {
        return applicationStatusHeaderStatus;
    }

    public WebElement getStatusHistoryHeaderText() {
        return statusHistoryHeaderText;
    }

    public WebElement getCoursesExpensesCourseNumber() {
        return coursesExpensesCourseNumber;
    }

    public WebElement getTuitionAmt() {
        return tuitionAmt;
    }

    public WebElement getNumOfBooks() {
        return numOfBooks;
    }

    public WebElement getRequestedBooksAmt() {
        return requestedBooksAmt;
    }

    public WebElement getDiscountAmt() {
        return discountAmt;
    }

    public WebElement getCoursesRequestedAmt() {
        return coursesRequestedAmt;
    }

    public WebElement getCoursesApprovalAmt() {
        return coursesApprovalAmt;
    }

    public WebElement getCoursesPaidAmt() {
        return coursesPaidAmt;
    }

    public WebElement getCoursesViewMoreButton() {
        return coursesViewMoreButton;
    }

    public WebElement getAccessLetterOfCreditButton() {
        return accessLetterOfCreditButton;
    }

    public WebElement getContactInformationCancelButton() {
        return contactInformationCancelButton;
    }

    public WebElement getAppActionNeededStatus() {
        return appActionNeededStatus;
    }

    public WebElement getAppReasonText() {
        return appReasonText;
    }

    public WebElement getLetterOfCreditButton () {
        return letterOfCreditButton;
    }

    public WebElement getAgreementHeader () {
        return agreementHeader;
    }

    public WebElement getAgreementText () {
        return agreementText;
    }

    public WebElement getAgreementCheckboxLabel () {
        return agreementCheckboxLabel;
    }

    public WebElement getStatusHistoryMsg1() {
        return statusHistoryMsg1;
    }

    public WebElement getSubmittedApplicationSavedBanner() {
        return submittedApplicationSavedBanner;
    }

    public WebElement getRelatedCourseButton() {
        return relatedCourseButton;
    }

    public WebElement getNonCourseExpenseViewMoreBtn() {
        return nonCourseExpenseViewMoreBtn;
    }

    public WebElement getNonCourseExpensesRequestedAmt() {
        return nonCourseExpensesRequestedAmt;
    }

    public WebElement getNonCourseExpensesApprovalAmt() {
        return nonCourseExpensesApprovalAmt;
    }

    public WebElement getNonCourseExpensesPaidAmt() {
        return nonCourseExpensesPaidAmt;
    }

    public WebElement getStatusHistoryMsg0() {
        return statusHistoryMsg0;
    }

    public WebElement getStatusHistoryMsg3() {
        return statusHistoryMsg3;
    }

    public WebElement getGraduationDate() {
        return graduationDate;
    }

    public WebElement getTermsConditionsCheckbox() {
        return termsConditionsCheckbox;
    }

    public WebElement getPurposeHeaderText() {
        return purposeHeaderText;
    }

    public WebElement getDocumentTypeButton() {
        return documentTypeButton;
    }

    public WebElement getAppealsOptionInDropDown() {
        return appealsOptionInDropDown;
    }

    public WebElement getPurposeComment() {
        return purposeComment;
    }

    public WebElement getModalContent() {
        return modalContent;
    }

    public WebElement getModalBody() {
        return modalBody;
    }

    public WebElement getPlaceholderPurposeStmt() {
        return placeholderPurposeStmt;
    }

    public WebElement getRequiredMessage() {
        return requiredMessage;
    }

    public List<WebElement> getCommentContainer() {
        return commentContainer;
    }

    public WebElement getDocumentUploadedDate() {
        return documentUploadedDate;
    }

    public WebElement getDocumentReviewedDate() {
        return documentReviewedDate;
    }

    public WebElement getDeleteDocumentButton() {
        return deleteDocumentButton;
    }

    public WebElement getLivePersonButton() {
        return livePersonButton;
    }

    public WebElement getSessionStartDate() {
        return sessionStartDate;
    }

    public WebElement getSessionEndDate() {
        return sessionEndDate;
    }

    public WebElement getLoadingSpinner() {
        return loadingSpinner;
    }

    public WebElement getCredits() {
        return credits;
    }

    public WebElement getPptNameLink() {
        return pptNameLink;
    }

    public WebElement getOtherFOS() {
        return otherFOS;
    }

    public WebElement getBackToSearchResults() {
        return backToSearchResults;
    }
}
