package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class Advising {

    public Advising(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "advising";

    @FindBy(id = "lrpAdvisingScheduleApptButton")
    private WebElement loanScheduleAdvisingButton;

    @FindBy(id = "whatTypeOfLoansDoYouHaveHeaderText")
    private WebElement typesOfLoanHeader;

    @FindBy(id = "howMuchStudentLoanDebtDoYouHaveHeaderText")
    private WebElement howMuchStudentLoanDebtHeader;

    @FindBy(id = "doYouHaveAnyRelevantDocumentationHeaderText")
    private WebElement relevantDocumentHeader;

    @FindBy(id = "debtAmount")
    private WebElement debtAmountText;

    @FindBy(id = "loanStatus-dropdown")
    private WebElement loanStatusDropdown;

    @FindBy(id = "lrpAdvisingApptSubmitButton")
    private WebElement loanAdvisingSubmitButton;

    @FindBy(id = "loanTypes0Label")
    private WebElement loanTypes0;

    @FindBy(id = "loanTypes1Label")
    private WebElement loanTypes1;

    @FindBy(id = "modal-title")
    private WebElement modalTitle;

    @FindBy(id = "lrpAdvisingMessageExpertButton")
    private WebElement messageExpertBtn;

    @FindBy(id = "comments")
    private WebElement commentsTextArea;

    @FindBy(id = "uploadAppDocsAddFileButton")
    private WebElement uploadDocLink;

    @FindBy(id = "modalCreateSupportTicketSubmitButton")
    private WebElement submitMessageBtn;

    @FindBy(id = "modalCreateSupportTicketCancelButton")
    private WebElement cancelBtn;

    @FindBy(id = "modalCloseButton")
    private WebElement modalCloseBtn;

    @FindBy(id = "uploadAppDocsAddFileButton")
    private WebElement selectFile;

    @FindBy(id = "readyToUploadFilenameText")
    private WebElement uploadDocSuccessMessage;

    @FindBy(id = "lrpAdvisingSuccessMessage")
    private WebElement successMessage;

    @FindBy(id = "lrpAdvisingScheduleApptButton")
    private WebElement scheduleFreeAdvising;

    @FindBy(id = "productSelection-dropdown")
    private WebElement productSelectionDropdown;

    @FindBy(id = "advisingHistoryLoadMoreButton")
    private WebElement advisingAptSeeMoreBtn;

    @FindBy(className = "update-advisor-appointment-button")
	private WebElement advisingAptUpdateBtn;

    @FindBy(className = "cancel-advisor-appointment-button")
	private WebElement advisingAptCancelBtn;

    @FindBy(id = "advisingApptCancelModalYesButton")
	private WebElement advisingAptCancelModalYesBtn;

    @FindBy(id = "advisingApptCancelModalNoButton")
	private WebElement advisingAptCancelModalNoBtn;

    @FindBy(className = "advising-appointment-status-text")
	private WebElement advisingAptStatusText;

    @FindBy(id = "Msg")
    private WebElement headerMsg;

    //------------------------Schedule Appointment - Employment & Education ---------
    @FindBy(id = "reasonForAdvising-dropdown")
    private WebElement reasonForAdvisingSessionDropdown;

    @FindBy(id = "highestLevelOfEducation-dropdown")
    private WebElement highestLevelFfEducationEarned;

    @FindBy(id = "whereAreYouInProcess-dropdown")
    private WebElement whereAreYouInTheEnrollmentProcess;

    @FindBy(id = "currentlyEnrolledInUnivProgram-dropdown")
    private WebElement currentlyEnrolledInProgram;

    @FindBy(id = "yearsOfProfExp-dropdown")
    private WebElement yearsOfProfessionalExperience;

    @FindBy(id = "currentEmploymentStatus-dropdown")
    private WebElement currentEmployeeStatus;

    @FindBy(id = "typeOfDegree-dropdown")
    private WebElement whatTypeOfEducationAreYouSeeking;

    @FindBy(id = "yearsInCurrentProf-dropdown")
    private WebElement numberOfYearsInCurrentPosition;

    @FindBy(id = "currentlyInProcessOfPayingBackStudentLoans-dropdown")
    private WebElement inTheProcessOfPayingBackStudentLoans;

    @FindBy(id = "yearsWithCurrentEmployer-dropdown")
    private WebElement yearsWithCurrentEmployer;

    @FindBy(id = "lrpAdvisingApptSubmitButton")
    private WebElement scheduleApptSubmitBtn;

    @FindBy(id = "lrpAdvisingApptCancelButton")
    private WebElement scheduleApptCancelBtn;

    //------------------------Schedule Appointment - Contact Preferences ---------

    @FindBy(id = "lrpAdvisingApptCancelButton")
    private WebElement cancelAdvisingAptBtn;

    @FindBy(id = "addressRadioGroup")
    private WebElement addressRadioGroup;

    @FindBy(id = "phoneRadioGroup")
    private WebElement phoneRadioGroup;

    @FindBy(id = "emailRadioGroup")
    private WebElement emailRadioGroup;

    @FindBy(id = "yourAddressHeaderText")
    private WebElement yourAddressHeaderText;

    //------------------------Schedule Appointment - Calendar -----------------------
    @FindBy(className = "calendar-enabled-day")
    private WebElement calendarAvailableDay;

    @FindBy(id = "datePickerMonthRightArrow")
    private WebElement nextMonthBtn;

    @FindBy(id = "datePickerMonthLeftArrow")
    private WebElement previousMonthBtn;

    @FindBy(id = "timeSlotButton0")
    private WebElement firstAvailableTime;

    @FindBy(id = "advisingAppointmentSelectedTime")
    private WebElement appointmentSelectedTimeText;

    @FindBy(id = "advisingAppointmentAdvisor")
    private WebElement appointmentAdvisorText;

    //------------------------Schedule Appointment - Documents & Comments -----------------------
    @FindBy(id = "comments")
    private WebElement AdditionalCommentsInput;

    @FindBy(id = "lrpAdvisingApptCancelButton")
    private WebElement cancelAptRequestBtn;

    @FindBy(id = "lrpAdvisingApptSuccessMessage1")
    private WebElement successMessage1Text;

    @FindBy(id = "lrpAdvisingApptSuccessMessage2")
    private WebElement successMessage2Text;

    @FindBy(id = "lrpAdvisingApptSuccessMessage3")
    private WebElement successMessage3Text;

    @FindBy(id = "advisingAppointmentCard")
    private WebElement advisingAppointmentCard;

    @FindBy(id = "lrpAdvisingNetworkUrlButton")
    private WebElement advisingNetworkUrlButton;

    @FindBy(id = "advisingLearnMoreBtn")
    private WebElement advisingLearnMoreBtn;

    @FindBy(id = "principal")
    private WebElement principleTextBox;

    @FindBy(id = "extra")
    private WebElement extraTextBox;

    @FindBy(id = "interest")
    private WebElement interestTextBox;

    @FindBy(id = "term")
    private WebElement termTextBox;

    @FindBy(id = "lrpAmoritzationCalcOrigPmtText")
    private WebElement monthlyPayment;

    @FindBy(id = "lrpAmoritzationCalcOrigTermText")
    private WebElement termInYears;

    @FindBy(id = "lrpAmoritzationCalcWXtraPmtText")
    private WebElement payExtraAmtPerMonth;

    @FindBy(id = "lrpAmoritzationCalcWXtraTermMonthsText")
    private WebElement extraTermInMonths;

    @FindBy(id = "lrpAmoritzationCalcWXtraTermTotalText")
    private WebElement extraTermTotal;

    @FindBy(id = "lrpAmoritzationCalcCalculateButton")
    private WebElement calculateLoanInfo;

    @FindBy(id = "lrpAmortzationCalcOrigTotalText")
    private WebElement originalPmtTotal;

    @FindBy(id = "fileUploadActivateButton")
    private WebElement addFileUploadLink;

    @FindBy(className = "icon-appSuccess")
    private WebElement submitSuccessIcon;

    @FindBy(id = "lrpAdvisingLearnMoreButton")
    private WebElement lrpBrowseHelpfulContentButton;

    @FindBy(className = "action-needed-pagination")
    private WebElement supportTicketPagination;

    @FindBy(id = "lrpAdvisingCalculatorHeading")
    private WebElement advisingCalculatorHeading;

    @FindBy(id = "modalCloseBtnFooter")
    private WebElement modalCancelButton;

    @FindBy(id = "modalSubmitBtn")
    private WebElement modalContinueButton;

    @FindBy(id = "productSelectionBtn")
    private WebElement productSelectionBtn;

    @FindBy(id = "Student Loan RepaymentLink")
    private WebElement studentLoanRepaymentLink;

    @FindBy(className = "support-ticket-test")
    private List<WebElement> supportTicketCard;

    @FindBy(className = "pagination-next")
    private WebElement paginationNext;

    @FindBy(id = "errorTypeInvalidMsg")
    private WebElement invalidFileMessage;

    @FindBy(id = "errorSizeInvalidMsg")
    private WebElement errorFileSize;

    @FindBy(xpath = "//div/div[contains(@class, 'success')]")
    private WebElement messageExpertSucess;

    public String getUrl() {
        return url;
    }

    public WebElement getPaginationNext() {
        return paginationNext;
    }

    public List<WebElement> getSupportTicketCard() {
        return supportTicketCard;
    }

    public WebElement getSubmitSuccessIcon() {
        return submitSuccessIcon;
    }

    public WebElement getAddFileUploadLink() {
        return addFileUploadLink;
    }

    public WebElement getLoanScheduleAdvisingButton() {
        return loanScheduleAdvisingButton;
    }

    public WebElement getTypesOfLoanHeader() {
        return typesOfLoanHeader;
    }

    public WebElement getHowMuchStudentLoanDebtHeader() {
        return howMuchStudentLoanDebtHeader;
    }

    public WebElement getRelevantDocumentHeader() {
        return relevantDocumentHeader;
    }

    public WebElement getDebtAmountText() {
        return debtAmountText;
    }

    public WebElement getLoanStatusDropdown() {
        return loanStatusDropdown;
    }

    public WebElement getLoanAdvisingSubmitButton() {
        return loanAdvisingSubmitButton;
    }

    public WebElement getLoanTypes0() {
        return loanTypes0;
    }

    public WebElement getLoanTypes1() {
        return loanTypes1;
    }

    public WebElement getOriginalPmtTotal() {
        return originalPmtTotal;
    }

    public WebElement getCalculateLoanInfo() {
        return calculateLoanInfo;
    }

    public WebElement getExtraTermTotal() {
        return extraTermTotal;
    }

    public WebElement getExtraTermInMonths() {
        return extraTermInMonths;
    }

    public WebElement getPayExtraAmtPerMonth() {
        return payExtraAmtPerMonth;
    }

    public WebElement getTermInYears() {
        return termInYears;
    }

    public WebElement getMonthlyPayment() {
        return monthlyPayment;
    }

    public WebElement getTermTextBox() {
        return termTextBox;
    }

    public WebElement getInterestTextBox() {
        return interestTextBox;
    }

    public WebElement getExtraTextBox() {
        return extraTextBox;
    }

    public WebElement getPrincipleTextBox() {
        return principleTextBox;
    }

    public WebElement getAdvisingLearnMoreBtn() {
        return advisingLearnMoreBtn;
    }

    public WebElement getAdvisingNetworkUrlButton() {
        return advisingNetworkUrlButton;
    }

    public WebElement getAdvisingAppointmentCard() {
        return advisingAppointmentCard;
    }

    public WebElement getModalTitle() {
        return modalTitle;
    }

    public WebElement getMessageExpertBtn() {
        return messageExpertBtn;
    }

    public WebElement getCommentsTextArea() {
        return commentsTextArea;
    }

    public WebElement getUploadDocLinksd() {
        return uploadDocLink;
    }

    public WebElement getSubmitMessageBtn() {
        return submitMessageBtn;
    }

    public WebElement getCancelBtn() {
        return cancelBtn;
    }

    public WebElement getModalCloseBtn() {
        return modalCloseBtn;
    }

    public WebElement getUploadDocSuccessMessage() {
        return uploadDocSuccessMessage;
    }

    public WebElement getSelectFile() {
        return selectFile;
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getScheduleFreeAdvising() {
        return scheduleFreeAdvising;
    }

    public WebElement getProductSelectionDropdown() {
        return productSelectionDropdown;
    }

    public WebElement getAdvisingAptSeeMoreBtn() {
        return advisingAptSeeMoreBtn;
    }

    public WebElement getAdvisingAptUpdateBtn() {
        return advisingAptUpdateBtn;
    }

	public WebElement getAdvisingAptCancelBtn() {
		return advisingAptCancelBtn;
	}

	public WebElement getAdvisingAptCancelModalYesBtn() {
		return advisingAptCancelModalYesBtn;
	}

	public WebElement getAdvisingAptCancelModalNoBtn() {
		return advisingAptCancelModalNoBtn;
	}

	public WebElement getAdvisingAptStatusText() {
		return advisingAptStatusText;
	}

	public WebElement getUploadDocLink() {
        return uploadDocLink;
    }

    public WebElement getReasonForAdvisingSessionDropdown() {
        return reasonForAdvisingSessionDropdown;
    }

    public WebElement getHighestLevelFfEducationEarned() {
        return highestLevelFfEducationEarned;
    }

    public WebElement getWhereAreYouInTheEnrollmentProcess() {
        return whereAreYouInTheEnrollmentProcess;
    }

    public WebElement getCurrentlyEnrolledInProgram() {
        return currentlyEnrolledInProgram;
    }

    public WebElement getYearsOfProfessionalExperience() {
        return yearsOfProfessionalExperience;
    }

    public WebElement getCurrentEmployeeStatus() {
        return currentEmployeeStatus;
    }

    public WebElement getWhatTypeOfEducationAreYouSeeking() {
        return whatTypeOfEducationAreYouSeeking;
    }

    public WebElement getNumberOfYearsInCurrentPosition() {
        return numberOfYearsInCurrentPosition;
    }

    public WebElement getInTheProcessOfPayingBackStudentLoans() {
        return inTheProcessOfPayingBackStudentLoans;
    }

    public WebElement getYearsWithCurrentEmployer() {
        return yearsWithCurrentEmployer;
    }

    public WebElement getScheduleApptSubmitBtn() {
        return scheduleApptSubmitBtn;
    }

    public WebElement getScheduleApptCancelBtn() {
        return scheduleApptCancelBtn;
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

    public WebElement getYourAddressHeaderText() {
        return yourAddressHeaderText;
    }

    public WebElement getCancelAdvisingAptBtn() {
        return cancelAdvisingAptBtn;
    }

    public WebElement getNextMonthBtn() {
        return nextMonthBtn;
    }

    public WebElement getPreviousMonthBtn() {
        return previousMonthBtn;
    }

    public WebElement getCalendarAvailableDay() {
        return calendarAvailableDay;
    }

    public WebElement getFirstAvailableTime() {
        return firstAvailableTime;
    }

    public WebElement getAppointmentSelectedTimeText() {
        return appointmentSelectedTimeText;
    }

    public WebElement getAppointmentAdvisorText() {
        return appointmentAdvisorText;
    }

    public WebElement getAdditionalCommentsInput() {
        return AdditionalCommentsInput;
    }

    public WebElement getCancelAptRequestBtn() {
        return cancelAptRequestBtn;
    }

    public WebElement getSuccessMessage1Text() {
        return successMessage1Text;
    }

    public WebElement getSuccessMessage2Text() {
        return successMessage2Text;
    }

    public WebElement getSuccessMessage3Text() {
        return successMessage3Text;
    }

    public WebElement getLrpBrowseHelpfulContentButton() {
        return lrpBrowseHelpfulContentButton;
    }

    public WebElement getSupportTicketPagination() {
        return supportTicketPagination;
    }

    public WebElement getAdvisingCalculatorHeading() {
        return advisingCalculatorHeading;
    }

    public WebElement getModalCancelButton() {
        return modalCancelButton;
    }

    public WebElement getModalContinueButton() {
        return modalContinueButton;
    }

    public WebElement getProductSelectionBtn() {
        return productSelectionBtn;
    }

    public WebElement getStudentLoanRepaymentLink() {
        return studentLoanRepaymentLink;
    }

    public WebElement getInvalidFileMessage() {
        return invalidFileMessage;
    }

    public WebElement getErrorFileSize() {
        return errorFileSize;
    }

    public WebElement getHeaderMsg() {
        return headerMsg;
    }

    public WebElement getMessageExpertSucess() {
        return messageExpertSucess;
    }
}
