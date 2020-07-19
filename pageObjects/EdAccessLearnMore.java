package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class EdAccessLearnMore {
    public EdAccessLearnMore(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "learnMore";

    public String getUrl() {
        return url;
    }

    @FindBy(className = "ed-options")
    private WebElement fastTrackSection;

    @FindBy(xpath = "//*[contains (@class, 'ed-options')]//*[contains (@class, 'logo')]")
    private WebElement fastTrackLogo;

    @FindBy(xpath = "//img[contains (@class, 'logo margin-bottom-4')]")
    private List<WebElement> fastTrackLogoList;

    @FindBy(className = "fasttrack-text-test")
    private WebElement fastTrackText;

    @FindBy(xpath = "//img[contains (@class, 'logo margin-bottom-4')]/following::div[1]")
    private WebElement fastTrackDescription;

    @FindBy(xpath = "//button[contains(text(), 'Learn More')]")
    private WebElement providerLearnMoreButton;

    @FindBy(id = "navLinkNewApplicationButton")
    private WebElement navLinkNewApplicationButton;

    @FindBy(className = "provider-logo")
    private WebElement providerLogo;

    @FindBy(className = "provider-logo")
    private List<WebElement> providerLogoList;

    @FindBy(className = "provider-description")
    private List<WebElement> providerDescriptionList;

    @FindBy(className = "provider-description")
    private WebElement providerDescription;

    @FindBy(xpath = "//provider-options//button[contains(@class, 'learn-link')]")
    private WebElement providerLearnMore;

    @FindBy(className = "modal-content")
    private WebElement providerModal;

    @FindBy(id = "modalSubmitBtn")
    private WebElement modalSubmitBtn;

    public WebElement getProviderLearnMoreButton() {
        return providerLearnMoreButton;
    }

    public WebElement getProviderModal() {
        return providerModal;
    }

    public WebElement getModalSubmitBtn() {
        return modalSubmitBtn;
    }

    public WebElement getProviderLearnMore() {
        return providerLearnMore;
    }

    public WebElement getProviderDescription() {
        return providerDescription;
    }

    public List<WebElement> getProviderDescriptionList() {
        return providerDescriptionList;
    }

    public List<WebElement> getProviderLogoList() {
        return providerLogoList;
    }

    public WebElement getProviderLogo() {
        return providerLogo;
    }

    public WebElement getNavLinkNewApplicationButton() {
        return navLinkNewApplicationButton;
    }

    public WebElement getFastTrackDescription() {
        return fastTrackDescription;
    }

    public WebElement getFastTrackText() {
        return fastTrackText;
    }

    public WebElement getFastTrackLogo() {
        return fastTrackLogo;
    }

    public List<WebElement> getFastTrackLogoList() {
        return fastTrackLogoList;
    }

    public WebElement getFastTrackSection() {
        return fastTrackSection;
    }
}
