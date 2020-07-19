package pageObjects.components;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class UserImpersonation {

    public UserImpersonation(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    @FindBy(id = "userImpersonation")
    private WebElement userImpersonation;

    @FindBy(id = "impersonateNameId")
    private WebElement impersonateNameId;

    public WebElement getUserImpersonation() {
        return userImpersonation;
    }

    public WebElement getImpersonateNameId() {
        return impersonateNameId;
    }
}
