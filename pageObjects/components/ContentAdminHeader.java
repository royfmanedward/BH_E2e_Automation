package pageObjects.components;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class ContentAdminHeader {

    public ContentAdminHeader(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    @FindBy(id = "navLogoImage")
    private WebElement homeLogoImage;

    @FindBy(id = "nav-link-admin")
    private WebElement content;

    @FindBy(id = "nav-link-sys-admin")
    private WebElement systemAdmin;

    @FindBy(id = "nav-link-user-admin")
    private WebElement userAdmin;

    @FindBy(id = "nav-link-loan-servicers")
    private WebElement loanServicers;

    @FindBy(id = "iconProfile")
    private WebElement iconProfile;

    @FindBy(id = "profile-link-change-password")
    private WebElement profileChangePassword;

    @FindBy(id = "profile-link-logout")
    private WebElement logoutNav;

    public WebElement getHomeLogoImage() {
        return homeLogoImage;
    }

    public WebElement getContent() {
        return content;
    }

    public WebElement getSystemAdmin() {
        return systemAdmin;
    }

    public WebElement getUserAdmin() {
        return userAdmin;
    }

    public WebElement getLoanServicers() {
        return loanServicers;
    }

    public WebElement getIconProfile() {
        return iconProfile;
    }

    public WebElement getProfileChangePassword() {
        return profileChangePassword;
    }

    public WebElement getLogoutNav() {
        return logoutNav;
    }
}

