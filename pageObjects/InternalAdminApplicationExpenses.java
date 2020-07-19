package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

public class InternalAdminApplicationExpenses extends InternalAdminApplication {

    public InternalAdminApplicationExpenses(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "aut-totals-table")
    private WebElement expenseTotals;

    @FindBy(xpath = "(//div[contains(@class,'expense-cards')]//div[contains(text(),'(USD)')])")
    private WebElement expenseCurrency;

    @FindBy(xpath = "(//div[contains(@class,'expense-cards')]//div[contains(@class,'darkBlue')])")
    private WebElement darkBlueCard;

    @FindBy(xpath = "(//div[contains(@class,'expense-cards')]//div[contains(@class,'gray')])")
    private WebElement grayCard;

    @FindBy(xpath = "//ea-application-totals//div[contains(@class, 'aut-requested-label')]")
    private WebElement totalsRequestedHeader;

    @FindBy(xpath = "//ea-application-totals//div[contains(@class, 'aut-approved-label')]")
    private WebElement totalsApprovedHeader;

    @FindBy(xpath = "//ea-application-totals//div[contains(@class, 'aut-percent-payout-label')]")
    private WebElement totalsPercentPayoutHeader;

    @FindBy(xpath = "//ea-application-totals//div[contains(@class, 'aut-paid-label')]")
    private WebElement totalsPaidHeader;

    @FindBy(xpath = "//ea-application-totals//div[contains(@class, 'aut-refund-label')]")
    private WebElement totalsRefundHeader;

    @FindBy(xpath = "//ea-application-totals//div[contains(@class, 'aut-repay-due-label')]")
    private WebElement totalsRepayDueHeader;

    @FindBy(xpath = "//ea-application-totals//div[contains(@class, 'aut-requested-0')]")
    private WebElement totalsRequestedAmount;

    @FindBy(xpath = "//ea-application-totals//div[contains(@class, 'aut-approved-0')]")
    private WebElement totalsApprovedAmount;

    @FindBy(xpath = "//ea-application-totals//div[contains(@class, 'aut-paid-0')]")
    private WebElement totalsPaidAmount;

    @FindBy(xpath = "//ea-application-totals//div[contains(@class, 'aut-refund-0')]")
    private WebElement totalsRefundAmount;

    @FindBy(xpath = "//ea-application-totals//div[contains(@class, 'aut-repay-owed-0')]")
    private WebElement totalsRepayDueAmount;

    @FindBy(xpath = "//ea-expense-table//div[contains(@class, 'aut-requested-label')]")
    private WebElement courseRequestedHeader;

    @FindBy(xpath = "//ea-expense-table//div[contains(@class, 'aut-approved-label')]")
    private WebElement courseApprovedHeader;

    @FindBy(xpath = "//ea-expense-table//div[contains(@class, 'aut-percent-payout-label')]")
    private WebElement coursePercentPayoutHeader;

    @FindBy(xpath = "//ea-expense-table//div[contains(@class, 'aut-paid-label')]")
    private WebElement coursePaidHeader;

    @FindBy(xpath = "//ea-expense-table//div[contains(@class, 'aut-refund-label')]")
    private WebElement courseRefundHeader;

    @FindBy(xpath = "//ea-expense-table//div[contains(@class, 'aut-repay-due-label')]")
    private WebElement courseRepayDueHeader;

    @FindBy(xpath = "//div[contains(@class, 'expense-cards-0')]/descendant::input[contains(@id,'name')]")
    private WebElement courseNameInput;

    @FindBy(xpath = "//div[contains(@class, 'expense-cards-0')]/descendant::input[contains(@id,'number')]")
    private WebElement courseNumberInput;

    @FindBy(xpath = "//div[contains(@class, 'expense-cards-0')]/descendant::input[contains(@id,'creditHours')]")
    private WebElement creditHoursInput;

    @FindBy(className = "aut-course-name")
    private List<WebElement> expenseCourseNameOutput;

    @FindBy(className = "aut-course-number")
    private List<WebElement> expenseCourseNumberOutput;

    @FindBy(className = "aut-credit-hours")
    private List<WebElement> expenseCreditHoursOutput;

