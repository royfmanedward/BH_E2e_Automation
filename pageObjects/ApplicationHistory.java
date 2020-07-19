package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class ApplicationHistory {

    public ApplicationHistory(WebDriver driver) { PageFactory.initElements(driver, this);}

    private String url = "history";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "history-user-apps-btn")
    private WebElement appHistoryViewMoreApps;

    @FindBy(id = "team-member-option-0")
    private WebElement appHistoryYouTeamMemberSelect;

    @FindBy(className = "view-more-less-app-history-card-button")
    private List<WebElement> viewMoreButton;

    @FindBy(className = "view-more-less-app-history-card-button")
    private List<WebElement> viewLessButton;

    @FindBy(className = "total-requested")
    private List<WebElement> totalRequestedAmt;

    @FindBy(className = "total-approved")
    private List<WebElement> totalApprovedAmt;

    @FindBy(className = "total-paid")
    private List<WebElement> totalPaidAmt;

    @FindBy(className = "total-refund")
    private List<WebElement> totalRefundAmt;

    @FindBy(className = "total-benefit-paid")
    private List<WebElement> totalBenefitPaidAmt;

    @FindBy(className = "requested-amount-courses")
    private List<WebElement> requestedCourseAmt;

    @FindBy(className = "qe-app-history-card-app-number")
    private List<WebElement> appNumberLink;

    @FindBy(className = "qe-app-history-card-app-number")
    private List<WebElement> appNumber;

    @FindBy(className = "status-wrapper-desktop")
    private List<WebElement> applicationStatus;

    @FindBy(className = "application-status")
    private List<WebElement> applicationStatusText;

    @FindBy(className = "application-card")
    private List<WebElement> appHistoryTile;

    @FindBy(className = "application-card")
    private WebElement firstAppHistoryTile;

    @FindBy(className = "viewFullApplicationButton")
    private List<WebElement> viewFullApplicationButton;

    @FindBy(className = "program-name-desktop")
    private List<WebElement> programName;

    @FindBy(className = "view-more-less-app-history-card-button")
    private WebElement viewMoreLessButton;

    @FindBy(className = "application-owner-test")
    private List<WebElement> applicationName;

    @FindBy(className = "application-school-aut-test")
    private List<WebElement> applicationSchool;

    @FindBy(className = "application-degree-desktop")
    private List<WebElement> applicationDegree;

    @FindBy(className = "app-history-session-date-aut-test")
    private List<WebElement> courseDate;

    @FindBy(className = "requested-amount-expenses")
    private List<WebElement> courseRelatedAmount;

    @FindBy(className = "requested-amount-other")
    private List<WebElement> nonCourseRelatedAmount;

    @FindBy(id = "team-member-button")
    private WebElement appHistoryTeamMemberDropdown;

    @FindBy(id = "team-member-option-1")
    private WebElement appHistoryYourCompanyOption;

    @FindBy(id = "team-member-option-2")
    private WebElement appHistoryYourTeamOption;

    @FindBy(id = "ui-select-choices-row-0-1")
    private WebElement appHistoryYourCompanyTeamMemberSelect;

    @FindBy(id = "ui-select-choices-row-0-2")
    private WebElement appHistoryYourTeamTeamMemberSelect;

    @FindBy(id = "reviewSubmitCancelApplicationButton")
    private WebElement reviewSubmitCancelApplicationButton;

    @FindBy(id = "deleteApplicationButton")
    private WebElement deleteApplicationButton;

    @FindBy(className = "fa-download")
    private WebElement appHistoryAppDownloadLink;

    @FindBy(id = "sortBy-dropdown")
    private WebElement appHistorySortByDropdown;

    @FindBy(id = "sortBy-option-1")
    private WebElement appHistorySoryByApplicationStatus;

    @FindBy(id = "sortBy-option-2")
    private WebElement appHistorySortByDateSubmitted;

    @FindBy(id = "team-member-menu")
    private WebElement teamMemberMenu;

    @FindBy(id = "team-member-filterInput")
    private WebElement teamMemberSearch;

    @FindBy(id = "team-member-button")
    private WebElement teamMember;

    @FindBy(id = "team-member-option-0")
    private WebElement firstTeamMemberInList;

    @FindBy(id = "team-member-option-1")
    private WebElement secondTeamMemberInList;

    @FindBy(id = "application-history-count")
    private WebElement applicationCount;

    @FindBy(id = "sortBy-button")
    private WebElement sortByDropDownButton;

    @FindBy(id = "applicationHistoryTitle")
    private WebElement applicationHistoryHeader;

    @FindBy (className = "qe-app-history-card-app-number")
    private WebElement firstAppNumber;

    @FindBy (id = "history-benefit-period-button")
    private WebElement BenefitPeriod;

    @FindBy (id = "history-benefit-period-option-0")
    private WebElement BenefitPeriodZeroOption;

    @FindBy (id = "history-benefit-period-option-1")
    private WebElement BenefitPeriodFirstOption;

    @FindBy (id = "history-benefit-period-option-2")
    private WebElement BenefitPeriodSecondOption;

    @FindBy (id = "history-benefit-period-option-3")
    private WebElement BenefitPeriodFourthOption;

    @FindBy (id = "team-member-dropdown")
    private WebElement teamMemberDropdown;

    @FindBy (className = "loading")
    private WebElement loadingSpinner;

    @FindBy (className = "app-history-total-requested-aut-test")
    private WebElement amountRequested;

    @FindBy (className = "app-history-total-approved-aut-test")
    private WebElement amountApproved;

    @FindBy (className = "app-history-total-paid-aut-test")
    private WebElement paymentAmount;

    @FindBy (className = "app-history-total-refund-aut-test")
    private WebElement adjustmentAmount;

    @FindBy (className = "total-benefit-paid-aut-test")
    private WebElement totalBenefitAmount;

    @FindBy (xpath = "//button[contains(@aria-label, 'View Less')]")
    private WebElement viewMore;

    @FindBy(className = "requested-amount-courses-test")
    private WebElement firstRequestedCourseAmt;

    @FindBy(id = "submisisonConfirmationApplicationNumber")
    private WebElement submissionIdLink;

    @FindBy(className = "app-amount-aut-test")
    private WebElement appAmount;

    @FindBy(className = "dependent-name-aut")
    private List<WebElement> dependentName;

    @FindBy(id = "openUserProfileLink")
    private WebElement pptNameLink;

    public WebElement getSubmissionIdLink() {
        return submissionIdLink;
    }

    public WebElement getFirstRequestedCourseAmt() {
        return firstRequestedCourseAmt;
    }

    public WebElement getViewMore() {
        return viewMore;
    }

    public WebElement getTotalBenefitAmount() {
        return totalBenefitAmount;
    }

    public WebElement getAdjustmentAmount() {
        return adjustmentAmount;
    }

    public WebElement getPaymentAmount() {
        return paymentAmount;
    }

    public WebElement getAmountApproved() {
        return amountApproved;
    }

    public WebElement getAmountRequested() {
        return amountRequested;
    }

    public WebElement getAppHistoryYouTeamMemberSelect() {
        return appHistoryYouTeamMemberSelect;
    }

    public WebElement getFirstAppNumber() {
        return firstAppNumber;
    }

    public WebElement getFirstAppHistoryTile() {
        return firstAppHistoryTile;
    }

    public WebElement getFirstTeamMemberInList() {
        return firstTeamMemberInList;
    }

    public WebElement getSecondTeamMemberInList() {
        return secondTeamMemberInList;
    }

    public WebElement getTeamMemberMenu() {
        return teamMemberMenu;
    }

    public WebElement getAppHistoryYourCompanyOption() {
        return appHistoryYourCompanyOption;
    }

    public WebElement getAppHistoryYourTeamOption() {
        return appHistoryYourTeamOption;
    }

    public WebElement getTeamMemberSearch() {
        return teamMemberSearch;
    }

    public WebElement getTeamMember() {
        return teamMember;
    }

    public WebElement getViewMoreLessButton() {
        return viewMoreLessButton;
    }

    public List<WebElement> getProgramName() {
        return programName;
    }

    public List<WebElement> getAppHistoryTile() {
        return appHistoryTile;
    }

    public List<WebElement> getAppNumberLink() {
        return appNumberLink;
    }

    public List<WebElement> getViewMoreButton() {
        return viewMoreButton;
    }

    public List<WebElement> getTotalRequestedAmt() {
            return totalRequestedAmt;
    }

    public List<WebElement> getApplicationStatusText() {
        return applicationStatusText;
    }

    public List<WebElement> getTotalApprovedAmt() {
        return totalApprovedAmt;
    }

    public List<WebElement> getTotalPaidAmt() {
        return totalPaidAmt;
    }

    public List<WebElement> getTotalRefundAmt() {
        return totalRefundAmt;
    }

    public List<WebElement> getTotalBenefitPaidAmt() {
        return totalBenefitPaidAmt;
    }

    public List<WebElement> getRequestedCourseAmt() {
        return requestedCourseAmt;
    }

    public List<WebElement> getViewLessButton() {
        return viewLessButton;
    }

    public List<WebElement> getApplicationName() {
        return applicationName;
    }

    public List<WebElement> getApplicationSchool() {
        return applicationSchool;
    }

    public List<WebElement> getApplicationDegree() {
        return applicationDegree;
    }

    public List<WebElement> getCourseDate() {
        return courseDate;
    }

    public List<WebElement> getCourseRelatedAmount() {
        return courseRelatedAmount;
    }

    public List<WebElement> getNonCourseRelatedAmount() {
        return nonCourseRelatedAmount;
    }

    public WebElement getAppHistoryViewMoreApps() {
        return appHistoryViewMoreApps;
    }

    public List<WebElement> getApplicationStatus() {
        return applicationStatus;
    }

    public List<WebElement> getViewFullApplicationButton() {
        return viewFullApplicationButton;
    }

    public WebElement getAppHistoryTeamMemberDropdown() {
        return appHistoryTeamMemberDropdown;
    }

    public WebElement getAppHistoryYourCompanyTeamMemberSelect() {
        return appHistoryYourCompanyTeamMemberSelect;
    }

    public WebElement getAppHistoryYourTeamTeamMemberSelect() {
        return appHistoryYourTeamTeamMemberSelect;
    }

    public WebElement getAppHistoryAppDownloadLink() {
        return appHistoryAppDownloadLink;
    }

    public WebElement getAppHistorySortByDropdown() {
        return appHistorySortByDropdown;
    }

    public WebElement getAppHistorySoryByApplicationStatus() {
        return appHistorySoryByApplicationStatus;
    }

    public WebElement getAppHistorySortByDateSubmitted() {
        return appHistorySortByDateSubmitted;
    }

    public WebElement getApplicationCount() {
        return applicationCount;
    }

    public WebElement getReviewSubmitCancelApplicationButton() {
        return reviewSubmitCancelApplicationButton;
    }

    public WebElement getDeleteApplicationButton() {
        return deleteApplicationButton;
    }

    public WebElement getSortByDropDownButton() {
        return sortByDropDownButton;
    }

    public List<WebElement> getAppNumber() {
        return appNumber;
    }

    public  WebElement getApplicationHistoryHeader() {
        return applicationHistoryHeader;
    }

    public  WebElement getBenefitPeriod() {
        return BenefitPeriod;
    }

    public  WebElement getBenefitPeriodFirstOption() {
        return BenefitPeriodFirstOption;
    }

    public  WebElement getBenefitPeriodSecondOption() {
        return BenefitPeriodSecondOption;
    }

    public  WebElement getBenefitPeriodFourthOption() {
        return BenefitPeriodFourthOption;
    }

    public WebElement getLoadingSpinner() {
        return loadingSpinner;
    }

    public WebElement getTeamMemberDropdown() {
        return teamMemberDropdown;
    }

    public WebElement getBenefitPeriodZeroOption() {
        return BenefitPeriodZeroOption;
    }

    public WebElement getAppAmount() {
        return appAmount;
    }

    public List<WebElement> getDependentName() {
        return dependentName;
    }

    public WebElement getPptNameLink() {
        return pptNameLink;
    }
}
