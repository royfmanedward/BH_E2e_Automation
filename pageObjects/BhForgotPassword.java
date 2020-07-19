package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class BhForgotPassword {

    public BhForgotPassword(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "ForgotPassword";

    @FindBy(id = "Email")
    private WebElement emailAddressInput;

    @FindBy(id = "btnsubmit")
    private WebElement resetMyPasswordBtn;

    @FindBy(xpath = "//label[contains(text(),'Password reset instructions have been sent to the')]")
    private WebElement oneBhForgotPwdSuccessText;

    public String getUrl() {
        return url;
    }

    public WebElement getEmailAddressInput() {
        return emailAddressInput;
    }

    public WebElement getResetMyPasswordBtn() {
        return resetMyPasswordBtn;
    }

    public WebElement getOneBhForgotPwdSuccessText() {
        return oneBhForgotPwdSuccessText;
    }
}
