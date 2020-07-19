package stepDefinitions;

import cucumber.api.java.en.When;

import java.text.ParseException;

public class StepDefinitionTemplates {

    private StepDefinitions stepDefinitionsMain;

    public StepDefinitionTemplates(StepDefinitions stepDefinitions) {
        this.stepDefinitionsMain = stepDefinitions;
    }

    @When("^I submit a new application: program = (.*), expense type = (.*), user = (.*), start date from today = (.*), end date from today = (.*), comment = (\\S+) and upload = (\\S+)")
    public void createNewApplication(String program,String expenseType, String userName, int startDateFromToday, int endDateFromToday, String addComment, String addUpload) {
        stepDefinitionsMain.verifyElementInComponentIsVisible("NewApplicationButton", "Header");
        stepDefinitionsMain.verifyElementIsVisible("scheduleFreeAdvisingLink");
        stepDefinitionsMain.clickElementInComponent("NewApplicationButton", "Header");

        stepDefinitionsMain.verifyPage("ContactInformation");
        stepDefinitionsMain.checkFromRadioGroup("Use Home Address", "addressRadioGroup");
        stepDefinitionsMain.checkFromRadioGroup("Use Home Phone", "phoneRadioGroup");
        stepDefinitionsMain.checkFromRadioGroup("Use Work Email", "emailRadioGroup");
        stepDefinitionsMain.isButtonEnabled("continueButton");
        stepDefinitionsMain.isButtonEnabled("cancelButton");
        stepDefinitionsMain.clickElement("continueButton");

        stepDefinitionsMain.verifyPage("EducationInformation");
        if (!program.contains("Certification")) {
            stepDefinitionsMain.isButtonEnabled("educationProgramDropdown");
            stepDefinitionsMain.selectFromDropdown("Associate's Degree", "educationProgramDropdown");
        }
        else {
            stepDefinitionsMain.isButtonEnabled("educationProgramDropdown");
            stepDefinitionsMain.selectFromDropdown("Certification/Designation", "educationProgramDropdown");
        }
        stepDefinitionsMain.isButtonEnabled("FieldOfStudyDropdown");
        stepDefinitionsMain.selectFromDropdown("Accounting", "FieldOfStudyDropdown");
        stepDefinitionsMain.checkFromRadio(program, "programsRadioGroup");
        if (program.equalsIgnoreCase("Virtual Card Certification program")) {
            stepDefinitionsMain.isButtonEnabled("examLabel");
            stepDefinitionsMain.scrollToElement("programsRadioGroup");
            stepDefinitionsMain.scrollToElement("examLabel");
            stepDefinitionsMain.javascriptExecutorClick("examLabel");
            stepDefinitionsMain.enterTextInField("test", "postNominalLetters");
            stepDefinitionsMain.enterCourseDate(startDateFromToday, "cerfificationStartDateInput");
            stepDefinitionsMain.enterCourseDate(endDateFromToday, "cerfificationEndDateInput");
        }
        stepDefinitionsMain.clickElement("educationProviderEditButton");
        stepDefinitionsMain.enterTextInField("Boston University","searchProviderNameInput");
        stepDefinitionsMain.clickElement("providerSearchButton");
        stepDefinitionsMain.verifyElementIsVisible("providerSearchResultsTable");
        stepDefinitionsMain.clickEdProvider("providerSearchResultsTable");
        stepDefinitionsMain.isButtonEnabled("cancelButton");
        stepDefinitionsMain.isButtonEnabled("continueButton");
        stepDefinitionsMain.clickElement("continueButton");

        stepDefinitionsMain.verifyPage("Courses");
        if (expenseType.equalsIgnoreCase("Exam") || expenseType.equalsIgnoreCase("Exam and Prep Courses")) {
            stepDefinitionsMain.enterTextInField("Math101", "examName");
            stepDefinitionsMain.enterTextInField("1", "examAmount");
            stepDefinitionsMain.clickElement("taxAcknowledgement");
            stepDefinitionsMain.enterCourseDate(startDateFromToday, "examDate");
            stepDefinitionsMain.clickElement("addExamButton");
            stepDefinitionsMain.isButtonEnabled("editExamButton");
        }
        else {
            stepDefinitionsMain.enterCourseDate(startDateFromToday, "sessionStartDateInput");
            stepDefinitionsMain.enterCourseDate(endDateFromToday, "sessionEndDateInput");
            stepDefinitionsMain.clickElement("addCourseAndExpensesButton");
            stepDefinitionsMain.enterTextInField("Intro to Math", "courseNameInput");
            stepDefinitionsMain.enterTextInField("math101", "courseNumberInput");
            stepDefinitionsMain.enterTextInField("1", "amountInput");
            stepDefinitionsMain.enterTextInField("1", "creditHoursInput");
            stepDefinitionsMain.selectFromDropdown("Classroom", "instructionTypeDropdown");
            if (!program.equalsIgnoreCase("Certification Program")){
                stepDefinitionsMain.clickElement("taxAcknowledgement");
            }
            stepDefinitionsMain.clickElement("addCourseButton");
            stepDefinitionsMain.waitForElementNotVisible("addCourseButton");
            if (program.equalsIgnoreCase("Certification Program")){
                stepDefinitionsMain.verifyElementIsNotVisible("addExpenseButton");
            }
        }
        stepDefinitionsMain.isButtonEnabled("cancelButton");
        stepDefinitionsMain.isButtonEnabled("continueButton");
        stepDefinitionsMain.clickElement("continueButton");

        stepDefinitionsMain.verifyPage("Agreement");
        stepDefinitionsMain.isButtonEnabled("eligibleGrantsNoRadioLabel");
        stepDefinitionsMain.clickElement("eligibleGrantsNoRadioLabel");
        stepDefinitionsMain.isButtonEnabled("agreement1Label");
        stepDefinitionsMain.clickElement("agreement1Label");
        stepDefinitionsMain.enterTextInField(userName, "signatureInput");
        stepDefinitionsMain.isButtonEnabled("cancelButton");
        stepDefinitionsMain.isButtonEnabled("continueButton");
        stepDefinitionsMain.clickElement("continueButton");

        stepDefinitionsMain.verifyPage("Application");
        stepDefinitionsMain.verifyText("phoneText", "6178675309");
        stepDefinitionsMain.verifyText("emailText", "tamssupport@edassist.com");
        stepDefinitionsMain.verifyText("employeeProgramText", program);
        stepDefinitionsMain.verifyText("specialityText", "Accounting");
        stepDefinitionsMain.verifyText("providerNameText", "Boston University");
        stepDefinitionsMain.verifyText("providerCodeText", "T22768");
        stepDefinitionsMain.verifyText("requestedText", "$1.00");
        stepDefinitionsMain.clickElement("viewMoreButton");
        stepDefinitionsMain.verifyText("tuitionAmt", "$1.00");
        stepDefinitionsMain.verifyText("discountAmt", "N/A");
        stepDefinitionsMain.verifyText("coursesRequestedAmt", "$1.00");
        stepDefinitionsMain.verifyText("coursesApprovalAmt", "$0.00");
        stepDefinitionsMain.verifyText("coursesPaidAmt", "$0.00");
        if (expenseType.equalsIgnoreCase("Exam") || expenseType.equalsIgnoreCase("Exam and Prep Courses")) {
            stepDefinitionsMain.verifyText("creditsText", "N/A");
            stepDefinitionsMain.verifyText("gradeText", "NA");
            stepDefinitionsMain.verifyText("verifiedText", "N/A");
        }
        stepDefinitionsMain.verifyText("totalBenefitText", "$1.00");
        stepDefinitionsMain.verifyText("grantsScholarshipsDiscountsText", "None $0.00");
        if (addComment.toLowerCase().equals("true")) {
            stepDefinitionsMain.enterTextInField("Testing comments section.", "summaryCommentInput");
        }
        if (addUpload.toLowerCase().equals("true")) {
            stepDefinitionsMain.uploadDocument("TestFile.pdf", "sharedFileUpload");
            stepDefinitionsMain.verifyElementIsVisible("documentTypeDropdown");
            stepDefinitionsMain.selectFromDropdown("Proof of Enrollment", "documentTypeDropdown");
            stepDefinitionsMain.verifyElementIsVisible("submitDocumentButton");
            stepDefinitionsMain.verifyElementIsVisible("commentText");
            stepDefinitionsMain.enterTextInField("Test:Uploaded correction documents.", "commentText");
            stepDefinitionsMain.clickElement("submitDocumentButton");
            stepDefinitionsMain.verifyElementIsVisible("supportingDocument1");
            stepDefinitionsMain.isButtonEnabled("submitApplicationButton");
            stepDefinitionsMain.clickElement("submitApplicationButton");
        } else {
            stepDefinitionsMain.verifyElementIsVisible("submitApplicationButton");
            stepDefinitionsMain.scrollToElement("submitApplicationButton");
            stepDefinitionsMain.isButtonEnabled("submitApplicationButton");
            stepDefinitionsMain.clickElement("submitApplicationButton");
        }
    }

