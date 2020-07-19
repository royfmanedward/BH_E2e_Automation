package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class ContactInformation {

    public ContactInformation(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "contactInformation";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "contactInformationContinueButton")
    private WebElement continueButton;

    @FindBy(id = "contactInformationCancelButton")
    private WebElement cancelButton;

    @FindBy(id = "yourAddressHeaderText")
    private WebElement yourAddressHeaderText;

    @FindBy(id = "addressRadioGroup")
    private WebElement addressRadioGroup;

    @FindBy(id = "phoneRadioGroup")
    private WebElement phoneRadioGroup;

    @FindBy(id = "emailRadioGroup")
    private WebElement emailRadioGroup;

    @FindBy(id = "addressRadioGroup1Label")
    private WebElement firstRadioButton;

    @FindBy (className = "loading")
    private WebElement loadingSpinner;

    public WebElement getFirstRadioButton() {
        return firstRadioButton;
    }

    public WebElement getYourAddressHeaderText() {
        return yourAddressHeaderText;
    }

    public WebElement getAddressRadioGroup() {
        return addressRadioGroup;
    }

    public WebElement getPhoneRadioGroup() {
        return phoneRadioGroup;
    }

    public WebElement getEmailRadioGroup() {
        return emailRadioGroup;
    }

    public WebElement getContinueButton() {
        return continueButton;
    }

    public WebElement getCancelButton() {
        return cancelButton;
    }

    public WebElement getLoadingSpinner() {
        return loadingSpinner;
    }
}