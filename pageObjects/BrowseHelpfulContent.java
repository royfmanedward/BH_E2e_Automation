package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class BrowseHelpfulContent {

    public BrowseHelpfulContent(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "advising/learnMore";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "modalCloseBtnFooter")
    private WebElement modalCloseBtnFooter;

    @FindBy(id = "modal-title")
    private WebElement modalTitle;

    @FindBy(id = "thirdPartySiteWarning")
    private WebElement thirdPartySiteWarning;

    @FindBy(className = "learn-more-tab-1")
    private WebElement StudentLoan101;

    @FindBy(id = "modalSubmitBtn")
    private WebElement modalContinueButton;

    @FindBy(className = "learn-more-tab-4")
    private WebElement StudentLoanConsolidationAndRefinance;

    @FindBy(className = "learn-more-tab-5")
    private WebElement StudentLoanForgiveness;

    @FindBy(id = "learnmoreTopicsArticles0")
    private WebElement articleOneContainer;

    public WebElement getModalCloseBtnFooter() {
        return modalCloseBtnFooter;
    }

    public WebElement getModalTitle() {
        return modalTitle;
    }

    public WebElement getThirdPartySiteWarning() {
        return thirdPartySiteWarning;
    }

    public WebElement getStudentLoan101() {
        return StudentLoan101;
    }

    public WebElement getStudentLoanConsolidationAndRefinance() {
        return StudentLoanConsolidationAndRefinance;
    }

    public WebElement getStudentLoanForgiveness() {
        return StudentLoanForgiveness;
    }

    public WebElement getArticleOneContainer() {
        return articleOneContainer;
    }

    public WebElement getModalContinueButton() {
        return modalContinueButton;
    }
}