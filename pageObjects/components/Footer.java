package pageObjects.components;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class Footer {

    public Footer(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    @FindBy(id = "legalModalContent")
    private WebElement textArea;

    @FindBy(id = "btn-terms-conditions")
    private WebElement termsConditions;

    @FindBy(id = "btn-privacy-policy")
    private WebElement privacyPolicy;

    @FindBy(id = "legalModalCloseButton")
    private WebElement closeBtn;

    @FindBy(id = "footerLogo")
    private WebElement footerLogoImage;

    @FindBy(xpath = "//a[contains(@href,'/global-privacy')]")
    private WebElement policyLink;

    @FindBy(xpath = "//a[contains(@href,'/terms-use')]")
    private WebElement termsLink;

    @FindBy(xpath = "//a[contains(@href,'/trademarks')]")
    private WebElement trademarkLink;


    public WebElement getTextArea() {
        return textArea;
    }

    public WebElement getTermsConditions() {
        return termsConditions;
    }

    public WebElement getPrivacyPolicy() {
        return privacyPolicy;
    }

    public WebElement getCloseBtn() {
        return closeBtn;
    }

    public WebElement getFooterLogoImage() {
        return footerLogoImage;
    }

    public WebElement getPolicyLink() {
        return policyLink;
    }

    public WebElement getTermsLink() {
        return termsLink;
    }

    public WebElement getTrademarkLink() {
        return trademarkLink;
    }


}
