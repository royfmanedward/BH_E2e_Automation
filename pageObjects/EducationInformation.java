package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import java.util.List;

public class EducationInformation { public EducationInformation(WebDriver driver) { PageFactory.initElements(driver, this); }

    private String url = "educationInformation";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "programRadioGroup")
    private WebElement programsRadioGroup;

    @FindBy(id = "programRadioGroup1")
    private WebElement graduateDegreeRadio;

    @FindBy(id = "programRadioGroup2")
    private WebElement prepayTuitionRadio;

    @FindBy(id = "programRadioGroup3")
    private WebElement edAccessReimbursementRadio;

    @FindBy(id = "programRadioGroup4")
    private WebElement edAccessDirectBillRadio;

    @FindBy(id = "programRadioGroup")
    private List<WebElement> programsRadioGroupList;

    @FindBy(id = "certificationStartDate")
    private WebElement cerfificationStartDateInput;

    @FindBy(id = "certificationEndDate")
    private WebElement cerfificationEndDateInput;

    @FindBy(id = "tuitionReimbursementProgramButton")
    private WebElement tuitionReimbursementProgramButton;

    @FindBy(id = "certificationType1Label")
    private WebElement examLabel;

    @FindBy(id = "certificationType2Label")
    private WebElement examAndPrepCoursesLabel;

    @FindBy(id = "certificationType3Label")
    private WebElement coursesLabel;

    @FindBy(id = "programDescriptionModalText")
    private WebElement ProgramModalText;

    @FindBy(className = "fade")
    private WebElement ProgramModalXclose;

    @FindBy(className = "btn-link")
    private List<WebElement> ProgramModalDownloadLinks;

    @FindBy(id = "btn-download-doc-Tuition Assistance Policy")
    private WebElement ProgramModalTuitionAssistancePolicyLink;

    @FindBy(id = "btn-download-doc-Sample Grade and Receipt Documentation")
    private WebElement ProgramModalSampleGradeReceiptDocumentationLink;

    @FindBy(id = "btn-download-doc-Manager Approval Guide")
    private WebElement ProgramModalManagerApprovalGuideLink;

    @FindBy(id = "programDescriptionOkButton")
    private WebElement ProgramModalOkButton;

    @FindBy(id = "studentIdModalInfoButton")
    private WebElement postNominalLettersModalBtn;

    @FindBy(id = "degreeObjective-dropdown")
    private WebElement educationProgramDropdown;

    @FindBy(id = "degreeObjective-button")
    private WebElement degreeObjectiveButton;

    @FindBy(id = "fieldOfStudy-dropdown")
    private WebElement fieldOfStudyDropdown;

    @FindBy(id = "fieldOfStudy-button")
    private WebElement fieldOfStudyButton;

    @FindBy(id = "otherCourseOfStudy")
    private WebElement otherCourseOfStudyInput;

    @FindBy(id = "whoIsYourEducationProviderEditButton")
    private WebElement educationProviderEditButton;

    @FindBy(id = "providerName")
    private WebElement searchProviderNameInput;

    @FindBy(id = "studentId")
    private WebElement studentIDInput;

    @FindBy(id = "studentIdModalInfoButton")
    private WebElement studentIDButton;

    @FindBy(id = "modal-title")
    private WebElement modalTitleText;

    @FindBy(id = "modalCloseButton")
    private WebElement studentIDModalCloseButton;

    @FindBy(id = "providerCity")
    private WebElement providerCityInput;

    @FindBy(id = "providerState-dropdown")
    private WebElement providerStateDropdown;

    @FindBy(id = "providerAccred-dropdown")
    private WebElement providerAccreditationDropdown;

    @FindBy(id = "providerAccred-button")
    private WebElement providerAccreditationButton;

    @FindBy(id = "providerSearchNetworkDiscount")
    private WebElement providerNetworkSchoolCheckbox;

    @FindBy(id = "providerSearchNetworkDiscountLabel")
    private WebElement providerNetworkSchoolLabel;

    @FindBy(id = "providerName")
    private WebElement providerName;

    @FindBy(id = "providerAddress")
    private WebElement providerAddress;

    @FindBy(id = "providerCode")
    private WebElement providerCode;

    @FindBy(id = "providerSearchSubmitButton")
    private WebElement providerSearchButton;

    @FindBy(id = "providerSearchCancelButton")
    private WebElement providerSearchCancelButton;

    @FindBy(id = "providerSearchTbl")
    private WebElement providerSearchResultsTable;

    @FindBy(id = "contactInformationContinueButton")
    private WebElement continueButton;

    @FindBy(id = "contactInformationCancelButton")
    private WebElement cancelButton;

    @FindBy(id = "providerinstructionreviewLabel")
    private WebElement providerReviewCheckbox;

    @FindBy(id = "whoIsYourExamProviderHeaderText")
    private WebElement examProviderText;

    @FindBy(id = "selectEdGoal1")
    private WebElement edGoalRadioButton1;

    @FindBy(id = "selectEdGoal2Label")
    private WebElement edGoalRadioButton2;

    @FindBy(id = "selectEdGoal3Label")
    private WebElement edGoalRadioButton3;

    @FindBy(id = "providerAccred-dropdown")
    private List<WebElement> providerAccreditationDropdowns;

    @FindBy(xpath = "//*[contains(@id,'degreeObjective-button')]/li")
    private List<WebElement> educationProgramDropdowns;

    @FindBy(id = "fieldOfStudy-dropdown")
    private List<WebElement> fieldOfStudydropdowns;

    @FindBy(id = "selectEdGoal1Label")
    private WebElement firstEdGoal;

    @FindBy(id = "Msg")
    private WebElement stepTwoErrorMessage;

    @FindBy(id = "programRadioGroupValidationText")
    private WebElement programsError;

    @FindBy(id = "providerInstructionText")
    private WebElement providerInstructionText;

    @FindBy(id = "providerSpecialInstructionText")
    private WebElement providerSpecialInstructionText;

    @FindBy(id = "postNominalLetters")
    private WebElement postNominalLetters;

    @FindBy(className = "pad-bottom-3")
    private WebElement edGoalProgramMessage;

    @FindBy(className = "certification-expenses-wrapper")
    private WebElement subTypeWrapper;

    @FindBy(id = "whoIsYourEducationProviderHeaderText")
    private WebElement edProviderHeader;

    @FindBy(xpath = "//label[contains(text(),'Colorado State University Global Campus')]")
    private WebElement coloradoStateUniGlobalCampus;

    @FindBy(xpath = "//label[contains(text(),'University of Maryland University College')]")
    private WebElement universityOfMarylandProvider;

    @FindBy(xpath = "//label[contains(text(),'Walden University')]")
    private WebElement waldenUniversityProvider;

    @FindBy(xpath = "//label[contains(text(),'Western Governors University')]")
    private WebElement westernGovernorsProvider;

    @FindBy(id = "deleteApplicationButton")
    private WebElement deleteApplicationButton;

    @FindBy(id = "modalChangeProgButton")
    private WebElement modalChangeProgButton;

    @FindBy(className = "modal-backdrop")
    private WebElement backdrop;

    @FindBy(id = "noProviderErrorMsg")
    private WebElement noProviderErrorMsg;

    @FindBy(xpath = "//button[contains(text(), \"Add Dependent or Spouse\")]")
    private WebElement addDepOrSpouseText;

    @FindBy(xpath = "//div[contains (@class, \"add-dependent-button-wrapper\")]//descendant::button")
    private WebElement addDepButton;

    @FindBy(id = "relationshipType-dropdown")
    private WebElement relationshipDropdown;

    @FindBy(id = "firstName")
    private WebElement dependentFirstName;

    @FindBy(id = "lastName")
    private WebElement dependentLastName;

    @FindBy(id = "dateOfBirth")
    private WebElement dependentDateOfBirth;

    @FindBy(id = "dependentAcknowledgementLabel")
    private WebElement dependentAcknowledgementLabel;

    @FindBy(className = "qe-select-dropdown-text")
    private WebElement applicationForField;

    @FindBy(xpath = "//p[contains(text(), 'Dependent Agreement')]")
    private WebElement dependentAgreement;

    @FindBy(xpath = "//p[contains(text(), 'Spouse Agreement')]")
    private WebElement spouseAgreement;

    @FindBy(id = "appAlertBanner")
    private WebElement dependentSuccessMessage;

    @FindBy(id = "dependent-dropdown")
    private WebElement selectDependentDropdown;

    @FindBy(id = "dependent-button")
    private WebElement currentDependentDropdownValue;

    @FindBy(id = "providerInformationAddEducationProviderButton")
    private WebElement providerInformationAddEducationProviderButton;

    @FindBy(id = "programRadioGroup7")
    private WebElement spouseProgramRadio;

    @FindBy(id = "programRadioGroup7Label")
    private WebElement spouseProgramRadioLabel;

    @FindBy(id = "programRadioGroup6")
    private WebElement dependentProgramRadio;

    @FindBy(id = "programRadioGroup6Label")
    private WebElement dependentProgramRadioLabel;

    @FindBy(id = "programRadioGroup5Label")
    private WebElement directBillProgramRadioLabel;

    @FindBy(id = "programRadioGroup4Label")
    private WebElement certiProgramRadioLabel;

    @FindBy(id = "programRadioGroup3Label")
    private WebElement vcCertiProgramRadioLabel;

    @FindBy(id = "programRadioGroup2Label")
    private WebElement tuitionProgramRadioLabel;

    @FindBy(id = "programRadioGroup1Label")
    private WebElement vcProgramRadioLabel;

    @FindBy(id = "modalCloseBtnFooter")
    private WebElement modalCloseBtnFooter;

    @FindBy(id = "modal-content-inner")
    private WebElement rulesMessageModal;

    @FindBy(xpath = "//label[contains(@id, 'edAccessProvidersRadioGroup')]")
    private List<WebElement> providerRadios;

    @FindBy(id = "certificationStartDate")
    private WebElement certificationStartDateInput;

    @FindBy(id = "certificationEndDate")
    private WebElement certificationEndDateInput;

    @FindBy(id = "programSubType1Label")
    private WebElement programSubType1;

    @FindBy(id = "relationshipType-button")
    private WebElement relationshipTypeDependent;

    @FindBy (id = "providerinstructionreview")
    private WebElement providerInstructionCheckBox;

    @FindBy (className = "loading")
    private WebElement loadingSpinner;

    public List<WebElement> getProviderRadios() {
        return providerRadios;
    }

    public WebElement getDependentProgramRadioLabel() {
        return dependentProgramRadioLabel;
    }

    public WebElement getSpouseProgramRadioLabel() {
        return spouseProgramRadioLabel;
    }

    public WebElement getDirectBillProgramRadioLabel() {
        return directBillProgramRadioLabel;
    }

    public WebElement getCertiProgramRadioLabel() {
        return certiProgramRadioLabel;
    }

    public WebElement getVcCertiProgramRadioLabel() {
        return vcCertiProgramRadioLabel;
    }

    public WebElement getTuitionProgramRadioLabel() {
        return tuitionProgramRadioLabel;
    }

    public WebElement getVcProgramRadioLabel() {
        return vcProgramRadioLabel;
    }

    public WebElement getDependentProgramRadio() {
        return dependentProgramRadio;
    }

    public WebElement getSpouseProgramRadio() {
        return spouseProgramRadio;
    }

    public WebElement getCurrentDependentDropdownValue() {
        return currentDependentDropdownValue;
    }

    public WebElement getSelectDependentDropdown() {
        return selectDependentDropdown;
    }

    public WebElement getDependentSuccessMessage() {
        return dependentSuccessMessage;
    }

    public WebElement getSpouseAgreement() {
        return spouseAgreement;
    }

    public WebElement getDependentAgreement() {
        return dependentAgreement;
    }

    public WebElement getApplicationForField() {
        return applicationForField;
    }

    public WebElement getDependentAcknowledgementLabel() {
        return dependentAcknowledgementLabel;
    }

    public WebElement getDependentDateOfBirth() {
        return dependentDateOfBirth;
    }

    public WebElement getDependentLastName() {
        return dependentLastName;
    }

    public WebElement getDependentFirstName() {
        return dependentFirstName;
    }

    public WebElement getRelationshipDropdown() {
        return relationshipDropdown;
    }

    public WebElement getAddDepOrSpouseText() {
        return addDepOrSpouseText;
    }

    public WebElement getAddDepButton() {
        return addDepButton;
    }

    public WebElement getBackdrop() {
        return backdrop;
    }

    public WebElement getNoProviderErrorMsg() {
        return noProviderErrorMsg;
    }

    public WebElement getDeleteApplicationButton() {
        return deleteApplicationButton;
    }

    public WebElement getUniversityOfMarylandProvider() {
        return universityOfMarylandProvider;
    }

    public WebElement getWesternGovernorsProvider() {
        return westernGovernorsProvider;
    }

    public WebElement getWaldenUniversityProvider() {
        return waldenUniversityProvider;
    }

    public WebElement getColoradoStateUniGlobalCampus() {
        return coloradoStateUniGlobalCampus;
    }

    public WebElement getEdProviderHeader() {
        return edProviderHeader;
    }

    public WebElement getFirstEdGoal() {
        return firstEdGoal;
    }

    public WebElement getProgramsRadioGroup() {
        return programsRadioGroup;
    }

    public WebElement getGraduateDegreeRadio() {
        return graduateDegreeRadio;
    }

    public WebElement getPrepayTuitionRadio() {
        return prepayTuitionRadio;
    }

    public WebElement getEdAccessReimbursementRadio() {
        return edAccessReimbursementRadio;
    }

    public WebElement getEdAccessDirectBillRadio() {
        return edAccessDirectBillRadio;
    }

    public List<WebElement> getProgramsRadioGroupList() {
        return programsRadioGroupList;
    }

    public WebElement getProviderReviewCheckbox() {
        return providerReviewCheckbox;
    }

    public WebElement getExamLabel() {
        return examLabel;
    }

    public WebElement getExamAndPrepCoursesLabel() {
        return examAndPrepCoursesLabel;
    }

    public WebElement getCoursesLabel () {
        return coursesLabel;
    }

    public WebElement getProgramModalText() {
        return ProgramModalText;
    }

    public WebElement getProgramModalXclose() {
        return ProgramModalXclose;
    }

    public List<WebElement> getProgramModalDownloadLinks() {
        return ProgramModalDownloadLinks;
    }

    public WebElement getProgramModalTuitionAssistancePolicyLink() {
        return ProgramModalTuitionAssistancePolicyLink;
    }

    public WebElement getProgramModalSampleGradeReceiptDocumentationLink() {
        return ProgramModalSampleGradeReceiptDocumentationLink;
    }

    public WebElement getProgramModalManagerApprovalGuideLink() {
        return ProgramModalManagerApprovalGuideLink;
    }

    public WebElement getProgramModalOkButton() {
        return ProgramModalOkButton;
    }

    public WebElement getPostNominalLettersModalBtn() {
        return postNominalLettersModalBtn;
    }

    public WebElement getEducationProgramDropdown() {
        return educationProgramDropdown;
    }

    public WebElement getFieldOfStudyDropdown() {
        return fieldOfStudyDropdown;
    }

    public WebElement getOtherCourseOfStudyInput() {
        return otherCourseOfStudyInput;
    }

    public WebElement getEducationProviderEditButton() {
        return educationProviderEditButton;
    }

    public WebElement getSearchProviderNameInput() {
        return searchProviderNameInput;
    }

    public WebElement getStudentIDInput() {
        return studentIDInput;
    }

    public WebElement getStudentIDButton() {
        return studentIDButton;
    }

    public WebElement getModalTitleText() {
        return modalTitleText;
    }

    public WebElement getStudentIDModalCloseButton() {
        return studentIDModalCloseButton;
    }

    public WebElement getProviderCityInput() {
        return providerCityInput;
    }

    public WebElement getProviderStateDropdown() {
        return providerStateDropdown;
    }

    public WebElement getProviderAccreditationDropdown() {
        return providerAccreditationDropdown;
    }

    public WebElement getProviderAccreditationButton() {
        return providerAccreditationButton;
    }

    public WebElement getProviderNetworkSchoolCheckbox() {
        return providerNetworkSchoolCheckbox;
    }

    public WebElement getProviderNetworkSchoolLabel() {
        return providerNetworkSchoolLabel;
    }

    public WebElement getProviderName() {
        return providerName;
    }

    public WebElement getProviderAddress() {
        return providerAddress;
    }

    public WebElement getProviderCode() {
        return providerCode;
    }

    public WebElement getProviderSearchButton() {
        return providerSearchButton;
    }

    public WebElement getProviderSearchCancelButton() {
        return providerSearchCancelButton;
    }

    public WebElement getProviderSearchResultsTable() {
        return providerSearchResultsTable;
    }

    public WebElement getExamProviderText() {
        return examProviderText;
    }

    public WebElement getContinueButton() {
        return continueButton;
    }

    public WebElement getCancelButton() {
        return cancelButton;
    }

    public WebElement getCerfificationStartDateInput() {
        return cerfificationStartDateInput;
    }

    public WebElement getCerfificationEndDateInput() {
        return cerfificationEndDateInput;
    }

    public WebElement getTuitionReimbursementProgramButton() {
        return tuitionReimbursementProgramButton;
    }

    public WebElement getEdGoalRadioButton1() {
        return edGoalRadioButton1;
    }

    public List<WebElement> getProviderAccreditationDropdowns() {
        return providerAccreditationDropdowns;
    }

    public List<WebElement> getEducationProgramDropdowns() {
        return educationProgramDropdowns;
    }

    public List<WebElement> getFieldOfStudydropdowns() {
        return fieldOfStudydropdowns;
    }

    public WebElement getStepTwoErrorMessage() {
        return stepTwoErrorMessage;
    }

    public WebElement getEdGoalRadioButton2() {
        return edGoalRadioButton2;
    }

    public WebElement getEdGoalRadioButton3() {
        return edGoalRadioButton3;
    }

    public WebElement getProgramsError() {
        return programsError;
    }

    public WebElement getDegreeObjectiveButton() {
        return degreeObjectiveButton;
    }

    public WebElement getFieldOfStudyButton() {
        return fieldOfStudyButton;
    }

    public WebElement getProviderInstructionText() {
        return providerInstructionText;
    }

    public WebElement getProviderSpecialInstructionText() {
        return providerSpecialInstructionText;
    }

    public WebElement getEdGoalProgramMessage() {
        return edGoalProgramMessage;
    }

    public WebElement getPostNominalLetters() {
        return postNominalLetters;
    }

    public WebElement getSubTypeWrapper() {
        return subTypeWrapper;
    }

    public WebElement getModalChangeProgButton() {
        return modalChangeProgButton;
    }

    public WebElement getProviderInformationAddEducationProviderButton() {
        return providerInformationAddEducationProviderButton;
    }

    public WebElement getProviderInstructionCheckBox() {
        return providerInstructionCheckBox;
    }

    public WebElement getModalCloseBtnFooter() {
        return modalCloseBtnFooter;
    }

    public WebElement getRulesMessageModal() {
        return rulesMessageModal;
    }

    public WebElement getCertificationStartDateInput() { return certificationStartDateInput; }

    public WebElement getCertificationEndDateInput() { return certificationEndDateInput; }

    public WebElement getProgramSubType1() { return programSubType1; }

    public WebElement getRelationshipTypeDependent() {
        return relationshipTypeDependent;
    }

    public WebElement getLoadingSpinner() {
        return loadingSpinner;
    }
}
