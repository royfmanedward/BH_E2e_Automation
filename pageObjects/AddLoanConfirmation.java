package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class AddLoanConfirmation {

    public AddLoanConfirmation(WebDriver driver) { PageFactory.initElements(driver, this); }

    private String url = "loanConfirmation";

    @FindBy(id = "submissionConfirmationDescription")
    private WebElement submissionConfirmationDescription;

    @FindBy(id = "submissionConfirmationStatus")
    private WebElement submissionConfirmationStatus;

    public String getUrl() {
        return url;
    }

    public WebElement getSubmissionConfirmationDescription() {
        return submissionConfirmationDescription;
    }

    public WebElement getSubmissionConfirmationStatus() {
        return submissionConfirmationStatus;
    }
}