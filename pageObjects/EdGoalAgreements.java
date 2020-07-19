package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class EdGoalAgreements {

    public EdGoalAgreements(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "agreements";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "agreementContinueButton")
    private WebElement agreementContinueButton;

    @FindBy(id = "signature")
    private WebElement signature;

    public WebElement getAgreementContinueButton() {
        return agreementContinueButton;
    }

    public WebElement getSignature() {
        return signature;
    }
}