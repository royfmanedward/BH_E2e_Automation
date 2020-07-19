package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class EditRegistration {

    public EditRegistration(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "EditRegistration";

    @FindBy(className = "validation-summary-errors")
    private WebElement errorMessage;

    public String getUrl() {
        return url;
    }

    public WebElement getErrorMessage() {
        return errorMessage;
    }
}