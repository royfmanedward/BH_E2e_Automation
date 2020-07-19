package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class AddLoanSubmittedPayment {

    public AddLoanSubmittedPayment(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "submittedPayment";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "modalSubmitBtn")
    private WebElement cancelPaymentConfirmButton;

    @FindBy(id = "reasonForStopping")
    private WebElement reasonForStoppingTextField;

    @FindBy(id = "deleteCommentButtonIcon")
    private WebElement deleteCommentButtonIcon;

    @FindBy(className = "application-status-block")
    private WebElement requestCancelledHistoryText;

    @FindBy(id = "submittedPaymentStopPaymentBtn")
    private WebElement submittedPaymentStopPaymentBtn;

    @FindBy(className = "application-reason-text")
    private WebElement applicationReasonText;

    @FindBy(id = "addNewCommentButton")
    private WebElement addNewCommentBtnPaymentRequest;

    @FindBy(id = "commentsTextAreaInput")
    private WebElement addNewCommentPayReqTextField;

    @FindBy(id = "saveCommentButton")
    private WebElement saveCommentPayReqButton;

    @FindBy(className = "comments-aut-test")
    private WebElement commentBoxTextPayRequest;

    @FindBy(id = "signedAgreementDate")
    private WebElement agreementsSignedDate;

    @FindBy(id = "supportingDocumentationDocument0")
    private WebElement supportingDocSubmittedPayment1;

    @FindBy(id = "supportingDocumentationDocument1")
    private WebElement supportingDocSubmittedPayment2;

    public WebElement getApplicationReasonText() {
        return applicationReasonText;
    }

    public WebElement getSubmittedPaymentStopPaymentBtn() {
        return submittedPaymentStopPaymentBtn;
    }

    public WebElement getRequestCancelledHistoryText() {
        return requestCancelledHistoryText;
    }

    public WebElement getCancelPaymentConfirmButton() {
        return cancelPaymentConfirmButton;
    }

    public WebElement getReasonForStoppingTextField() {
        return reasonForStoppingTextField;
    }

    public WebElement getAddNewCommentBtnPaymentRequest() {
        return addNewCommentBtnPaymentRequest;
    }

    public WebElement getAddNewCommentPayReqTextField() {
        return addNewCommentPayReqTextField;
    }

    public WebElement getSaveCommentPayReqButton() {
        return saveCommentPayReqButton;
    }

    public WebElement getCommentBoxTextPayRequest() {
        return commentBoxTextPayRequest;
    }

    public WebElement getAgreementsSignedDate() {
        return agreementsSignedDate;
    }

    public WebElement getSupportingDocSubmittedPayment1() {
        return supportingDocSubmittedPayment1;
    }

    public WebElement getSupportingDocSubmittedPayment2() {
        return supportingDocSubmittedPayment2;
    }

    public WebElement getDeleteCommentButtonIcon() {
        return deleteCommentButtonIcon;
    }
}