    @When("^I cancel an application from the Application Page Actions menu")
    public void deleteAppFromAppPage() {
        stepDefinitionsMain.isButtonEnabled("submittedApplicationActionMenuButton");
        stepDefinitionsMain.scrollToElement("submittedApplicationActionMenuButton");
        stepDefinitionsMain.clickElement("submittedApplicationActionMenuButton");
        stepDefinitionsMain.javascriptExecutorClick("cancelApplicationButton");
        stepDefinitionsMain.enterTextInField("cancel application", "cancelApplicationConfirmationInput");
        stepDefinitionsMain.isButtonEnabled("cancelApplicationConfirmationYes");
        stepDefinitionsMain.clickElement("cancelApplicationConfirmationYes");
        stepDefinitionsMain.waitForElementNotVisible("cancelApplicationConfirmationYes");
    }

    @When("^I submit a new EdGoal: program = (.*), user = (.*), start date from today = (.*), end date from today = (.*), comment = (\\S+), add grant = (\\S+), add credit hours = (\\S+), and upload = (\\S+)")
    public void createNewEdGoal(String program, String userName, int startDateFromToday, int endDateFromToday, String addComment, String addGrant, String addCreditHours, String addUpload) throws ParseException {
        stepDefinitionsMain.isButtonEnabled("edGoalsTile");
        stepDefinitionsMain.clickElement("addAnotherGoalBtn");

        stepDefinitionsMain.verifyPage("EdGoalProgramInfo");
        stepDefinitionsMain.isButtonEnabled("educationProgramDropdown");
        stepDefinitionsMain.selectFromDropdown("Associate's Degree", "educationProgramDropdown");
        stepDefinitionsMain.isButtonEnabled("fieldOfStudyButton");
        stepDefinitionsMain.selectFromDropdown("Accounting", "FieldOfStudyDropdown");
        stepDefinitionsMain.isButtonEnabled("educationGoalRadio");
        stepDefinitionsMain.checkFromRadio(program, "programsRadioGroup");
        stepDefinitionsMain.enterCourseDate(startDateFromToday, "courseStartDate");
        stepDefinitionsMain.enterCourseDate(endDateFromToday, "courseEndDate");
        stepDefinitionsMain.clickElement("ProviderInformationAddEducationProviderButton");
        stepDefinitionsMain.enterTextInField("Boston University","providerName");
        stepDefinitionsMain.clickElement("providerSearchSubmitButton");
        stepDefinitionsMain.clickEdProvider("providerSearchTbl");
        stepDefinitionsMain.simulateKeypress("TAB", "courseEndDate");
        stepDefinitionsMain.isButtonEnabled("programInformationContinueButton");
        stepDefinitionsMain.clickElement("programInformationContinueButton");

        stepDefinitionsMain.verifyPage("EdGoalExpenseInfo");
        stepDefinitionsMain.verifyElementIsVisible("expenseAmount");
        stepDefinitionsMain.enterTextInField("100", "expenseAmount");
        if(addGrant.toLowerCase().equals("true")) {
            stepDefinitionsMain.verifyElementIsVisible("grantsEligibleRadioGroup1Label");
            stepDefinitionsMain.clickElement("grantsEligibleRadioGroup1Label");
            stepDefinitionsMain.clickElement("financialAidSourceIDButton");
            stepDefinitionsMain.clickElement("discountOption");
            stepDefinitionsMain.enterTextInField("30", "financialAidAmount");
        }
        else {
            stepDefinitionsMain.clickElement("grantsEligibleRadioGroup2Label");
        }
        if(addCreditHours.toLowerCase().equals("true")) {
            stepDefinitionsMain.enterTextInField("20", "creditHours");
        }
        stepDefinitionsMain.isButtonEnabled("expenseInformationContinueButton");
        stepDefinitionsMain.clickElement("expenseInformationContinueButton");

        stepDefinitionsMain.verifyPage("Agreement");
        stepDefinitionsMain.isButtonEnabled("agreement1Label");
        stepDefinitionsMain.clickElement("agreement1Label");
        stepDefinitionsMain.enterTextInField(userName, "signatureInput");
        stepDefinitionsMain.isButtonEnabled("agreementContinueButton");
        stepDefinitionsMain.clickElement("agreementContinueButton");

        stepDefinitionsMain.verifyPage("EdGoalReview");
        stepDefinitionsMain.verifyCurrentDateInField("signedAgreementDate", "MMM dd yyyy");
        stepDefinitionsMain.verifyElementIsVisible("estimatedAmount");
        stepDefinitionsMain.verifyTextInField("estimatedAmount", "100.00");
        stepDefinitionsMain.verifyTextInField("estimatedCreditHours", "20");
        if (addGrant.toLowerCase().equals("true")) {
            stepDefinitionsMain.verifyTextInField("financialAidAmount", "30.00");
        }
        else {
            stepDefinitionsMain.verifyTextInField("financialAidAmount", "0");
        }
        if (addComment.toLowerCase().equals("true")) {
            stepDefinitionsMain.enterTextInField("Test EdGoal", "summaryComment");
        }
        if (addUpload.toLowerCase().equals("true")) {
            stepDefinitionsMain.uploadDocument("TestFile.pdf", "sharedFileUpload");
            stepDefinitionsMain.verifyElementIsVisible("documentTypeDropdown");
            stepDefinitionsMain.selectFromDropdown("Proof of Enrollment", "documentTypeDropdown");
            stepDefinitionsMain.enterTextInField("Test:Uploaded correction documents.", "supportingDocumentComment");
            stepDefinitionsMain.clickElement("supportingDocumentationSubmitDocumentButton");
            stepDefinitionsMain.verifyElementIsVisible("supportingDocumentationDocument");
        }
        stepDefinitionsMain.isButtonEnabled("summaryContinueButton");
        stepDefinitionsMain.clickElement("summaryContinueButton");
    }

