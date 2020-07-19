package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class EdGoalSubmitted  {

    public EdGoalSubmitted(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }
    private String url = "submitted";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "submissionConfirmationStatus")
    private WebElement submissionConfirmationStatus;

    public WebElement getSubmissionConfirmationStatus() {
        return submissionConfirmationStatus;
    }
}