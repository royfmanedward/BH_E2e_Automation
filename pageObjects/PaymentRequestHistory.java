package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class PaymentRequestHistory {

    public PaymentRequestHistory(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "paymentRequestHistory";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "startPayingLoanMenuBtn")
    private WebElement startPayingLoanMenuBtn;

    @FindBy(id = "navigateLoanActionBtn")
    private WebElement navigateLoanActionBtn;

    @FindBy(id = "comments")
    private WebElement commentsTextArea;

    @FindBy(id = "modalSubmitBtn")
    private WebElement modalSubmitBtn;

    @FindBy(className = "modal-dialog")
    private WebElement modalDialog;

    @FindBy(id = "activeLoansActionButton")
    private WebElement activeLoanActionButton;

    @FindBy(className = "other-student-loan-action-menu")
    private WebElement inActiveLoanActionMenu;

    public WebElement getInActiveLoanActionMenu() {
        return inActiveLoanActionMenu;
    }

    public WebElement getStartPayingLoanMenuBtn() {
        return startPayingLoanMenuBtn;
    }

    public  WebElement getCommentsTextArea() {
        return commentsTextArea;
    }

    public WebElement getModalSubmitBtn() {
        return modalSubmitBtn;
    }

    public WebElement getActiveLoanActionButton(){
        return activeLoanActionButton;
    }

    public WebElement getNavigateLoanActionBtn() {
        return navigateLoanActionBtn;
    }

    public WebElement getModalDialog() {
        return modalDialog;
    }
}
