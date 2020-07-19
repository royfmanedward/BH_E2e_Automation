package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class ClientAdminUsageOverview {
    public ClientAdminUsageOverview(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "usageOverview";

    public String getUrl() {
        return url;
    }
}
