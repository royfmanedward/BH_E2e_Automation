package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class Agreement {

    public Agreement(WebDriver driver) { PageFactory.initElements(driver, this);}

    private String url = "agreement";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "didYouReceiveAnyGrantsScholarshipsOrDiscountsHeaderText")
    private WebElement discountGrantQuestion;

    @FindBy(id = "grantsEligibleRadioGroup2Label")
    private WebElement eligibleGrantsNoRadioLabel;

    @FindBy(id = "grantsEligibleRadioGroup1Label")
    private WebElement eligibleGrantsYesRadioLabel;

    @FindBy(id = "financialAidSourceId-dropdown")
    private WebElement financialAidDropdown;

    @FindBy(id = "otherFinancialAid")
    private WebElement otherFinancialAidInput;

    @FindBy(id = "financialAidAmount")
    private WebElement financialAidAmountInput;

    @FindBy(id = "agreement1CheckboxLabel")
    private WebElement agreement1Label;

    @FindBy(id = "agreement2CheckboxLabel")
    private WebElement agreement2Label;

    @FindBy(id = "agreement3CheckboxLabel")
    private WebElement agreement3Label;

    @FindBy(id = "signature")
    private WebElement signatureInput;

    @FindBy(id = "contactInformationContinueButton")
    private WebElement continueButton;

    @FindBy(id = "contactInformationCancelButton")
    private WebElement cancelButton;

    @FindBy(id = "saveForLaterButton")
    private WebElement saveApplicationForLaterButton;

    @FindBy(id = "deleteApplicationButton")
    private WebElement deleteApplicationButton;

    @FindBy(id = "signatureValidationText")
    private WebElement signatureValidationText;

    @FindBy(id = "enterYourNameExactlyAsItAppearsAboveLabelText")
    private WebElement agreementInstructionText;

    @FindBy(id = "ferpaAgreementCheckboxValidationText")
    private WebElement sampleAgreementCheckboxValidationText;

    @FindBy(id = "grantsEligibleRadioGroupValidationText")
    private WebElement grantsEligibleRadioGroupValidationText;

    @FindBy(id = "financialAidAmountValidationText")
    private WebElement financialAidAmountValidationText;

    @FindBy(id = "otherFinancialAidValidationText")
    private WebElement otherFinancialAidValidationText;

    @FindBy(id = "agreementContinueButton")
    private WebElement agreementContinueButton;

    @FindBy(className = "input-group-addon")
    private List<WebElement> dollarSymbols;

    public WebElement getDiscountGrantQuestion() {
        return discountGrantQuestion;
    }

    public WebElement getEligibleGrantsNoRadioLabel() {
        return eligibleGrantsNoRadioLabel;
    }

    public WebElement getEligibleGrantsYesRadioLabel() {
        return eligibleGrantsYesRadioLabel;
    }

    public WebElement getFinancialAidDropdown() {
        return financialAidDropdown;
    }

    public WebElement getOtherFinancialAidInput() {
        return otherFinancialAidInput; }

    public WebElement getFinancialAidAmountInput() {
        return financialAidAmountInput;
    }

    public WebElement getAgreement1Label() {
        return agreement1Label;
    }

    public WebElement getAgreement2Label() {
        return agreement2Label;
    }

    public WebElement getAgreement3Label() {
        return agreement3Label;
    }

    public WebElement getSignatureInput() {
        return signatureInput;
    }

    public WebElement getContinueButton() {
        return continueButton;
    }

    public WebElement getCancelButton() {
        return cancelButton;
    }

    public WebElement getSaveApplicationForLaterButton() {
        return saveApplicationForLaterButton;
    }

    public WebElement getDeleteApplicationButton() {
        return deleteApplicationButton;
    }

    public WebElement getSignatureValidationText() {
        return signatureValidationText;
    }

    public WebElement getAgreementInstructionText() {
        return agreementInstructionText;
    }

    public WebElement getSampleAgreementCheckboxValidationText() {
        return sampleAgreementCheckboxValidationText;
    }

    public WebElement getGrantsEligibleRadioGroupValidationText() {
        return grantsEligibleRadioGroupValidationText;
    }

    public WebElement getFinancialAidAmountValidationText() {
        return financialAidAmountValidationText;
    }

    public WebElement getOtherFinancialAidValidationText() {
        return otherFinancialAidValidationText;
    }

    public WebElement getAgreementContinueButton() {
        return agreementContinueButton;
    }

    public List<WebElement> getDollarSymbols() {
        return dollarSymbols;
    }
}
