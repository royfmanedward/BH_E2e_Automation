package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class EducationNetwork { public EducationNetwork(WebDriver driver) { PageFactory.initElements(driver, this); }

    private String url = "matrix";

    @FindBy(className = "edassist-search-bar")
    private WebElement findASpecificSchoolInput;

    @FindBy(partialLinkText = "Magnus")
    private WebElement result1Text;

    public String getUrl() {
        return url;
    }

    public WebElement getFindASpecificSchoolInput() {
        return findASpecificSchoolInput;
    }

    public WebElement getResult1Text() {
        return result1Text;
    }
}