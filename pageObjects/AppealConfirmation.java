package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class AppealConfirmation {

    public AppealConfirmation(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "appeal";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "submissionConfirmationReturnHomeButton")
    private WebElement returnHomePageButton;

    @FindBy(id = "submissionConfirmationLogoutButton")
    private WebElement logoutButton;

    @FindBy(id = "submisisonConfirmationApplicationNumber")
    private WebElement applicationNumberLink;

    @FindBy(id = "submissionConfirmationDescription")
    private WebElement submissionConfirmationDescription;

    @FindBy(id = "submisisonConfirmationApplicationNumber")
    private WebElement submissionIdLink;

    public WebElement getReturnHomePageButton() {
        return returnHomePageButton;
    }

    public WebElement getLogoutButton() {
        return logoutButton;
    }

    public WebElement getApplicationNumberLink() {
        return applicationNumberLink;
    }

    public WebElement getSubmissionConfirmationDescription() {
        return submissionConfirmationDescription;
    }

    public WebElement getSubmissionIdLink() {
        return submissionIdLink;
    }
}