    @When("^I cancel an EdGoal from the EdGoal Page cancel button")
    public void deleteEdGoalFromEdGoalPage() {
        stepDefinitionsMain.clickElement("appSummaryCancelEdGoalBtn");
        stepDefinitionsMain.verifyElementIsVisible("comment");
        stepDefinitionsMain.enterTextInField("cancel application", "comment");
        stepDefinitionsMain.clickElement("submitButton");
        stepDefinitionsMain.verifyPage("EdGoalApprove");
    }

    @When("^I create a new loan and progress to the payments page: loanServicer = (.*), graduation date = (.*)")
    public void createNewLoanToPaymentsPage(String loanServicer, String gradDate) {
        stepDefinitionsMain.isButtonEnabled("newStudentLoanNow");
        stepDefinitionsMain.clickAndGoToPage("newStudentLoanNow", "AddLoanServicer");
        stepDefinitionsMain.clickElement("loanServicerBtn");
        stepDefinitionsMain.enterTextInField(loanServicer, "loanServicerSearchInput");
        stepDefinitionsMain.clickElement("selectOption");
        stepDefinitionsMain.isButtonEnabled("enterInfoManually");
        stepDefinitionsMain.clickElement("enterInfoManually");

        stepDefinitionsMain.verifyPage("addLoanDetails");
        stepDefinitionsMain.enterTextInField("5000", "loanBalance");
        stepDefinitionsMain.enterTextInField("100", "monthlyPayment");
        stepDefinitionsMain.enterRandomNumberInField("accountNumber");
        stepDefinitionsMain.enterTextInField("5", "interestRate");
        stepDefinitionsMain.enterTextInField(gradDate, "minimumMonthlyDueDate");
        stepDefinitionsMain.selectFromDropdown("Associate's Degree", "edProgram");
        stepDefinitionsMain.selectFromDropdown("English", "edFieldOfStudy");
        stepDefinitionsMain.enterTextInField(gradDate, "edGradDate");
        stepDefinitionsMain.clickElement("addEdProviderButton");
        stepDefinitionsMain.enterTextInField("Seattle", "edProviderCity");
        stepDefinitionsMain.selectFromDropdown("WA", "edProviderStateBtn");
        stepDefinitionsMain.clickElement("edProviderSearchBtn");
        stepDefinitionsMain.verifyElementIsVisible("edProviderSearchTable");
        stepDefinitionsMain.clickEdProvider("edProviderSearchTable");
        stepDefinitionsMain.javascriptExecutorClick("edProviderContinueBtn");
    }

