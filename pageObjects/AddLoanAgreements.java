package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class AddLoanAgreements {

    public AddLoanAgreements(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "loanAgreements";

    @FindBy(id = "signature")
    private WebElement signatureBox;

    @FindBy(id = "lrpAddLoanStep4SubmitButton")
    private WebElement step4ContinueBtn;

    @FindBy(id = "participantAgreementCheckboxLabel")
    private WebElement participantAgreementCheckbox;

    @FindBy(id = "lrpAddLoanStep4CancelButton")
    private WebElement lrpStep4CancelButton;

    @FindBy(id = "modalSubmitBtn")
    private WebElement lrpStep4CancelLoanModal;

    @FindBy(id = "agreementSignInstructions")
    private WebElement agreementSignInstructions;

    public String getUrl() { return url; }

    public WebElement getParticipantAgreementCheckbox() {
        return participantAgreementCheckbox;
    }

    public WebElement getSignatureBox() {
        return signatureBox;
    }

    public WebElement getStep4ContinueBtn() {
        return step4ContinueBtn;
    }

    public WebElement getLrpStep4CancelButton() {
        return lrpStep4CancelButton;
    }

    public WebElement getLrpStep4CancelLoanModal() {
        return lrpStep4CancelLoanModal;
    }

    public WebElement getAgreementSignInstructions() {
        return agreementSignInstructions;
    }
}