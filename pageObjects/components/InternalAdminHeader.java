package pageObjects.components;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class InternalAdminHeader {

    public InternalAdminHeader(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    @FindBy(id = "logoutBtn")
    private WebElement logoutBtn;

    @FindBy(xpath = "(//a[contains(@href, '/home')])")
    private WebElement homeTab;

    @FindBy(xpath = "(//a[contains(@href, '/client/dashboard')])")
    private WebElement clientTab;

    @FindBy(className = "title")
    private WebElement title;

    @FindBy(className = "bh-logo")
    private WebElement logo;

    @FindBy(xpath = "(//ea-navbar)")
    private WebElement navBar;

    public WebElement getLogoutBtn() {
        return logoutBtn;
    }

    public WebElement getHomeTab() {
        return homeTab;
    }

    public WebElement getClientTab() {
        return clientTab;
    }

    public WebElement getTitle() {
        return title;
    }

    public WebElement getLogo() {
        return logo;
    }

    public WebElement getNavBar() {
        return navBar;
    }
}