package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class ClientLanding {

    public ClientLanding(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "clients.brighthorizons";

    @FindBy(xpath = "//a[contains(@class,'nav-link')][contains(text(),'EdAssist Solutions')]")
    private WebElement edAssistSolution;
    
    @FindBy(xpath = "//a[contains(@class,'CM-solution-card-link-text')][contains(text(),'Use It')]")
    private WebElement edAssistSolutionUseItBtn;

    @FindBy(xpath = "//h3[@class='CM-solution-card-title'][contains(text(),'EdAssist Solution')]")
    private WebElement edAssistSolutionCard;

    @FindBy(xpath = "//h3[@class='CM-solution-card-title'][contains(text(),'Access College Coach')]")
    private WebElement accessCollegeCoachCard;

    @FindBy(xpath = "//h3[@class='CM-solution-card-title'][contains(text(),'Student Loan Repayment')]")
    private WebElement studentLoanRepaymentCard;

    @FindBy(xpath = "//h3[@class='CM-solution-card-title'][contains(text(),'Tuition Program Management')]")
    private WebElement tuitionProgramManagementCard;

    @FindBy(xpath = "//h3[contains(text(),'Tuition Program Management')]/following-sibling::div/a[contains(text(),'Use It')]")
    private WebElement tuitionProgramManagementUseItBtn;

    @FindBy(xpath = "//h3[contains(text(),'Manage Student Loan Repayments')]/following-sibling::div/a[contains(text(),'Use It')]")
    private WebElement studentLoanRepaymentUseItBtn;

    @FindBy(xpath = "//h3[contains(text(),'Access College Coach')]/following-sibling::div/a[contains(text(),'Use It')]")
    private WebElement collegeCoachUseItBtn;

    @FindBy(xpath = "//a[contains(@class,'nav-link')][contains(text(),'Family Solutions')]")
    private WebElement familySolutions;

    public String getUrl() {
        return url;
    }

    public WebElement getEdAssistSolution() {
        return edAssistSolution;
    }

    public WebElement getEdAssistSolutionUseItBtn() {
        return edAssistSolutionUseItBtn;
    }

    public WebElement getEdAssistSolutionCard() {
        return edAssistSolutionCard;
    }

    public WebElement getAccessCollegeCoachCard() {
        return accessCollegeCoachCard;
    }

    public WebElement getStudentLoanRepaymentCard() {
        return studentLoanRepaymentCard;
    }

    public WebElement getTuitionProgramManagementCard() {
        return tuitionProgramManagementCard;
    }

    public WebElement getTuitionProgramManagementUseItBtn() {
        return tuitionProgramManagementUseItBtn;
    }

    public WebElement getStudentLoanRepaymentUseItBtn() {
        return studentLoanRepaymentUseItBtn;
    }

    public WebElement getCollegeCoachUseItBtn() {
        return collegeCoachUseItBtn;
    }

    public WebElement getFamilySolutions() {
        return familySolutions;
    }
}