    @When("^I progress from payments to submission page: user = (.*), upload = (.*)")
    public void createNewLoanPaymentsToSubmissionPage(String user, String addUpload) {
        stepDefinitionsMain.verifyPage("AddLoanPayments");
        stepDefinitionsMain.verifyElementIsVisible("loanType1Option");
        stepDefinitionsMain.clickElement("loanType1Option");
        if (addUpload.toLowerCase().equals("true")) {
            stepDefinitionsMain.uploadDocument("TestFile.pdf", "sharedFileUpload");
            stepDefinitionsMain.verifyElementIsVisible("documentTypeDropdown");
            stepDefinitionsMain.selectFromDropdown("Proof of Loan/Proof of Loan Payment", "documentTypeDropdown");
            stepDefinitionsMain.enterTextInField("Test:Uploaded correction documents.", "commentText");
            stepDefinitionsMain.clickElement("submitDocumentButton");
            stepDefinitionsMain.verifyText("firstSupportingDocument", "Proof of Loan/Proof of Loan Payment");
        }
        stepDefinitionsMain.clickElement("step3ContinueBtn");

        stepDefinitionsMain.verifyPage("AddLoanAgreements");
        stepDefinitionsMain.clickElement("participantAgreementCheckbox");
        stepDefinitionsMain.enterTextInField(user, "signatureBox");
        stepDefinitionsMain.clickElement("step4ContinueBtn");
    }

    @When("^I log out")
    public void logOut() {
        stepDefinitionsMain.clickElementInComponent("IconProfile", "Header");
        stepDefinitionsMain.clickElementInComponent("LogoutNav", "Header");
        stepDefinitionsMain.verifyElementInComponentIsVisible("logOutButton", "Header");
        stepDefinitionsMain.clickElementInComponent("logOutButton", "Header");
    }
}
