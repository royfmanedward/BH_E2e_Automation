package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class Appeal {

    public Appeal(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "appeal";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "appealSummaryHeader")
    private WebElement appealHeader;

    @FindBy(id = "appealDeniedAppText")
    private WebElement appealHeaderText;

    @FindBy(id = "reasonsForDenialHeaderText")
    private WebElement reasonsForDenialHeader;

    @FindBy(id = "denialFrom0")
    private WebElement denialFrom0;

    @FindBy(id = "denialReason0")
    private WebElement denialReason0;

    @FindBy(id = "denialDatetime0")
    private WebElement denialDatetime0;

    @FindBy(id = "reasonForAppealHeaderText")
    private WebElement reasonForAppealHeader;

    @FindBy(id = "reasonForAppeal-label")
    private WebElement reasonForAppealLabel;

    @FindBy(xpath = "//li[contains(@id, 'reasonForAppeal-option-')]")
    private List<WebElement> appealDropDownList;

    @FindBy(id = "reasonForAppeal-dropdown")
    private WebElement reasonForAppealDropdown;

    @FindBy(id = "reasonForAppeal-button")
    private WebElement appealReasonButton;

    @FindBy(id = "commentsHeaderText")
    private WebElement commentsHeader;

    @FindBy(id = "commentsAppealText")
    private WebElement commentHeaderText;

    @FindBy(id = "appealCommentsInput")
    private WebElement appealCommentText;

    @FindBy(id = "supportingDocumentationHeaderText")
    private WebElement supportingDocumentationHeader;

    @FindBy(id = "submitDocsAdditionalInfoText")
    private WebElement submitDocsAdditionalInfoText;

    @FindBy(id = "supportingDocumentationSelectFileLink")
    private WebElement DocumentUploadLink;

    @FindBy(id = "sendAppealButton")
    private WebElement sendAppealButton;

    @FindBy(id = "cancelAppealsButton")
    private WebElement cancelAppealsButton;

    @FindBy(id = "supportingDocumentationSubmitDocumentButton")
    private WebElement submitDocumentButton;

    @FindBy(id = "supportingDocumentationDocument0")
    private WebElement supportingDocumentType;

    @FindBy(id = "genericConfirmationNoBtn")
    private WebElement modalNo;

    @FindBy(id = "genericConfirmationYesBtn")
    private WebElement modalYes;

    @FindBy(id = "Msg")
    private WebElement errorMessage;

    @FindBy(id = "submisisonConfirmationApplicationNumber")
    private WebElement submissionIdLink;

    public WebElement getSubmissionIdLink() {
        return submissionIdLink;
    }

    public WebElement getAppealHeader() {
        return appealHeader;
    }

    public WebElement getAppealHeaderText() {
        return appealHeaderText;
    }

    public WebElement getReasonsForDenialHeader() {
        return reasonsForDenialHeader;
    }

    public WebElement getDenialFrom0() {
        return denialFrom0;
    }

    public WebElement getDenialReason0() {
        return denialReason0;
    }

    public WebElement getDenialDatetime0() {
        return denialDatetime0;
    }

    public WebElement getReasonForAppealHeader() {
        return reasonForAppealHeader;
    }

    public WebElement getReasonForAppealLabel() {
        return reasonForAppealLabel;
    }

    public List<WebElement> getAppealDropDownList() {
        return appealDropDownList;
    }

    public WebElement getReasonForAppealDropdown() {
        return reasonForAppealDropdown;
    }

    public WebElement getAppealReasonButton() {
        return appealReasonButton;
    }

    public WebElement getCommentsHeader() {
        return commentsHeader;
    }

    public WebElement getCommentHeaderText() {
        return commentHeaderText;
    }

    public WebElement getAppealCommentText() {
        return appealCommentText;
    }

    public WebElement getSupportingDocumentationHeader() {
        return supportingDocumentationHeader;
    }

    public WebElement getSubmitDocsAdditionalInfoText() {
        return submitDocsAdditionalInfoText;
    }

    public WebElement getDocumentUploadLink() {
        return DocumentUploadLink;
    }

    public WebElement getSendAppealButton() {
        return sendAppealButton;
    }

    public WebElement getCancelAppealsButton() {
        return cancelAppealsButton;
    }

    public WebElement getSubmitDocumentButton() {
        return submitDocumentButton;
    }

    public WebElement getSupportingDocumentType() {
        return supportingDocumentType;
    }

    public WebElement getModalNo() {
        return modalNo;
    }

    public WebElement getModalYes() {
        return modalYes;
    }

    public WebElement getErrorMessage() {
        return errorMessage;
    }
}