    @FindBy(xpath = "(//button[contains(@id, 'expenseActionMenuEditBtnLink')])")
    private WebElement expenseActionMenuEditBtnLink;

    @FindBy(id = "expensesActionsBtn")
    private WebElement expensesActionsBtn;

    @FindBy(xpath = "//ea-expense-table[contains(@class, 'aut-course-table')]//tr//div[contains(@class, 'aut-requested')]")
    private List<WebElement> expenseTableRequestedAmount;

    @FindBy(xpath = "//ea-expense-table[contains(@class, 'aut-course-table')]//tr//div[contains(@class, 'aut-approved')]")
    private List<WebElement> expenseTableApprovedAmount;

    @FindBy(xpath = "//ea-expense-table[contains(@class, 'aut-course-table')]//tr//div[contains(@class, 'aut-paid')]")
    private List<WebElement> expenseTablePaidAmount;

    @FindBy(xpath = "//*[contains(@class, 'aut-course-table')]//div[contains(@class, 'expense-description')]")
    private List<WebElement> expenseTableExpenseDescription;

    public WebElement getExpenseTotals() {
        return expenseTotals;
    }

    public WebElement getExpenseCurrency() {
        return expenseCurrency;
    }

    public WebElement getDarkBlueCard() {
        return darkBlueCard;
    }

    public WebElement getGrayCard() {
        return grayCard;
    }

    public WebElement getCourseNameInput() {
        return courseNameInput;
    }

    public WebElement getCourseNumberInput() {
        return courseNumberInput;
    }

    public WebElement getCreditHoursInput() {
        return creditHoursInput;
    }

    public List<WebElement> getExpenseCreditHoursOutput() {
        return expenseCreditHoursOutput;
    }

    public List<WebElement> getExpenseCourseNameOutput() {
        return expenseCourseNameOutput;
    }

    public List<WebElement> getExpenseCourseNumberOutput() {
        return expenseCourseNumberOutput;
    }

    public WebElement getExpenseActionMenuEditBtnLink() {
        return expenseActionMenuEditBtnLink;
    }

    public WebElement getExpensesActionsBtn() {
        return expensesActionsBtn;
    }

    public WebElement getTotalsRequestedHeader() {
        return totalsRequestedHeader;
    }

    public WebElement getTotalsApprovedHeader() {
        return totalsApprovedHeader;
    }

    public WebElement getTotalsPaidHeader() {
        return totalsPaidHeader;
    }

    public WebElement getTotalsPercentPayoutHeader() {
        return totalsPercentPayoutHeader;
    }

    public WebElement getTotalsRefundHeader() {
        return totalsRefundHeader;
    }

    public WebElement getTotalsRepayDueHeader() {
        return totalsRepayDueHeader;
    }

    public WebElement getCourseRequestedHeader() {
        return courseRequestedHeader;
    }

    public WebElement getCourseApprovedHeader() {
        return courseApprovedHeader;
    }

    public WebElement getCoursePaidHeader() {
        return coursePaidHeader;
    }

    public WebElement getCoursePercentPayoutHeader() {
        return coursePercentPayoutHeader;
    }

    public WebElement getCourseRefundHeader() {
        return courseRefundHeader;
    }

    public WebElement getCourseRepayDueHeader() {
        return courseRepayDueHeader;
    }

    public WebElement getTotalsRequestedAmount() {
        return totalsRequestedAmount;
    }

    public WebElement getTotalsApprovedAmount() {
        return totalsApprovedAmount;
    }

    public WebElement getTotalsPaidAmount() {
        return totalsPaidAmount;
    }

    public WebElement getTotalsRefundAmount() {
        return totalsRefundAmount;
    }

    public WebElement getTotalsRepayDueAmount() {
        return totalsRepayDueAmount;
    }

    public List<WebElement> getExpenseTableRequestedAmount() {
        return expenseTableRequestedAmount;
    }

    public List<WebElement> getExpenseTableApprovedAmount() {
        return expenseTableApprovedAmount;
    }

    public List<WebElement> getExpenseTablePaidAmount() {
        return expenseTablePaidAmount;
    }

    public List<WebElement> getExpenseTableExpenseDescription() {
        return expenseTableExpenseDescription;
    }
}