package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class EducationAccess {

    public EducationAccess(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "educationAccess";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "nav-link-home")
    private WebElement homeNavEdAccess;

    public WebElement getHomeNavEdAccess() {
        return homeNavEdAccess;
    }
}