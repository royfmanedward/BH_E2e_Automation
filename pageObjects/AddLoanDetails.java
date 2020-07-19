package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class AddLoanDetails {

    public AddLoanDetails(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "loanDetails";

    @FindBy(id = "loanBalance")
    private WebElement loanBalance;

    @FindBy(id = "monthlyPmt")
    private WebElement monthlyPayment;

    @FindBy(id = "accountNum")
    private WebElement accountNumber;

    @FindBy(id = "interestRate")
    private WebElement interestRate;

    @FindBy(id = "providerInformationAddEducationProviderButton")
    private WebElement addEdProviderButton;

    @FindBy(id = "providerCity")
    private WebElement edProviderCity;

    @FindBy(id = "providerState-option-52")
    private WebElement edProviderState;

    @FindBy(id = "providerState-dropdown")
    private WebElement edProviderStateBtn;

    @FindBy(id = "providerSearchSubmitButton")
    private WebElement edProviderSearchBtn;

    @FindBy(id = "degreeObjective-dropdown")
    private WebElement edProgram;

    @FindBy(id = "fieldOfStudy-dropdown")
    private WebElement edFieldOfStudy;

    @FindBy(id = "graduationDate")
    private WebElement edGradDate;

    @FindBy(id = "providerSearchTbl")
    private WebElement edProviderSearchTable;

    @FindBy(id = "degreeObjective-button")
    private WebElement edDegreeObjectiveBtn;

    @FindBy(id = "fieldOfStudy-button")
    private WebElement edFieldOfStudyBtn;

    @FindBy(id = "lrpAddLoanStep2SubmitButton")
    private WebElement edProviderContinueBtn;

    @FindBy(id = "lrpAddLoanStep2CancelButton")
    private WebElement cancelLoanBtn;

    @FindBy(id = "minimumMonthlyDuteDate")
    private WebElement minimumMonthlyDueDate;

    @FindBy(id = "modalSubmitBtn")
    private WebElement cancelLoanModalBtn;

    @FindBy(className = "fa-percent")
    private WebElement percentSign;

    @FindBy(id = "paymentFrequency-button")
    private WebElement paymentFrequencyBtn;

    @FindBy(id = "loanBalanceValidationText")
    private WebElement loanBalanceValidationText;

    @FindBy(id = "monthlyPmtValidationText")
    private WebElement monthlyPmtValidationText;

    @FindBy(id = "accountNumValidationText")
    private WebElement accountNumValidationText;

    @FindBy(id = "interestRateValidationText")
    private WebElement interestRateValidationText;

    @FindBy(id = "minimumMonthlyDuteDateValidationText")
    private WebElement minimumMonthlyDuteDateValidationText;

    @FindBy(id = "degreeObjectiveValidationText")
    private WebElement degreeObjectiveValidationText;

    @FindBy(id = "fieldOfStudyValidationText")
    private WebElement fieldOfStudyValidationText;

    @FindBy(id = "graduationDateValidationText")
    private WebElement graduationDateValidationText;

    @FindBy(className = "alert-content")
    private WebElement errorMessage;

    public String getUrl() {
        return url;
    }

    public WebElement getErrorMessage() {
        return errorMessage;
    }

    public WebElement getMinimumMonthlyDueDate() {
        return minimumMonthlyDueDate;
    }

    public WebElement getLoanBalance() {
        return loanBalance;
    }

    public WebElement getMonthlyPayment() {
        return monthlyPayment;
    }

    public WebElement getAccountNumber() {
        return accountNumber;
    }

    public WebElement getInterestRate() {
        return interestRate;
    }

    public WebElement getAddEdProviderButton() {
        return addEdProviderButton;
    }

    public WebElement getEdProviderCity() {
        return edProviderCity;
    }

    public WebElement getEdProviderState() {
        return edProviderState; }

    public WebElement getEdProviderSearchBtn() { return edProviderSearchBtn;
    }

    public WebElement getEdProgram() {
        return edProgram;
    }

    public WebElement getEdFieldOfStudy() {
        return edFieldOfStudy;
    }

    public WebElement getEdGradDate() {
        return edGradDate;
    }

    public WebElement getEdProviderStateBtn() {
        return edProviderStateBtn;
    }

    public WebElement getEdProviderSearchTable() {
        return edProviderSearchTable;
    }

    public WebElement getEdDegreeObjectiveBtn() {
        return edDegreeObjectiveBtn;
    }

    public WebElement getEdFieldOfStudyBtn() {
        return edFieldOfStudyBtn;
    }

    public WebElement getEdProviderContinueBtn() {
        return edProviderContinueBtn;
    }

    public WebElement getCancelLoanBtn() {
        return cancelLoanBtn;
    }

    public WebElement getCancelLoanModalBtn() {
        return cancelLoanModalBtn;
    }

    public WebElement getPercentSign() {
        return percentSign;
    }

    public WebElement getPaymentFrequencyBtn() {
        return paymentFrequencyBtn;
    }

    public WebElement getLoanBalanceValidationText() {
        return loanBalanceValidationText;
    }

    public WebElement getMonthlyPmtValidationText() {
        return monthlyPmtValidationText;
    }

    public WebElement getAccountNumValidationText() {
        return accountNumValidationText;
    }

    public WebElement getInterestRateValidationText() {
        return interestRateValidationText;
    }

    public WebElement getMinimumMonthlyDuteDateValidationText() {
        return minimumMonthlyDuteDateValidationText;
    }

    public WebElement getDegreeObjectiveValidationText() {
        return degreeObjectiveValidationText;
    }

    public WebElement getFieldOfStudyValidationText() {
        return fieldOfStudyValidationText;
    }

    public WebElement getGraduationDateValidationText() {
        return graduationDateValidationText;
    }
}