package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class AddLoanServicer {

    public AddLoanServicer(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "loanServicer";

    @FindBy(id = "loanServicer-button")
    private WebElement loanServicerBtn;

    @FindBy(id = "loanServicer-filterInput")
    private WebElement loanServicerSearchInput;

    @FindBy(id = "loanServicer-option-0")
    private WebElement selectOption;

    @FindBy(id = "lrpAddLoanServicerStep1ContinueButton")
    private WebElement continueBtn;

    @FindBy(id = "lrpAddLoanServicerStep1ManualButton")
    private WebElement enterInfoManually;

    @FindBy(id = "lrpAddLoanServicerStep1CancelButton")
    private WebElement cancelBtn;

    @FindBy(xpath = "//button[contains(@id,\"DontSeeServicerButton\")]/following-sibling::div")
    private WebElement alertForNotLinkedServicer;

    @FindBy(id = "modalSubmitBtn")
    private WebElement cancelLoanBtn;

    @FindBy(id = "modalCloseBtnFooter")
    private WebElement continueOnCancelModalBtn;

    @FindBy(id = "lrpAddLoanServicerStep1YodleeButton")
    private WebElement linkYourOnlineAccountBtn;

    @FindBy(id = "lrpAddLoanServicerDontSeeServicerButton")
    private WebElement iDontSeeMyLoanServicer;

    @FindBy(id = "lrpNoServicerModalCloseButton")
    private WebElement modalCloseBtn;

    @FindBy(id = "modalCloseBtnFooter")
    private WebElement modalGoToSupportBtn;

    @FindBy(id = "modalCloseBtnFooter")
    private WebElement closeYodleeWindowBtn;

    @FindBy(id = "addLoanServicerNoAccountsWarningMsg")
    private WebElement errorMsgText;

    @FindBy(id = "LOGIN_23")
    private WebElement servicerLoginInput;

    @FindBy(id = "PASSWORD_23")
    private WebElement servicerPasswordInput;

    @FindBy(id = "next")
    private WebElement servicerLoginButton;

    @FindBy(className = "error-description")
    private WebElement servicerLoginErrorText;

    @FindBy(className = "yodlee-link-window")
    private WebElement servicerWindow;

    public String getUrl() {
        return url;
    }

    public WebElement getLoanServicerBtn() {
        return loanServicerBtn;
    }

    public WebElement getLoanServicerSearchInput() {
        return loanServicerSearchInput;
    }

    public WebElement getSelectOption() {
        return selectOption;
    }

    public WebElement getContinueBtn() {
        return continueBtn;
    }

    public WebElement getEnterInfoManually() {
        return enterInfoManually;
    }

    public WebElement getCancelBtn() {
        return cancelBtn;
    }

    public WebElement getCancelLoanBtn() {
        return cancelLoanBtn;
    }

    public WebElement getContinueOnCancelModalBtn() {
        return continueOnCancelModalBtn;
    }

    public WebElement getLinkYourOnlineAccountBtn() {
        return linkYourOnlineAccountBtn;
    }

    public WebElement getIDontSeeMyLoanServicer() {
        return iDontSeeMyLoanServicer;
    }

    public WebElement getModalCloseBtn() {
        return modalCloseBtn;
    }

    public WebElement getModalGoToSupportBtn() {
        return modalGoToSupportBtn;
    }

    public WebElement getCloseYodleeWindowBtn() {
        return closeYodleeWindowBtn;
    }

    public WebElement getErrorMsgText() {
        return errorMsgText;
    }

    public WebElement getServicerLoginInput() {
        return servicerLoginInput;
    }

    public WebElement getServicerPasswordInput() {
        return servicerPasswordInput;
    }

    public WebElement getServicerLoginButton() {
        return servicerLoginButton;
    }

    public WebElement getServicerLoginErrorText() {
        return servicerLoginErrorText;
    }

    public WebElement getServicerWindow() {
        return servicerWindow;
    }

    public WebElement getAlertForNotLinkedServicer() {
        return alertForNotLinkedServicer;
    }
}
