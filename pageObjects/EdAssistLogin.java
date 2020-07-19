package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class EdAssistLogin {

    public EdAssistLogin(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "login";

    @FindBy(id = "loginProductSelectButton-2")
    private WebElement studentLoanRepayment;

    public String getUrl() {
        return url;
    }

    public WebElement getStudentLoanRepayment() {
        return studentLoanRepayment;
    }
}
