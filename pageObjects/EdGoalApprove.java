package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class EdGoalApprove {

    public EdGoalApprove (WebDriver driver) { PageFactory.initElements(driver, this); }
    private String url = "educationGoal";

    public String getUrl() { return url; }

    @FindBy(id = "edGoalApproveButton")
    private WebElement edGoalApproveButton;

    @FindBy(id = "edGoalIncompleteButton")
    private WebElement edGoalIncompleteButton;

    @FindBy(id = "edGoalDenyButton")
    private WebElement edGoalDenyButton;

    @FindBy(id = "comment")
    private WebElement comment;

    @FindBy(id = "submitButton")
    private WebElement submitButton;

    @FindBy(id = "statusHistoryBlockStatus")
    private WebElement statusHistoryBlockStatus;

    @FindBy(id = "appSummaryCloseEdGoalBtn")
    private WebElement appSummaryCloseEdGoalBtn;

    @FindBy(id = "submitButton")
    private WebElement closeEdGoalsubmitButton;

    @FindBy(id = "supportingDocumentationDocument0")
    private WebElement supportingDocumentationDocument0;

    @FindBy(id = "viewAllStatusHistoryButton")
    private WebElement viewAllStatusHistoryButton;

    @FindBy(className = "forwardedToSupervisorForReviewStatusHistoryText")
    private WebElement forwardedToSupervisorForReviewStatusHistoryText;

    @FindBy(className = "comments-aut-test")
    private WebElement commentsAutTest;

    @FindBy(id = "programsEmployeeProgram")
    private WebElement programsEmployeeProgram;

    @FindBy(id = "programsEducationProgram")
    private WebElement programsEducationProgram;

    @FindBy(id = "programSpecialty")
    private WebElement programSpecialty;

    @FindBy(id = "programsName")
    private WebElement programsName;

    @FindBy(id = "estimatedAmount")
    private WebElement estimatedAmount;

    @FindBy(id = "estimatedCreditHours")
    private WebElement estimatedCreditHours;

    @FindBy(id = "financialAidAmount")
    private WebElement financialAidAmount;

    @FindBy(id = "programsEditButton")
    private WebElement programsEditButton;

    @FindBy(id = "estimatedExpensesTimelineEditButton")
    private WebElement estimatedExpensesTimelineEditButton;

    @FindBy(id = "edgoalStartDateField")
    private WebElement edgoalStartDateField;

    @FindBy(id = "edgoalEndDateField")
    private WebElement edgoalEndDateField;

    @FindBy(id = "signedAgreementText")
    private WebElement signedAgreementText;

    @FindBy(id = "signedAgreementDate")
    private WebElement signedAgreementDate;

    @FindBy(id = "agreementsEditButton")
    private WebElement agreementsEditButton;

    @FindBy(className = "status-history-msg-aut-test-0")
    private WebElement statusHistoryMsgAuttTest0;

    @FindBy(id = "appSummaryCancelEdGoalBtn")
    private WebElement appSummaryCancelEdGoalBtn;

    public WebElement getAppSummaryCancelEdGoalBtn() {
        return appSummaryCancelEdGoalBtn;
    }

    public WebElement getEdGoalApproveButton() {
        return edGoalApproveButton;
    }

    public WebElement getEdGoalIncompleteButton() {
        return edGoalIncompleteButton;
    }

    public WebElement getEdGoalDenyButton() {
        return edGoalDenyButton;
    }

    public WebElement getComment() {
        return comment;
    }

    public WebElement getSubmitButton() {
        return submitButton;
    }

    public WebElement getStatusHistoryBlockStatus() {
        return statusHistoryBlockStatus;
    }

    public WebElement getAppSummaryCloseEdGoalBtn() {
        return appSummaryCloseEdGoalBtn;
    }

    public WebElement getCloseEdGoalsubmitButton() {
        return closeEdGoalsubmitButton;
    }

    public WebElement getSupportingDocumentationDocument0() {
        return supportingDocumentationDocument0;
    }

    public WebElement getViewAllStatusHistoryButton() {
        return viewAllStatusHistoryButton;
    }

    public WebElement getForwardedToSupervisorForReviewStatusHistoryText() {
        return forwardedToSupervisorForReviewStatusHistoryText;
    }

    public WebElement getProgramsEmployeeProgram() {
        return programsEmployeeProgram;
    }

    public WebElement getProgramsEducationProgram() {
        return programsEducationProgram;
    }

    public WebElement getProgramSpecialty() {
        return programSpecialty;
    }

    public WebElement getProgramsName() {
        return programsName;
    }

    public WebElement getEstimatedAmount() {
        return estimatedAmount;
    }

    public WebElement getEstimatedCreditHours() {
        return estimatedCreditHours;
    }

    public WebElement getFinancialAidAmount() {
        return financialAidAmount;
    }

    public WebElement getCommentsAutTest() {
        return commentsAutTest;
    }

    public WebElement getProgramsEditButton() {
        return programsEditButton;
    }

    public WebElement getEstimatedExpensesTimelineEditButton() {
        return estimatedExpensesTimelineEditButton;
    }

    public WebElement getEdgoalStartDateField() {
        return edgoalStartDateField;
    }

    public WebElement getEdgoalEndDateField() {
        return edgoalEndDateField;
    }

    public WebElement getSignedAgreementText() {
        return signedAgreementText;
    }

    public WebElement getSignedAgreementDate() {
        return signedAgreementDate;
    }

    public WebElement getStatusHistoryMsgAuttTest0() {
        return statusHistoryMsgAuttTest0;
    }

    public WebElement getAgreementsEditButton() {
        return agreementsEditButton;
    }
}