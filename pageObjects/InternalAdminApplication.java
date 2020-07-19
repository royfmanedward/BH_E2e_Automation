package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class InternalAdminApplication {

    public InternalAdminApplication(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "application";

    @FindBy(className = "component-spinner")
    private WebElement componentSpinner;

    @FindBy(id = "appHeaderClient")
    private WebElement appHeaderClient;

    @FindBy(id = "appHeaderParticipant")
    private WebElement appHeaderParticipant;

    @FindBy(id = "applicationActionsBtn")
    private WebElement applicationActionsBtn;

    @FindBy(id = "commentToParticipantBtn")
    private WebElement commentToParticipantBtn;

    @FindBy(id = "comment")
    private WebElement commentTextbox;

    @FindBy(id = "appHeaderAppStatus")
    private WebElement appHeaderAppStatus;

    @FindBy(xpath = "(//h1[contains(text(),'TUITION APPLICATION')])")
    private WebElement applicationHeader;

    @FindBy(xpath = "(//*[contains(@href, '/home')])")
    private WebElement homeTab;

    @FindBy(id = "lastUpdatedDate")
    private WebElement lastUpdatedDate;

    @FindBy(xpath = "(//ea-navbar)")
    private WebElement navBar;

    @FindBy(id = "editProgramsBtn")
    private WebElement programEditButton;

    @FindBy(id = "cancelEditBtn")
    private WebElement programCancelButton;

    @FindBy(id = "saveEditBtn")
    private WebElement programSaveButton;

    @FindBy(id = "courseOfStudy")
    private WebElement fieldOfStudyDropdown;

    @FindBy(id = "fieldOfStudyEditableInputColumnLabel")
    private WebElement fieldOfStudyHeader;

    @FindBy(className = "aut-field-of-study")
    private WebElement fieldOfStudyText;

    @FindBy(className = "aut-other-field-of-study-label")
    private WebElement otherFieldOfStudyHeader;

    @FindBy(id = "Other Field Of StudyLabelText")
    private WebElement otherFieldOfStudyHeaderInsideEdit;

    @FindBy(xpath = "(//input[@id='otherCourseOfStudy'])")
    private WebElement otherFieldOfStudyInput;

    @FindBy(className = "aut-other-field-of-study")
    private WebElement otherFieldOfStudyText;

    @FindBy(id = "commentInternalNoteBtn")
    private WebElement internalNoteBtn;

    @FindBy(className = "close-icon")
    private WebElement closeIcon;

    @FindBy(id = "ModalSubmitBtn")
    private WebElement commentSubmitBtn;

    @FindBy(id = "ModalCancelBtn")
    private WebElement commentCancelBtn;

    @FindBy(xpath = "(//div[contains(@class,'application-action-menu')]//div[contains(@class,'other-actions-container')]//button[contains(text(),'Add Internal Note')])")
    private WebElement internalNoteLocation;

    @FindBy(xpath = "(//ea-card[contains(@class,'aut-history-card-0')]//ea-timestamp//div[contains(@class, 'aut-date-stamp')])")
    private WebElement firstDateStamp;

    @FindBy(xpath = "(//ea-card[contains(@class,'aut-history-card-0')]//ea-timestamp//div[contains(@class, 'aut-time-stamp')])")
    private WebElement firstTimeStamp;

    @FindBy(className = "status-history-details")
    private List<WebElement> statusHistoryDetails;

    @FindBy(className = "aut-history-title")
    private List<WebElement> statusHistoryTitle;

    @FindBy(className = "aut-history-card-0")
    private List<WebElement> firstStatusHistoryCard;

    @FindBy(xpath = "//ea-comment-details[contains(@class,'aut-created-by')]")
    private List<WebElement> createdBy;

    @FindBy(className = "aut-sendEmailForComment-checkbox")
    private WebElement sendEmailForComment;

    @FindBy(id = "sendEmailForCommentLabel")
    private WebElement sendEmailForCommentLabel;

    @FindBy(xpath = "(//div[contains(@class,'application-action-menu')]//div[contains(@class,'other-actions-container')]//button[contains(text(),'Comment to Participant')])")
    private WebElement commentToParticipantLocation;

    @FindBy(className = "other-actions-container")
    private WebElement otherActionsContainer;

    @FindBy(id = "CommentLabelText")
    private WebElement commentBoxLabel;

    @FindBy(id = "Internal NoteLabelText")
    private WebElement internalNoteCommentBoxLabel;

    @FindBy(xpath = "(//*[contains(@id, 'toggleVisibleAgreementsContentBtnLink')]//span[contains(text(),'View Less')])")
    private WebElement viewLess;

    @FindBy(xpath = "(//*[contains(@id, 'toggleVisibleAgreementsContentBtnLink')]//span[contains(text(),'View More')])")
    private WebElement viewMore;

    @FindBy(xpath = "(//*[contains(@id, 'toggleVisibleAgreementsContentBtnLink')]//i[contains(@class,'toggle-arrow')])")
    private WebElement viewMoreViewLess;

    @FindBy(className = "signed")
    private WebElement signed;

    @FindBy(className = "signee")
    private WebElement signee;

    @FindBy(className = "aut-agreement-timestamp")
    private WebElement agreementsTimestamp;

    @FindBy(className = "agreement-text-0")
    private WebElement firstAgreementText;

    @FindBy(className = "aut-agreements-panel")
    private WebElement agreementsPanel;

    @FindBy(className = "aut-agreements-header")
    private WebElement agreementsHeader;

    @FindBy(className = "aut-expenses-date")
    private WebElement expensesDate;

    @FindBy(className = "alert-message")
    private WebElement alertMessage;

    @FindBy(id = "Other Field Of StudyValidationError")
    private WebElement otherFosValidationError;

    @FindBy(className ="aut-required-error")
    private WebElement requiredErrorText;

    @FindBy(className = "expense-cards-0")
    private WebElement firstExpenseCard;

    @FindBy(id = "APPROVEBtn")
    private WebElement approveBtn;

    @FindBy(id = "ModalSubmitBtn")
    private WebElement approveBtnOnModel;

    @FindBy(id = "DENYBtn")
    private WebElement denyBtn;

    @FindBy(id = "INCOMPLETEBtn")
    private WebElement incompleteBtn;

    @FindBy(id = "CANCELBtn")
    private WebElement cancelBtn;

    @FindBy(xpath = "(//div[contains(@class,'application-action-menu')]//div[contains(@class,'other-actions-container')]//button[contains(text(),' Access Letter of Credit ')])")
    private WebElement accessLocLocation;

    @FindBy(xpath = "//ea-card[contains(@class, 'aut-history-card')]//div[contains(@class, 'aut-card-color')]")
    private List<WebElement> historyCardColor;

    @FindBy(className = "aut-employee-program-label")
    private WebElement employeeProgramLabel;

    @FindBy(xpath = "(//*[contains(@class,'aut-quick-search')]//input)")
    private WebElement quickSearchField;

    @FindBy(className = "application-action-menu")
    private WebElement actionMenu;

    @FindBy(id = "changeApplicationStatusModalSubmitBtn")
    private WebElement statusChangeSubmitBtn;

    @FindBy(id = "changeApplicationStatusModalCancelBtn")
    private WebElement statusChangeCancelBtn;

    @FindBy(xpath = "//ea-card[contains(@class,'aut-history-card-0')]//button[@id='resolveBtn']")
    private WebElement resolveBtn;

    @FindBy(className = "aut-history-card-0")
    private List<WebElement> historyCard;

    @FindBy(className = "app-header-related-app-num")
    private WebElement appHeaderRelatedAppNum;

    @FindBy(className = "app-header-related-app-num")
    private List<WebElement> appHeaderRelatedAppNumList;

    @FindBy(id = "appHeaderRelated")
    private WebElement appHeaderRelated;

    @FindBy(id = "appHeader")
    private WebElement appHeader;

    public String getUrl() {
        return url;
    }

    public WebElement getComponentSpinner() {
        return componentSpinner;
    }

    public WebElement getAppHeaderClient() {
        return appHeaderClient;
    }

    public WebElement getAppHeaderParticipant() {
        return appHeaderParticipant;
    }

    public WebElement getApplicationActionsBtn() {
        return applicationActionsBtn;
    }

    public WebElement getCommentToParticipantBtn() {
        return commentToParticipantBtn;
    }

    public WebElement getCommentTextbox() {
        return commentTextbox;
    }

    public WebElement getAppHeaderAppStatus() {
        return appHeaderAppStatus;
    }

    public WebElement getApplicationHeader() {
        return applicationHeader;
    }

    public WebElement getLastUpdatedDate() {
        return lastUpdatedDate;
    }

    public WebElement getHomeTab() {
        return homeTab;
    }

    public WebElement getNavBar() {
        return navBar;
    }

    public WebElement getProgramEditButton() {
        return programEditButton;
    }

    public WebElement getProgramCancelButton() {
        return programCancelButton;
    }

    public WebElement getProgramSaveButton() {
        return programSaveButton;
    }

    public WebElement getFieldOfStudyDropdown() {
        return fieldOfStudyDropdown;
    }

    public WebElement getFieldOfStudyHeader() {
        return fieldOfStudyHeader;
    }

    public WebElement getFieldOfStudyText() {
        return fieldOfStudyText;
    }

    public WebElement getOtherFieldOfStudyHeader() {
        return otherFieldOfStudyHeader;
    }

    public WebElement getOtherFieldOfStudyHeaderInsideEdit() {
        return otherFieldOfStudyHeaderInsideEdit;
    }

    public WebElement getOtherFieldOfStudyInput() {
        return otherFieldOfStudyInput;
    }

    public WebElement getOtherFieldOfStudyText() {
        return otherFieldOfStudyText;
    }

    public WebElement getInternalNoteBtn() {
        return internalNoteBtn;
    }

    public WebElement getFirstDateStamp() {
        return firstDateStamp;
    }

    public WebElement getFirstTimeStamp() {
        return firstTimeStamp;
    }

    public List<WebElement> getStatusHistoryDetails() {
        return statusHistoryDetails;
    }

    public List<WebElement> getStatusHistoryTitle() {
        return statusHistoryTitle;
    }

    public WebElement getCloseIcon() {
        return closeIcon;
    }

    public WebElement getCommentSubmitBtn() {
        return commentSubmitBtn;
    }

    public WebElement getCommentCancelBtn() {
        return commentCancelBtn;
    }

    public WebElement getSendEmailForComment() {
        return sendEmailForComment;
    }

    public WebElement getSendEmailForCommentLabel() {
        return sendEmailForCommentLabel;
    }

    public WebElement getCommentToParticipantLocation() {
        return commentToParticipantLocation;
    }

    public WebElement getInternalNoteLocation() {
        return internalNoteLocation;
    }

    public List<WebElement> getFirstStatusHistoryCardStatusHistoryCard() {
        return firstStatusHistoryCard;
    }

    public List<WebElement> getCreatedBy() {
        return createdBy;
    }

    public WebElement getOtherActionsContainer() {
        return otherActionsContainer;
    }

    public WebElement getCommentBoxLabel() {
        return commentBoxLabel;
    }

    public WebElement getInternalNoteCommentBoxLabel() {
        return internalNoteCommentBoxLabel;
    }

    public WebElement getViewLess() {
        return viewLess;
    }

    public WebElement getViewMore() {
        return viewMore;
    }

    public WebElement getViewMoreViewLess() {
        return viewMoreViewLess;
    }

    public WebElement getSigned() {
        return signed;
    }

    public WebElement getSignee() {
        return signee;
    }

    public WebElement getAgreementsTimestamp() {
        return agreementsTimestamp;
    }

    public WebElement getFirstAgreementText() {
        return firstAgreementText;
    }

    public WebElement getAgreementsPanel() {
        return agreementsPanel;
    }

    public WebElement getAgreementsHeader() {
        return agreementsHeader;
    }

    public WebElement getExpensesDate() {
        return expensesDate;
    }

    public WebElement getAlertMessage() {
        return alertMessage;
    }

    public WebElement getOtherFosValidationError() {
        return otherFosValidationError;
    }

    public WebElement getRequiredErrorText() {
        return requiredErrorText;
    }

    public WebElement getFirstExpenseCard() {
        return firstExpenseCard;
    }

    public WebElement getApproveBtn() {
        return approveBtn;
    }

    public WebElement getApproveBtnOnModel() {
        return approveBtnOnModel;
    }

    public WebElement getDenyBtn() {
        return denyBtn;
    }

    public WebElement getIncompleteBtn() {
        return incompleteBtn;
    }

    public WebElement getCancelBtn() {
        return cancelBtn;
    }

    public WebElement getAccessLocLocation() {
        return accessLocLocation;
    }

    public List<WebElement> getHistoryCardColor() {
        return historyCardColor;
    }

    public WebElement getEmployeeProgramLabel() {
        return employeeProgramLabel;
    }

    public WebElement getQuickSearchField() {
        return quickSearchField;
    }

    public WebElement getActionMenu() {
        return actionMenu;
    }

    public WebElement getStatusChangeSubmitBtn() {
        return statusChangeSubmitBtn;
    }

    public WebElement getStatusChangeCancelBtn() {
        return statusChangeCancelBtn;
    }

    public WebElement getResolveBtn() {
        return resolveBtn;
    }

    public List<WebElement> getHistoryCard() {
        return historyCard;
    }

    public WebElement getAppHeaderRelated() {
        return appHeaderRelated;
    }

    public WebElement getAppHeaderRelatedAppNum() {
        return appHeaderRelatedAppNum;
    }

    public List<WebElement> getAppHeaderRelatedAppNumList() {
        return appHeaderRelatedAppNumList;
    }

    public WebElement getAppHeader() {
        return appHeader;
    }
}
