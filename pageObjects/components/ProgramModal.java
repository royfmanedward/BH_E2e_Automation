package pageObjects.components;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class ProgramModal {

    public ProgramModal(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    @FindBy(id = "modalCloseButton")
    private WebElement programModalCloseButton;

    @FindBy(id = "programDescriptionOkButton")
    private WebElement programDescriptionOkButton;

    @FindBy(id = "modalCloseBtnHeader")
    private WebElement modalClose;

    @FindBy(id = "modal-title")
    private WebElement ModalTitleText;

    @FindBy(id = "btn-download-doc-Frequently Asked Questions")
    private WebElement frequentlyAskedQuestionsLink;

    @FindBy(id = "btn-download-doc-Tuition Assistance Policy")
    private WebElement tuitionAssistancePolicyText;

    @FindBy(id = "btn-download-doc-Sample Grade and Receipt Documentation")
    private WebElement simpleGradeAndReceiptDocText;

    @FindBy(id = "btn-download-doc-Manager Approval Guide")
    private WebElement managerApprovalGuideText;

    @FindBy(id = "programDescriptionModalText")
    private WebElement programModelTitleText;

    @FindBy(id = "closeSupportedDocumentsModal")
    private WebElement closeSupportedDocumentsButton;

    @FindBy(id = "modalCloseBtnFooter")
    private WebElement modalCancelButton;

    @FindBy(id = "modalSubmitBtn")
    private WebElement modalSaveButton;

    public WebElement getModalSaveButton() {
        return modalSaveButton;
    }

    public WebElement getModalCancelButton() {
        return modalCancelButton;
    }

    public WebElement getProgramModalCloseButton() {
        return programModalCloseButton;
    }

    public WebElement getProgramDescriptionOkButton () {
        return programDescriptionOkButton;
    }

    public WebElement getModalTitleText() {
        return ModalTitleText;
    }

    public WebElement getFrequentlyAskedQuestionsLink() {
        return frequentlyAskedQuestionsLink;
    }

    public WebElement getTuitionAssistancePolicyText() {
        return tuitionAssistancePolicyText;
    }

    public WebElement getSimpleGradeAndReceiptDocText() {
        return simpleGradeAndReceiptDocText;
    }

    public WebElement getManagerApprovalGuideText() {
        return managerApprovalGuideText;
    }

    public WebElement getProgramModelTitleText() {
        return programModelTitleText;
    }

    public WebElement getModalClose() {
        return modalClose;
    }

    public WebElement getCloseSupportedDocumentsButton () {
        return closeSupportedDocumentsButton;
    }
}
