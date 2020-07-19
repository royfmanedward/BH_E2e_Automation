package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class Logout {

    public Logout(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "Logout";

    @FindBy(id = "pageContent")
    private WebElement logoutText;

    public String getUrl() {
        return url;
    }

    public WebElement getLogoutText() {
        return logoutText;
    }
}
