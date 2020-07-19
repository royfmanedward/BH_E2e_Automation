package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class CollegeCoachHome {

    public CollegeCoachHome(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "Home";

    @FindBy(xpath = "//div[contains(text(),'EdAssist Solutions')]")
    private WebElement edAssistSolution;

    @FindBy(className = "menuArrowLOB")
    private WebElement otherServices;

    public String getUrl() {
        return url;
    }

    public WebElement getEdAssistSolution() {
        return edAssistSolution;
    }

    public WebElement getOtherServices() {
        return otherServices;
    }
}
