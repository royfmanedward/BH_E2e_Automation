package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class AddLoanPayments { public AddLoanPayments(WebDriver driver) { PageFactory.initElements(driver, this );
    }

    private String url = "loanPayments";

    @FindBy(id = "paymentAmount")
    private WebElement paymentAmountBox;

    @FindBy(id = "label")
    private WebElement addressVerifiedLabelCheckbox;

    @FindBy(id = "paymentActive1Label")
    private WebElement paymentActive1Label;

    @FindBy(id = "loanType1Label")
    private WebElement loanType1Option;

    @FindBy(id = "lrpAddLoanStep3SubmitButton")
    private WebElement step3ContinueBtn;

    @FindBy(id = "loanName")
    private WebElement loanNameBox;

    @FindBy(id = "supportingDocumentationSelectFileLink")
    private WebElement selectFileLink;

    @FindBy(id = "supportingDocumentComment")
    private WebElement commentText;

    @FindBy(id = "supportingDocumentationSubmitDocumentButton")
    private WebElement submitDocumentButton;

    @FindBy(id = "supportingDocumentationDocument0")
    private WebElement firstSupportingDocument;

    @FindBy(id = "supportingDocumentationDocument1")
    private WebElement secondSupportingDocument;

    @FindBy(id = "documentType-dropdown")
    private WebElement documentTypeDropdown;

    @FindBy(id = "loanType-button")
    private WebElement loanTypeDropdown;

    @FindBy(id = "supportingDocumentationDocument2")
    private WebElement thirdSupportingDocument;

    public String getUrl() {
        return url;
    }

    public WebElement getPaymentAmountBox() {
        return paymentAmountBox;
    }

    public WebElement getAddressVerifiedLabelCheckbox() {
        return addressVerifiedLabelCheckbox;
    }

    public WebElement getPaymentActive1Label() {
        return paymentActive1Label;
    }

    public WebElement getLoanType1Option() {
        return loanType1Option;
    }

    public WebElement getStep3ContinueBtn() {
        return step3ContinueBtn;
    }

    public WebElement getLoanNameBox() {
        return loanNameBox;
    }

    public WebElement getSelectFileLink() {
        return selectFileLink;
    }

    public WebElement getCommentText() {
        return commentText;
    }

    public WebElement getSubmitDocumentButton() {
        return submitDocumentButton;
    }

    public WebElement getDocumentTypeDropdown() {
        return documentTypeDropdown;
    }

    public WebElement getLoanTypeDropdown() {
        return loanTypeDropdown;
    }

    public WebElement getFirstSupportingDocument() {
        return firstSupportingDocument;
    }

    public WebElement getSecondSupportingDocument() {
        return secondSupportingDocument;
    }

    public WebElement getThirdSupportingDocument() {
        return thirdSupportingDocument;
    }
}