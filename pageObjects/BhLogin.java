package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class BhLogin {

    public BhLogin(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "secureauthssodev.brighthorizons";

    @FindBy(id = "ContentPlaceHolder1_MFALoginControl1_UserIDView_txtUserid_UiInput")
    private WebElement bhUsernameInput;

    @FindBy(id = "ContentPlaceHolder1_MFALoginControl1_UserIDView_tbxPassword_UiInput")
    private WebElement bhPasswordInput;

    @FindBy(id = "loginBtnSubmit")
    private WebElement bhLoginBtn;

    @FindBy(id = "preLoader")
    private WebElement preLoader;

    public String getUrl() {
        return url;
    }

    public WebElement getBhUsernameInput() {
        return bhUsernameInput;
    }

    public WebElement getBhPasswordInput() {
        return bhPasswordInput;
    }

    public WebElement getBhLoginBtn() {
        return bhLoginBtn;
    }

    public WebElement getPreLoader() {
        return preLoader;
    }
}
