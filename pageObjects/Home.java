package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import java.util.List;

public class Home {

    public Home(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "home";

    @FindBy(className = "action-needed-application-action")
    private List<WebElement> submitOrCancelButton;

    @FindBy(className = "action-needed-application-action")
    private List<WebElement> reviewApplicationButton;

    @FindBy(className = "action-needed-application-action")
    private List<WebElement> uploadDocumentsButton;

    @FindBy(className = "action-needed-application-action")
    private List<WebElement> completeApplicationButton;

    @FindBy(id = "appActionNeededTile")
    private List<WebElement> actionNeededCard;

    @FindBy (className = "loading")
    private WebElement loadingSpinner;

    @FindBy(className = "action-needed-tasklist")
    private WebElement actionNeededSection;

    @FindBy(id= "normalViewBtn")
    private WebElement actionNeededNormalViewBtn;

    @FindBy(id= "bulkViewBtn")
    private WebElement actionNeededBulkViewBtn;

    @FindBy(id= "actionNeededHeader")
    private WebElement actionNeededHeader;

    @FindBy(id= "teamMember-button")
    private WebElement teamMemberDropdown;

    @FindBy(id= "type-button")
    private WebElement typeDropdown;

    @FindBy(id= "benefitPeriod-button")
    private WebElement benefitPeriodDropdown;

    @FindBy(id= "comment")
    private WebElement commentBox;

    @FindBy(id= "genericModalConfirmationSubmitBtn")
    private WebElement denyApplicationsBtn;

    @FindBy(className = "btn-inbox-header")
    private WebElement messagesLink;

    @FindBy(id = "homeMessageText")
    private WebElement messagesContentText;

    @FindBy(id = "btnViewMsg0")
    private WebElement viewLessButton;

    @FindBy(id = "btnViewMsg0")
    private WebElement viewMoreButton;

    @FindBy(id = "btn-advising-click")
    private WebElement scheduleFreeAdvisingLink;

    @FindBy(className = "tile-content")
    private WebElement actionNeededContent;

    @FindBy(id = "btn-view-discounts")
    private WebElement viewDiscountsfromEligibleSchoolsLink;

    @FindBy(className = "btn-link")
    private List<WebElement> ProgramModalDownloadLinks;

    @FindBy(id = "program-dropdown")
    private WebElement programDropdown;

    @FindBy(id = "degrees-dropdown")
    private WebElement degreeDropdown;

    @FindBy(id = "degrees-button")
    private WebElement degreeDropdownBtn;

    @FindBy(id = "periods-dropdown")
    private WebElement periodsDropdown;

    @FindBy(id = "periods-button")
    private WebElement periodsDropdownbtn;

    @FindBy(id = "programBenefitsLimitValue")
    private WebElement benefitLimit;

    @FindBy(id = "programBenefitsRemainingValue")
    private WebElement benefitRemainingValue;

    @FindBy(id = "programBenefitsRequestedValue")
    private WebElement benefitRequested;

    @FindBy(id = "programBenefitsPaidValue")
    private WebElement programBenefitsPaidValue;

    @FindBy(className = "application-item-date")
    private WebElement actionNeededDates;

    @FindBy(className = "application-item-date")
    private List<WebElement> actionNeededDatesList;

    @FindBy(id = "actionNeededSessionDate1")
    private WebElement actionNeededSessionDates;

    @FindBy(className = "action-needed-application-number")
    private List<WebElement> appLinkNumber;

    @FindBy(className = "application-action-block")
    private List<WebElement> appActionNeededTile;

    @FindBy(className = "application-status")
    private List<WebElement> appActionNeededStatus;

    @FindBy(id = "tasklistWrapper")
    private WebElement paginationNextBtn;

    @FindBy(className = "action-needed-application-action")
    private List<WebElement> appActionBtn;

    @FindBy(xpath = "//a[@id='edGoalsAddGoalButton']/ancestor::div[contains(@class, 'banner-container')]")
    private WebElement edGoalBanner;

    @FindBy(id = "edGoalsStartGoalButton")
    private WebElement addAnotherGoalBtn;

    @FindBy(className = "ed-goal-detail")
    private WebElement edGoalsTile;

    @FindBy(id = "edGoalHomeAppStatus")
    private WebElement edGoalHomeAppStatus;

    @FindBy(id = "edGoalsAddGoalButton")
    private WebElement edGoalsAddGoalBtnTopBanner;

    @FindBy(className = "ed-goals-tile-block")
    private WebElement edGoalsTileBlock;

    @FindBy(className = "icon-statusReview")
    private WebElement reviewIcon;

    @FindBy(className = "card-item-container")
    private WebElement bulkApprovalContainer;

    @FindBy(className = "pagination-sm")
    private WebElement paginationContainer;

    @FindBy(id = "startStopImpersonationBtn")
    private WebElement startStopImpersonationBtn;

    @FindBy(id = "participantTypeaheadInput")
    private WebElement participantTypeaheadInput;

    @FindBy(xpath = "//*[contains(@id, 'typeaheadUserId')]")
    private List<WebElement> typeaheadUserDropdownOptions;

    @FindBy(xpath = "(//*[contains(@id, 'typeaheadUserId')])[1]")
    private WebElement typeaheadUserDropdownFirstOption;

    @FindBy(className = "application-total")
    private WebElement programsCalculatorApplicationTotal;

    @FindBy(className = "action-needed-application-action")
    private WebElement completeAppButton;

    @FindBy(className = "status-block-left")
    private WebElement statusBlockLeft;

    @FindBy(id = "edGoalActions")
    private WebElement edGoalActions;

    @FindBy(id = "currentEdGoalClose")
    private WebElement currentEdGoalClose;

    @FindBy(id = "currentEdGoalView")
    private WebElement currentEdGoalView;

    @FindBy(id = "currentEdGoalCancel")
    private WebElement currentEdGoalCancel;

    @FindBy(id = "currentEdGoalEdit")
    private WebElement currentEdGoalEdit;

    @FindBy(className = "progress-bar-bar-requested")
    private WebElement amountSubmittedBar;

    @FindBy(id = "programBenefitPaidAmount")
    private WebElement programBenefitPaidAmount;

    @FindBy(id = "programBenefitRequestedAmount")
    private WebElement programBenefitRequestedAmount;

    @FindBy(id = "programBenefitRemainingAmount")
    private WebElement programBenefitRemainingAmount;

    @FindBy(id = "repaymentMethods1Label")
    private WebElement payrollRepaymentMethod;

    @FindBy(id = "repaymentMethods2Label")
    private WebElement checkRepaymentMethod;

    @FindBy(id = "payrollDeduction")
    private WebElement payrollDeduction;

    @FindBy(id = "saveChanges")
    private WebElement saveChanges;

    @FindBy(id = "homeRepaymentBanner")
    private WebElement homeRepaymentBanner;

    @FindBy(id = "repaymentTotal")
    private WebElement repaymentTotal;

    @FindBy(id = "electionDeadline")
    private WebElement electionDeadline;

    @FindBy(id = "bannerWelcomeHeader")
    private WebElement bannerWelcomeHeader;

    @FindBy(id = "bannerRepaymentDesc")
    private WebElement bannerRepaymentDesc;

    @FindBy(id = "bannerRepaymentAction")
    private WebElement bannerRepaymentAction;

    @FindBy(id = "payrollDeduction-extra-text")
    private WebElement payrollDeductionExtraText;

    @FindBy(id = "getRemittanceForm")
    private WebElement getRemittanceForm;

    @FindBy(id = "bannerRepayPayableTo")
    private WebElement bannerRepayPayableTo;

    @FindBy(id = "bannerRepayPayableAddress")
    private WebElement bannerRepayPayableAddress;

    @FindBy(className = "action-needed-pagination")
    private WebElement actionNeededPagination;

    @FindBy(id= "submitButton")
    private WebElement closeThisEducationGoalBtn;

    @FindBy(className = "ed-access-banner")
    private WebElement edAccessBanner;

    @FindBy(id= "edAccessMoreInfo")
    private WebElement edAccessMoreInfo;

    @FindBy(id= "navLinkNewApplicationButton")
    private WebElement NewApplicationButtonEABanner;

    @FindBy(id = "openUserProfileLink")
    private WebElement pptNameLink;

    @FindBy(xpath = "//button[contains(text(),'Access Letter of Credit')]")
    private WebElement accessLetterOfCredit;

    public String getUrl() {
        return url;
    }

    public WebElement getBannerRepayPayableTo() {
        return bannerRepayPayableTo;
    }

    public WebElement getBannerRepayPayableAddress() {
        return bannerRepayPayableAddress;
    }

    public WebElement getGetRemittanceForm() {
        return getRemittanceForm;
    }

    public WebElement getCheckRepaymentMethod() {
        return checkRepaymentMethod;
    }

    public WebElement getPayrollDeductionExtraText() {
        return payrollDeductionExtraText;
    }

    public WebElement getBannerRepaymentDesc() {
        return bannerRepaymentDesc;
    }

    public WebElement getBannerRepaymentAction() {
        return bannerRepaymentAction;
    }

    public WebElement getBannerWelcomeHeader() {
        return bannerWelcomeHeader;
    }

    public WebElement getElectionDeadline() {
        return electionDeadline;
    }

    public WebElement getRepaymentTotal() {
        return repaymentTotal;
    }

    public WebElement getHomeRepaymentBanner() {
        return homeRepaymentBanner;
    }

    public WebElement getSaveChanges() {
        return saveChanges;
    }

    public WebElement getPayrollDeduction() {
        return payrollDeduction;
    }

    public WebElement getPayrollRepaymentMethod() {
        return payrollRepaymentMethod;
    }

    public WebElement getEdGoalsTile() {
        return edGoalsTile;
    }

    public WebElement getActionNeededSection() {
        return actionNeededSection;
    }

    public WebElement getActionNeededNormalViewBtn() {
        return actionNeededNormalViewBtn;
    }

    public WebElement getActionNeededBulkViewBtn() {
        return actionNeededBulkViewBtn;
    }

    public WebElement getActionNeededHeader() {
        return actionNeededHeader;
    }

    public WebElement getTeamMemberDropdown() {
        return teamMemberDropdown;
    }

    public WebElement getTypeDropdown() {
        return typeDropdown;
    }

    public WebElement getBenefitPeriodDropdown() {
        return benefitPeriodDropdown;
    }

    public WebElement getCommentBox() {
        return commentBox;
    }

    public WebElement getDenyApplicationsBtn() {
        return denyApplicationsBtn;
    }

    public List<WebElement> getAppLinkNumber() {
        return appLinkNumber;
    }

    public List<WebElement> getSubmitOrCancelButton() {
        return submitOrCancelButton;
    }

    public List<WebElement> getActionNeededCard() {
        return actionNeededCard;
    }

    public WebElement getMessagesLink() {
        return messagesLink;
    }

    public WebElement getMessagesContentText() {
        return messagesContentText;
    }

    public WebElement getViewLessButton() {
        return viewLessButton;
    }

    public WebElement getViewMoreButton() {
        return viewMoreButton;
    }

    public WebElement getScheduleFreeAdvisingLink() {
        return scheduleFreeAdvisingLink;
    }

    public WebElement getViewDiscountsfromEligibleSchoolsLink() {
        return viewDiscountsfromEligibleSchoolsLink;
    }

    public List<WebElement> getProgramModalDownloadLinks() {
        return ProgramModalDownloadLinks;
    }

    public WebElement getProgramDropdown() {
        return programDropdown;
    }

    public WebElement getDegreeDropdown() {
        return degreeDropdown;
    }

    public WebElement getPeriodsDropdown() {
        return periodsDropdown;
    }

    public WebElement getBenefitLimit() {
        return benefitLimit;
    }

    public WebElement getActionNeededDates() {
        return actionNeededDates;
    }

    public List<WebElement> getActionNeededDatesList() {
        return actionNeededDatesList;
    }

    public List<WebElement> getAppActionNeededTile() {
        return appActionNeededTile;
    }

    public List<WebElement> getAppActionNeededStatus() {
        return appActionNeededStatus;
    }

    public List<WebElement> getReviewApplicationButton() {
        return reviewApplicationButton;
    }

    public List<WebElement> getUploadDocumentsButton() {
        return uploadDocumentsButton;
    }

    public List<WebElement> getCompleteApplicationButton() {
        return completeApplicationButton;
    }

    public WebElement getPaginationNextBtn() {
        return paginationNextBtn;
    }

    public WebElement getAddAnotherGoalBtn() {
        return addAnotherGoalBtn;
    }

    public WebElement getActionNeededSessionDates() {
        return actionNeededSessionDates;
    }

    public WebElement getBenefitRemainingValue() {
        return benefitRemainingValue;
    }

    public WebElement getBenefitRequested() {
        return benefitRequested;
    }

    public WebElement getProgramBenefitsPaidValue() {
        return programBenefitsPaidValue;
    }

    public WebElement getEdGoalsTileBlock() {
        return edGoalsTileBlock;
    }

    public WebElement getReviewIcon() {
        return reviewIcon;
    }

    public WebElement getBulkApprovalContainer() {
        return bulkApprovalContainer;
    }

    public WebElement getPaginationContainer() {
        return paginationContainer;
    }

    public WebElement getEdGoalsAddGoalBtnTopBanner() {
        return edGoalsAddGoalBtnTopBanner;
    }

    public WebElement getStartStopImpersonationBtn() {
        return startStopImpersonationBtn;
    }

    public WebElement getParticipantTypeaheadInput() {
        return participantTypeaheadInput;
    }

    public List<WebElement> getTypeaheadUserDropdownOptions() {
        return typeaheadUserDropdownOptions;
    }

    public WebElement getTypeaheadUserDropdownFirstOption() {
        return typeaheadUserDropdownFirstOption;
    }

    public WebElement getEdGoalHomeAppStatus() {
        return edGoalHomeAppStatus;
    }

    public WebElement getProgramsCalculatorApplicationTotal () {
        return programsCalculatorApplicationTotal;
    }

    public WebElement getCompleteAppButton() {
        return completeAppButton;
    }

    public WebElement getEdGoalActions() {
        return edGoalActions;
    }

    public WebElement getCurrentEdGoalClose() {
        return currentEdGoalClose;
    }

    public WebElement getCurrentEdGoalView() {
        return currentEdGoalView;
    }

    public WebElement getCurrentEdGoalCancel() {
        return currentEdGoalCancel;
    }

    public WebElement getCurrentEdGoalEdit() {
        return currentEdGoalEdit;
    }

    public WebElement getStatusBlockLeft() {
        return statusBlockLeft;
    }

    public WebElement getDegreeDropdownBtn() {
        return degreeDropdownBtn;
    }

    public WebElement getPeriodsDropdownbtn() {
        return periodsDropdownbtn;
    }

    public WebElement getAmountSubmittedBar() {
        return amountSubmittedBar;
    }

    public WebElement getProgramBenefitPaidAmount() {
        return programBenefitPaidAmount;
    }

    public WebElement getProgramBenefitRequestedAmount() {
        return programBenefitRequestedAmount;
    }

    public WebElement getProgramBenefitRemainingAmount() {
        return programBenefitRemainingAmount;
    }

    public WebElement getActionNeededPagination() {
        return actionNeededPagination;
    }

    public WebElement getCloseThisEducationGoalBtn() {
        return closeThisEducationGoalBtn;
    }

    public WebElement getEdAccessBanner() {
        return edAccessBanner;
    }

    public WebElement getEdAccessMoreInfo() {
        return edAccessMoreInfo;
    }

    public WebElement getNewApplicationButtonEABanner() {
        return NewApplicationButtonEABanner;
    }

    public List<WebElement> getAppActionBtn() {
        return appActionBtn;
    }

    public WebElement getEdGoalBanner() {
        return edGoalBanner;
    }

    public WebElement getActionNeededContent() {
        return actionNeededContent;
    }

    public WebElement getPptNameLink() {
        return pptNameLink;
    }

    public WebElement getLoadingSpinner() {
        return loadingSpinner;
    }

    public WebElement getAccessLetterOfCredit() {
        return accessLetterOfCredit;
    }
}
