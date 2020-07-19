package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class AddLoanSummary {

    public AddLoanSummary(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "summary";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "interestRate")
    private WebElement interestRate;

    @FindBy(id = "accountNum")
    private WebElement accountNumber;

    @FindBy(className = "fa-percent")
    private WebElement percentSign;

    @FindBy(id = "loanType3Label")
    private WebElement loanTypeLabel3;

    @FindBy(id = "loanType1Label")
    private WebElement loanTypeLabelOne;

    @FindBy(id = "loanPaymentAddressType2Label")
    private WebElement otherLoanPaymentAddress;

    @FindBy(id = "lrpLoanSummarySubmitButton")
    private WebElement loanSummarySubmitButton;

    @FindBy(id = "loanType3")
    private WebElement loanType3Radio;

    @FindBy(id = "loanPaymentAddressType")
    private WebElement loanPaymentAddressType;

    @FindBy(id = "loanType")
    private WebElement loanType;

    @FindBy(id = "documentType-dropdown")
    private WebElement loanSummaryDocumentTypeDropDown;

    @FindBy(id = "supportingDocumentationSubmitDocumentButton")
    private WebElement loanSummarySubmitDocumentButton;

    @FindBy(id = "supportingDocumentationDocument1")
    private WebElement loanSummarySecondSupportingDocument;

    public WebElement getInterestRate() {
        return interestRate;
    }

    public WebElement getPercentSign() {
        return percentSign;
    }

    public WebElement getAccountNumber() {
        return accountNumber;
    }

    public WebElement getLoanTypeLabel3() {
        return loanTypeLabel3;
    }

    public WebElement getLoanTypeLabelOne() {
        return loanTypeLabelOne;
    }

    public WebElement getOtherLoanPaymentAddress() {
        return otherLoanPaymentAddress;
    }

    public WebElement getLoanSummarySubmitButton() {
        return loanSummarySubmitButton;
    }

    public WebElement getLoanType3Radio() {
        return loanType3Radio;
    }

    public WebElement getLoanPaymentAddressType() {
        return loanPaymentAddressType;
    }

    public WebElement getLoanType() {
        return loanType;
    }

    public WebElement getLoanSummaryDocumentTypeDropDown() {
        return loanSummaryDocumentTypeDropDown;
    }

    public WebElement getLoanSummarySubmitDocumentButton() {
        return loanSummarySubmitDocumentButton;
    }

    public WebElement getLoanSummarySecondSupportingDocument() {
        return loanSummarySecondSupportingDocument;
    }
}