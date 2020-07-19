package pageObjects.components;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class FaxCoverSheet {
    public FaxCoverSheet(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    @FindBy(id = "applicationNumberFaxCoverSheet")
    private WebElement faxCoverSheetApplicationNumber;

    @FindBy(id = "applicationNumberHeadingFaxCoverSheet")
    private WebElement faxCoverSheetApplicationNumberHeading;

    @FindBy(id = "pagesInputFaxCoverSheet")
    private WebElement faxCoverSheetPagesInput;

    @FindBy(id = "CommentsTextArea")
    private WebElement faxCoverSheetCommentsTextArea;

    @FindBy(id = "printFaxCoverSheetButton")
    private WebElement faxCoverSheetPrintButton;

    @FindBy(id = "correctionsFaxCoverSheet")
    private WebElement faxCoverSheetCorrectionsCheckbox;

    @FindBy(id = "gradesFaxCoverSheet")
    private WebElement faxCoverSheetGradesCheckbox;

    @FindBy(id = "proofOfEnrollmentFaxCoverSheet")
    private WebElement faxCoverSheetProofOfEnrollmentCheckbox;

    @FindBy(id = "proofOfPaymentFaxCoverSheet")
    private WebElement faxCoverSheetProofOfPaymentCheckbox;

    @FindBy(id = "otherFaxCoverSheet")
    private WebElement faxCoverSheetOtherCheckbox;

    @FindBy(id = "OtherDocTypeTextArea")
    private WebElement faxCoverSheetOtherDocTypeTextArea;

    @FindBy(id = "modalCloseButton")
    private WebElement faxCoverSheetmodalCloseBtn;

    @FindBy(id = "closeFaxCoverSheetButton")
    private WebElement faxCoverSheetCloseBtn;

    @FindBy(id = "applicantNameFaxCoverSheet")
    private WebElement faxCoverSheetApplicantName;

    @FindBy(id = "employeeIdFaxCoverSheet")
    private WebElement faxCoverSheetEmployeeId;

    @FindBy(id = "faxNumberFaxCoverSheet")
    private WebElement faxCoverSheetFaxNumber;

    @FindBy(id = "dateFaxCoverSheet")
    private WebElement faxCoverSheetDate;

    @FindBy(id = "subjectNameFaxCoverSheet")
    private WebElement faxCoverSheetSubjectName;

    @FindBy(id = "closeSupportedDocumentsModal")
    private WebElement okButtonCloseSupportedDocumentsModal;

    @FindBy(className = "document-items-aut-test")
    private WebElement faxCoverSheetHeaderDocumentTypeId;

    public WebElement getFaxCoverSheetApplicationNumber() {
        return faxCoverSheetApplicationNumber;
    }

    public WebElement getFaxCoverSheetApplicationNumberHeading() {
        return faxCoverSheetApplicationNumberHeading;
    }

    public WebElement getFaxCoverSheetPagesInput() {
        return faxCoverSheetPagesInput;
    }

    public WebElement getFaxCoverSheetCommentsTextArea() {
        return faxCoverSheetCommentsTextArea;
    }

    public WebElement getFaxCoverSheetPrintButton() {
        return faxCoverSheetPrintButton;
    }

    public WebElement getFaxCoverSheetCorrectionsCheckbox() {
        return faxCoverSheetCorrectionsCheckbox;
    }

    public WebElement getFaxCoverSheetGradesCheckbox() {
        return faxCoverSheetGradesCheckbox;
    }

    public WebElement getFaxCoverSheetProofOfEnrollmentCheckbox() {
        return faxCoverSheetProofOfEnrollmentCheckbox;
    }

    public WebElement getFaxCoverSheetProofOfPaymentCheckbox() {
        return faxCoverSheetProofOfPaymentCheckbox;
    }

    public WebElement getFaxCoverSheetOtherCheckbox() {
        return faxCoverSheetOtherCheckbox;
    }

    public WebElement getFaxCoverSheetOtherDocTypeTextArea() {
        return faxCoverSheetOtherDocTypeTextArea;
    }

    public WebElement getFaxCoverSheetmodalCloseBtn() {
        return faxCoverSheetmodalCloseBtn;
    }

    public WebElement getFaxCoverSheetCloseBtn() {
        return faxCoverSheetCloseBtn;
    }

    public WebElement getFaxCoverSheetApplicantName() {
        return faxCoverSheetApplicantName;
    }

    public WebElement getFaxCoverSheetEmployeeId() {
        return faxCoverSheetEmployeeId;
    }

    public WebElement getFaxCoverSheetFaxNumber() {
        return faxCoverSheetFaxNumber;
    }

    public WebElement getFaxCoverSheetDate() {
        return faxCoverSheetDate;
    }

    public WebElement getFaxCoverSheetSubjectName() {
        return faxCoverSheetSubjectName;
    }

    public WebElement getFaxCoverSheetHeaderDocumentTypeId() {
        return faxCoverSheetHeaderDocumentTypeId;
    }

    public WebElement getOkButtonCloseSupportedDocumentsModal() {
        return okButtonCloseSupportedDocumentsModal;
    }
}