package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class EdGoalExpenseInfo {

    public EdGoalExpenseInfo(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }
    private String url = "expenseInformation";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "expenseAmount")
    private WebElement expenseAmount;

    @FindBy(id = "financialAidAmount")
    private WebElement financialAidAmount;

    @FindBy(id = "grantsEligibleRadioGroup2Label")
    private WebElement grantsEligibleRadioGroup2Label;

    @FindBy(id = "grantsEligibleRadioGroup1Label")
    private WebElement grantsEligibleRadioGroup1Label;

    @FindBy(id = "creditHours")
    private WebElement creditHours;

    @FindBy(id = "expenseInformationContinueButton")
    private WebElement expenseInformationContinueButton;

    @FindBy(xpath = "//button[@id='financialAidSourceId-button']")
    private WebElement financialAidSourceIDButton;

    @FindBy(id = "financialAidSourceId-option-0")
    private WebElement discountOption;

    public WebElement getExpenseAmount() {
        return expenseAmount;
    }

    public WebElement getGrantsEligibleRadioGroup2Label() {
        return grantsEligibleRadioGroup2Label;
    }

    public WebElement getGrantsEligibleRadioGroup1Label() {
        return grantsEligibleRadioGroup1Label;
    }

    public WebElement getCreditHours() {
        return creditHours;
    }

    public WebElement getFinancialAidAmount() {
        return financialAidAmount;
    }

    public WebElement getExpenseInformationContinueButton() {
        return expenseInformationContinueButton;
    }

    public WebElement getFinancialAidSourceIDButton() {
        return financialAidSourceIDButton;
    }

    public WebElement getDiscountOption() {
        return discountOption;
    }
}