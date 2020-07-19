package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class EdGoalReview {

    public EdGoalReview(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "review";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "summaryContinueButton")
    private WebElement summaryContinueButton;

    @FindBy(id = "summaryComment")
    private WebElement summaryComment;

    @FindBy(id = "supportingDocumentComment")
    private WebElement supportingDocumentComment;

    @FindBy(id = "supportingDocumentationSubmitDocumentButton")
    private WebElement supportingDocumentationSubmitDocumentButton;

    @FindBy(id = "supportingDocumentationDocument0")
    private WebElement supportingDocumentationDocument;

    @FindBy(id = "programsEducationProgram")
    private WebElement programsEducationProgram;

    @FindBy(id = "programSpecialty")
    private WebElement programSpecialty;

    @FindBy(id = "estimatedAmount")
    private WebElement estimatedAmount;

    @FindBy(id = "estimatedCreditHours")
    private WebElement estimatedCreditHours;

    @FindBy(id = "signedAgreementText")
    private WebElement signedAgreementText;

    @FindBy(id = "programsName")
    private WebElement programsName;

    @FindBy(id = "edgoalStartDateField")
    private WebElement edgoalStartDateField;

    @FindBy(id = "edgoalEndDateField")
    private WebElement edgoalEndDateField;

    @FindBy(id = "summaryCancelButton")
    private WebElement summaryCancelButton;

    @FindBy(id = "deleteApplicationButton")
    private WebElement deleteApplicationButton;

    @FindBy(id = "signedAgreementDate")
    private WebElement signedAgreementDate;

    @FindBy(id = "contactInformationEditButton")
    private WebElement contactInformationEditButton;

    @FindBy(id = "submitButton")
    private WebElement contactInformationSaveButton;

    @FindBy(id = "contactInformationCityState")
    private WebElement contactAddress;

    @FindBy(id = "contactInformationPhone")
    private WebElement contactPhone;

    @FindBy(id = "contactInformationEmail")
    private WebElement contactEmail;

    @FindBy(id = "financialAidAmount")
    private WebElement financialAidAmount;

    @FindBy(id = "documentType-dropdown")
    private WebElement documentTypeDropdown;

    public WebElement getFinancialAidAmount() {
        return financialAidAmount;
    }

    public WebElement getSignedAgreementDate() {
        return signedAgreementDate;
    }

    public WebElement getSummaryContinueButton() {
        return summaryContinueButton;
    }

    public WebElement getSummaryComment() {
        return summaryComment;
    }

    public WebElement getSupportingDocumentComment() {
        return supportingDocumentComment;
    }

    public WebElement getSupportingDocumentationSubmitDocumentButton() {
        return supportingDocumentationSubmitDocumentButton;
    }

    public WebElement getSupportingDocumentationDocument() {
        return supportingDocumentationDocument;
    }

    public WebElement getProgramsEducationProgram() {
        return programsEducationProgram;
    }

    public WebElement getProgramSpecialty() {
        return programSpecialty;
    }

    public WebElement getEstimatedAmount() {
        return estimatedAmount;
    }

    public WebElement getEstimatedCreditHours() {
        return estimatedCreditHours;
    }

    public WebElement getSignedAgreementText() {
        return signedAgreementText;
    }

    public WebElement getProgramsName() {
        return programsName;
    }

    public WebElement getEdgoalStartDateField() {
        return edgoalStartDateField;
    }

    public WebElement getEdgoalEndDateField() {
        return edgoalEndDateField;
    }

    public WebElement getSummaryCancelButton() {
        return summaryCancelButton;
    }

    public WebElement getDeleteApplicationButton() {
        return deleteApplicationButton;
    }

    public WebElement getContactInformationEditButton() {
        return contactInformationEditButton;
    }

    public WebElement getContactInformationSaveButton() {
        return contactInformationSaveButton;
    }

    public WebElement getContactAddress() {
        return contactAddress;
    }

    public WebElement getContactPhone() {
        return contactPhone;
    }

    public WebElement getContactEmail() {
        return contactEmail;
    }

    public WebElement getDocumentTypeDropdown() {
        return documentTypeDropdown;
    }
}