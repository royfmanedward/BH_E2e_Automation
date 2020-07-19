package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class Courses {

	public Courses(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}
	private String url = "courses";

	public String getUrl() {
		return url;
	}

	@FindBy(id = "taxAcknowledgementLabel")
	private WebElement taxAcknowledgement;

	@FindBy(id = "courseStartDate")
	private WebElement sessionStartDateInput;

	@FindBy(id = "courseEndDate")
	private WebElement sessionEndDateInput;

	@FindBy(id = "degreeComplete1Label")
	private WebElement degreeCompleteYesRadio;

	@FindBy(id = "degreeComplete2Label")
	private WebElement degreeCompleteNoRadio;

	@FindBy(id = "actualGradDate")
	private WebElement graduationDateInput;

	@FindBy(id = "expectedGradDate")
	private WebElement expectedGraduationDateInput;

	@FindBy(id = "courseName")
	private WebElement courseNameInput;

	@FindBy(id = "course0CourseNameText")
	private WebElement courseNameInputText;

	@FindBy(id = "courseNumber")
	private WebElement courseNumberInput;

	@FindBy(id = "requestedAmount")
	private WebElement amountInput;

	@FindBy(id = "courseCreditHours")
	private WebElement creditHoursInput;

	@FindBy(id = "courseExpenseGroup2Label")
	private WebElement courseExpensesNoLabel;

	@FindBy(id = "instructionTypeName-dropdown")
	private WebElement instructionTypeDropdown;

	@FindBy(id = "btnAddCourse")
	private WebElement addCourseButton;

	@FindBy(id = "editCourse0Button")
	private WebElement editFirstCourseButton;

	@FindBy(id = "editCourse0Button")
	private List<WebElement> editFirstCourseButtonList;

	@FindBy(id = "removeCourse0Button")
	private WebElement removeFirstCourseButton;

	@FindBy(id = "editCourse1Button")
	private WebElement editSecondCourseButton;

	@FindBy(id = "removeCourse1Button")
	private WebElement removeSecondCourseButton;

	@FindBy(id = "addCourseButton")
	private WebElement addCourseAndExpensesButton;

	@FindBy(id = "btnAddCourse")
	private WebElement saveEditsButton;

	@FindBy(id = "btnCloseCourse")
	private WebElement cancelEditsButton;

	@FindBy(id = "contactInformationContinueButton")
	private WebElement continueButton;

	@FindBy(id = "contactInformationCancelButton")
	private WebElement cancelButton;

	@FindBy(id = "saveForLaterButton")
	private WebElement saveApplicationForLaterButton;

	@FindBy(id = "deleteApplicationButton")
	private WebElement deleteApplicationButton;

	@FindBy(id = "course0CreditHoursText")
	private WebElement creditHoursInputText;

	@FindBy(id = "course1CreditHoursText")
	private WebElement secondCreditHoursInputText;

	@FindBy(id = "course2CreditHoursText")
	private WebElement thirdCreditHoursInputText;

	@FindBy(id = "course3CreditHoursText")
	private WebElement fourthCreditHoursInputText;

	@FindBy(id = "courseScheduleDays0Label")
	private WebElement courseScheduleDay0;

	@FindBy(id = "courseScheduleDays1Label")
	private WebElement courseScheduleDay1;

	@FindBy(id = "courseWebAddress")
	private WebElement courseWebAddress;

	@FindBy(id = "startTime0-button")
	private WebElement courseStartTime0;

	@FindBy(id = "startTime0-option-0")
	private WebElement courseStartTime0Option0;

	@FindBy(id = "startTime1-option-1")
	private WebElement courseStartTime1Option1;

	@FindBy(id = "endTime0-option-1")
	private WebElement courseEndTime0Option1;

	@FindBy(id = "endTime0-button")
	private WebElement courseEndTime0;

	@FindBy(id = "startTime1-button")
	private WebElement courseStartTime1;

	@FindBy(id = "endTime1-button")
	private WebElement courseEndTime1;

	@FindBy(id = "endTime1-option-2")
	private WebElement courseEndTime1Option2;

	@FindBy(id = "verifyCourseTimesLabel")
	private WebElement verifyCourseTimes;

	@FindBy(id = "courseEndDateValidationText")
	private WebElement courseEndDateValidation;

	@FindBy(id = "courseStartDateValidationText")
	private WebElement courseStartDateValidation;

	@FindBy(id = "addCourseRelatedExpenseButton")
	private WebElement addExpenseButton;

	@FindBy(id = "expenseTypeName-dropdown")
	private WebElement expenseTypeDropdown;

	@FindBy(id = "numberOfBooks")
	private WebElement bookQuantity;

	@FindBy(id = "expenseRequestedAmount")
	private WebElement expenseAmount;

	@FindBy(id = "saveEditCourseRelatedExpenseButton")
	private WebElement saveExpenseButton;

	@FindBy(id = "cancelAddCourseRelatedExpenseButton")
	private WebElement cancelExpenseButton;

	@FindBy(id = "course0RequestedAmountText")
	private WebElement firstCourseRequestedAmt;

	@FindBy(id = "course0ExpensesAmountText")
	private WebElement firstCourseExpenseAmt;

	@FindBy(className = "qe-expense-card-total-amount")
	private List<WebElement> totalRequestedAmt;

	@FindBy(id = "examName")
	private WebElement examName;

	@FindBy(id = "examAmount")
	private WebElement examAmount;

	@FindBy(id = "examDate")
	private WebElement examDate;

	@FindBy(id = "addAnExamButton")
	private WebElement addExamButton;

	@FindBy(id = "editExam0Button")
	private WebElement editExamButton;

	@FindBy(className = "qe-expense-card-total-amount")
	private WebElement examTotalAmount;

	@FindBy(id = "Msg")
	private WebElement errorText;

	@FindBy(className = "help-block")
	private WebElement helpBlock;

	@FindBy(id = "editOtherExpense0Button")
	private WebElement editFirstOtherExpenseButton;

	@FindBy(id = "courseTaxQ12Label")
	private WebElement courseRelatedTaxNoOption;

	@FindBy(id = "courseTaxQ11Label")
	private WebElement courseRelatedTaxYesOption;

	@FindBy(id = "nontaxableMessage")
	private WebElement nontaxableMessage;

	@FindBy(id = "taxableMessage")
	private WebElement taxableMessage;

	@FindBy(id = "expenseTypeName-dropdown")
	private WebElement otherExpenseType;

	@FindBy(className = "card-item")
	private WebElement expenseCardItem;

	@FindBy(className = "card-item")
	private List<WebElement> expenseCardItemList;

	@FindBy(id = "expenseTaxQ11Label")
	private WebElement expenseRelatedTaxYesOption;

    @FindBy(id = "expenseTaxQ22Label")
    private WebElement expenseTaxNoOptionQ2;

    @FindBy(id = "expenseTaxQ32Label")
    private WebElement expenseTaxNoOptionQ3;

	@FindBy(id = "expenseTaxQ12Label")
	private WebElement expenseRelatedTaxNoOption;

	@FindBy(id = "expenseTypeName-dropdown")
	private List<WebElement> otherExpenseTypeDropdowns;

	@FindBy(id = "courseNameValidationText")
	private WebElement courseNameValidationText;

	@FindBy(id = "courseNumberValidationText")
	private WebElement courseNumberValidationText;

	@FindBy(id = "requestedAmountValidationText")
	private WebElement requestedAmountValidationText;

	@FindBy(id = "instructionTypeNameValidationText")
	private WebElement instructionTypeNameValidationText;

	@FindBy(id = "taxAcknowledgementValidationText")
	private WebElement taxAcknowledgementValidationText;

	@FindBy(id = "applicationErrorMessage")
	private WebElement applicationErrorMessage;

	@FindBy(className = "modal-backdrop")
	private WebElement addCourseVeil;

	@FindBy(id = "removeOtherExpense0Button")
	private WebElement removeFirstOtherExpenseButton;

	@FindBy(id = "editOtherExpense1Button")
	private WebElement editSecondOtherExpenseButton;

	@FindBy(id = "editOtherExpense2Button")
	private WebElement editThirdOtherExpenseButton;

	@FindBy(id = "editOtherExpense3Button")
	private WebElement editFourthOtherExpenseButton;

	@FindBy(id = "removeOtherExpense1Button")
	private WebElement removeSecondOtherExpenseButton;

	@FindBy(id = "removeOtherExpense2Button")
	private WebElement removeThirdOtherExpenseButton;

	@FindBy(id = "removeOtherExpense3Button")
	private WebElement removeFourthOtherExpenseButton;

	@FindBy (id = "courseExpenseDescription0")
	private WebElement firstCourseExpenseDescription;

	@FindBy (id = "courseExpenseDescription1")
	private WebElement secondCourseExpenseDescription;

	@FindBy (id = "courseExpenseDescription2")
	private WebElement thirdCourseExpenseDescription;

	@FindBy (id = "courseExpenseDescription3")
	private WebElement fourthCourseExpenseDescription;

	@FindBy (id = "courseExpenseDescription4")
	private WebElement fifthCourseExpenseDescription;

	@FindBy (id = "sessionInformationHeaderText")
	private WebElement sessionInformationHeaderText;

	@FindBy(id = "course1CourseNameText")
	private WebElement secondCourseNameInputText;

	@FindBy(id = "course2CourseNameText")
	private WebElement thirdCourseNameInputText;

	@FindBy(id = "course3CourseNameText")
	private WebElement fourthCourseNameInputText;

	@FindBy(id = "editCourse2Button")
	private WebElement editThirdCourseButton;

	@FindBy(id = "removeCourse2Button")
	private WebElement removeThirdCourseButton;

	@FindBy(id = "editCourse3Button")
	private WebElement editFourthCourseButton;

	@FindBy(id = "removeCourse3Button")
	private WebElement removeFourthCourseButton;

	@FindBy(id = "expenseCard")
	private WebElement expenseCard;

	@FindBy(id = "expense0")
	private WebElement firstExpenseText;

	@FindBy(id = "expense1")
	private WebElement secondExpenseText;

	@FindBy(id = "expense2")
	private WebElement thirdExpenseText;

	@FindBy(id = "expense3")
	private WebElement fourthExpenseText;

	@FindBy(id = "course1RequestedAmountText")
	private WebElement secondCourseRequestedAmt;

	@FindBy(id = "course1ExpensesAmountText")
	private WebElement secondCourseExpenseAmt;

	@FindBy(id = "course2RequestedAmountText")
	private WebElement thirdCourseRequestedAmt;

	@FindBy(id = "course2ExpensesAmountText")
	private WebElement thirdCourseExpenseAmt;

	@FindBy(id = "course3RequestedAmountText")
	private WebElement fourthCourseRequestedAmt;

	@FindBy(id = "course3ExpensesAmountText")
	private WebElement fourthCourseExpenseAmt;

	@FindBy(className = "qe-expense-card-total-amount")
	private List<WebElement> expenseRequestedAmt;

	@FindBy (id = "courseExpenseInformationHeaderText")
	private WebElement courseExpenseInformationHeaderText;

	@FindBy (id = "course0RequestedAmountText")
	private WebElement course0RequestedAmountText;

	@FindBy (id = "course0ExpensesAmountText")
	private WebElement course0ExpensesAmountText;

	@FindBy(id = "combinedExpenses")
	private WebElement combinedExpenses;

	@FindBy(className = "input-group-addon")
	private List<WebElement> dollarSymbols;

	@FindBy(id = "graduationQuestionText")
	private WebElement graduationQuestionText;

	@FindBy(id = "expectedGradDateLabel")
	private WebElement expectedGradDateLabel;

	@FindBy(id = "actualGradDateLabel")
	private WebElement actualGradDateLabel;

	@FindBy(id = "expectedGradDateValidationText")
	private WebElement expectedGradDateValidationText;

	@FindBy(id = "actualGradDateValidationText")
	private WebElement actualGradDateValidationText;

	@FindBy(id = "degreeComplete1")
	private WebElement degreeCompleteYesButton;

	@FindBy(id = "degreeComplete2")
	private WebElement degreeCompleteNoButton;

	@FindBy(id = "edAccessExpenseTaxQ11Label")
	private WebElement subscriptionTaxQ1;

	@FindBy(id = "edAccessExpenseTaxQ21Label")
	private WebElement subscriptionTaxQ2;

	@FindBy(id = "edAccessExpenseTaxQ31Label")
	private WebElement subscriptionTaxQ3;

	@FindBy(id = "subscriptionAmount")
	private WebElement subscriptionAmount;

	@FindBy(id = "requestedAmount")
	private WebElement courseRequestedAmount;

	@FindBy(xpath = "//div[contains (@class, \"input-group amount-addon\")]")
	private WebElement courseAmountCurrencySymbol;

	@FindBy(id = "calendarClearBtn")
	private WebElement calendarClearBtn;

	@FindBy(id = "academicCalendarType-dropdown")
	private WebElement academicCalendarDropdown;

	@FindBy(id = "academicTermType-dropdown")
	private WebElement academicTermDropdown;

	@FindBy(id = "creditsValidationText")
	private WebElement creditsValidationText;

	@FindBy(id = "courseStartDateValidationText")
	private WebElement courseStartDateValidationText;

	@FindBy(id = "courseEndDateValidationText")
	private WebElement courseEndDateValidationText;

	@FindBy(id = "expenseRequestedAmount")
	private WebElement expenseRequestedAmount;

	@FindBy(id = "credits")
	private WebElement credits;

	@FindBy(xpath = "//p/span[contains(text(), 'Dependent Expense Amount Content')]")
	private WebElement dependentExpenseContent;

	@FindBy(id = "edAccessExpenseTaxQ12")
	private WebElement subscriptionTaxQ12;

	public WebElement getCourseAmountCurrencySymbol() {
		return courseAmountCurrencySymbol;
	}

	public WebElement getDependentExpenseContent() {
		return dependentExpenseContent;
	}

	public WebElement getCredits() {
		return credits;
	}

	public WebElement getAcademicCalendarDropdown() {
		return academicCalendarDropdown;
	}

	public WebElement getExpenseRequestedAmount() {
		return expenseRequestedAmount;
	}

	public WebElement getCourseEndDateValidationText() {
		return courseEndDateValidationText;
	}

	public WebElement getCourseStartDateValidationText() {
		return courseStartDateValidationText;
	}

	public WebElement getCreditsValidationText() {
		return creditsValidationText;
	}

	public WebElement getAcademicTermDropdown() {
		return academicTermDropdown;
	}

    public WebElement getExpenseTaxNoOptionQ2() {
        return expenseTaxNoOptionQ2;
    }

    public WebElement getExpenseTaxNoOptionQ3() {
        return expenseTaxNoOptionQ3;
    }

	public WebElement getCourseRequestedAmount() {
		return courseRequestedAmount;
	}

	public WebElement getSubscriptionAmount() {
		return subscriptionAmount;
	}

	public WebElement getSubscriptionTaxQ1() {
		return subscriptionTaxQ1;
	}

	public WebElement getSubscriptionTaxQ2() {
		return subscriptionTaxQ2;
	}

	public WebElement getSubscriptionTaxQ3() {
		return subscriptionTaxQ3;
	}

	public WebElement getHelpBlock() {
		return helpBlock;
	}

	public WebElement getAddCourseVeil() {
		return addCourseVeil;
	}

	public WebElement getExpenseRelatedTaxNoOption() {
		return expenseRelatedTaxNoOption;
	}

	public WebElement getExpenseRelatedTaxYesOption() {
		return expenseRelatedTaxYesOption;
	}

	public List<WebElement> getExpenseCardItemList() {
		return expenseCardItemList;
	}

	public WebElement getExpenseCardItem() {
		return expenseCardItem;
	}

	public WebElement getOtherExpenseType() {
		return otherExpenseType;
	}

	public WebElement getNontaxableMessage() {
		return nontaxableMessage;
	}

	public WebElement getTaxableMessage() {
		return taxableMessage;
	}

	public WebElement getCourseRelatedTaxYesOption() {
		return courseRelatedTaxYesOption;
	}

	public WebElement getCourseRelatedTaxNoOption() {
		return courseRelatedTaxNoOption;
	}

	public WebElement getEditFirstOtherExpenseButton() {
		return editFirstOtherExpenseButton;
	}

	public WebElement getCourseStartDateValidation() {
		return courseStartDateValidation;
	}

	public WebElement getCourseEndDateValidation() {
		return courseEndDateValidation;
	}

	public WebElement getVerifyCourseTimes() {
		return verifyCourseTimes;
	}

	public WebElement getCourseEndTime0() {
		return courseEndTime0;
	}

	public WebElement getCourseStartTime1() {
		return courseStartTime1;
	}

	public WebElement getCourseEndTime1() {
		return courseEndTime1;
	}

	public WebElement getCourseStartTime0() {
		return courseStartTime0;
	}

	public WebElement getCourseEndTime0Option1() {
		return courseEndTime0Option1;
	}

	public WebElement getCourseEndTime1Option2() {
		return courseEndTime1Option2;
	}

	public WebElement getCourseStartTime0Option0() {
		return courseStartTime0Option0;
	}

	public WebElement getCourseStartTime1Option1() {
		return courseStartTime1Option1;
	}

	public WebElement getCourseWebAddress() {
		return courseWebAddress;
	}

	public WebElement getCourseScheduleDay0() {
		return courseScheduleDay0;
		}

	public WebElement getCourseScheduleDay1() {
		return courseScheduleDay1;
	}

	public WebElement getCreditHoursInputText() {
		return creditHoursInputText;
	}

	public WebElement getSecondCreditHoursInputText() {
		return secondCreditHoursInputText;
	}

	public WebElement getThirdCreditHoursInputText() {
		return thirdCreditHoursInputText;
	}

	public WebElement getFourthCreditHoursInputText() {
		return fourthCreditHoursInputText;
	}

	public WebElement getCourseNameInputText() {
		return courseNameInputText;
	}

	public WebElement getTaxAcknowledgement() {
		return taxAcknowledgement;
	}

	public WebElement getSessionStartDateInput() {
		return sessionStartDateInput;
	}

	public WebElement getSessionEndDateInput() {
		return sessionEndDateInput;
	}

	public WebElement getDegreeCompleteYesRadio() {
		return degreeCompleteYesRadio;
	}

	public WebElement getDegreeCompleteNoRadio() {
		return degreeCompleteNoRadio;
	}

	public WebElement getGraduationDateInput() {
		return graduationDateInput;
	}

	public WebElement getExpectedGraduationDateInput() {
		return expectedGraduationDateInput;
	}

	public WebElement getCourseNameInput() {
		return courseNameInput;
	}

	public WebElement getCourseNumberInput() {
		return courseNumberInput;
	}

	public WebElement getAmountInput() {
		return amountInput;
	}

	public WebElement getCreditHoursInput() {
		return creditHoursInput;
	}

	public List<WebElement> getEditFirstCourseButtonList() {
		return editFirstCourseButtonList;
	}

	public WebElement getEditFirstCourseButton() {
		return editFirstCourseButton;
	}

	public WebElement getRemoveFirstCourseButton() {
		return removeFirstCourseButton;
	}

	public WebElement getEditSecondCourseButton() {
		return editSecondCourseButton;
	}

	public WebElement getRemoveSecondCourseButton() {
		return removeSecondCourseButton;
	}

	public WebElement getInstructionTypeDropdown() {
		return instructionTypeDropdown;
	}

	public WebElement getCourseExpensesNoLabel() {
		return courseExpensesNoLabel;
	}

	public WebElement getAddCourseButton() {
		return addCourseButton;
	}

	public WebElement getAddCourseAndExpensesButton() {
		return addCourseAndExpensesButton;
	}

	public WebElement getSaveEditsButton() {
		return saveEditsButton;
	}

	public WebElement getCancelEditsButton() {
		return cancelEditsButton;
	}

	public WebElement getContinueButton() {
		return continueButton;
	}

	public WebElement getCancelButton() {
		return cancelButton;
	}

	public WebElement getSaveApplicationForLaterButton() {
		return saveApplicationForLaterButton;
	}

	public WebElement getDeleteApplicationButton() {
		return deleteApplicationButton;
	}

	public WebElement getAddExpenseButton() {
		return addExpenseButton;
	}

	public WebElement getExpenseTypeDropdown() {
		return expenseTypeDropdown;
	}

	public WebElement getBookQuantity() {
		return bookQuantity;
	}

	public WebElement getExpenseAmount() {
		return expenseAmount;
	}

	public WebElement getSaveExpenseButton() {
		return saveExpenseButton;
	}

	public WebElement getFirstCourseRequestedAmt() {
		return firstCourseRequestedAmt;
	}

	public WebElement getFirstCourseExpenseAmt() {
		return firstCourseExpenseAmt;
	}

	public List<WebElement> getTotalRequestedAmt() {
		return totalRequestedAmt;
	}

	public WebElement getCancelExpenseButton() {
		return cancelExpenseButton;
	}

	public WebElement getExamName() {
		return examName;
	}

	public WebElement getExamAmount() {
		return examAmount;
	}

	public WebElement getExamDate() {
		return examDate;
	}

	public WebElement getAddExamButton() {
		return addExamButton;
	}

	public WebElement getEditExamButton() {
		return editExamButton;
	}

	public WebElement getExamTotalAmount() {
		return examTotalAmount;
	}

	public WebElement getErrorText() {
		return errorText;
	}

	public List<WebElement> getOtherExpenseTypeDropdowns() {
		return otherExpenseTypeDropdowns;
	}

	public WebElement getCourseNameValidationText() {
		return courseNameValidationText;
	}

	public WebElement getCourseNumberValidationText() {
		return courseNumberValidationText;
	}

	public WebElement getRequestedAmountValidationText() {
		return requestedAmountValidationText;
	}

	public WebElement getInstructionTypeNameValidationText() {
		return instructionTypeNameValidationText;
	}

	public WebElement getTaxAcknowledgementValidationText() {
		return taxAcknowledgementValidationText;
	}

	public WebElement getApplicationErrorMessage() {
		return applicationErrorMessage;
	}

	public WebElement getRemoveFirstOtherExpenseButton() {
		return removeFirstOtherExpenseButton;
	}

	public WebElement getEditSecondOtherExpenseButton() {
		return editSecondOtherExpenseButton;
	}

	public WebElement getEditThirdOtherExpenseButton() {
		return editThirdOtherExpenseButton;
	}

	public WebElement getEditFourthOtherExpenseButton() {
		return editFourthOtherExpenseButton;
	}

	public WebElement getRemoveSecondOtherExpenseButton() {
		return removeSecondOtherExpenseButton;
	}

	public WebElement getRemoveThirdOtherExpenseButton() {
		return removeThirdOtherExpenseButton;
	}

	public WebElement getRemoveFourthOtherExpenseButton() {
		return removeFourthOtherExpenseButton;
	}

	public WebElement getFirstCourseExpenseDescription() {
	    return firstCourseExpenseDescription;
	}

	public WebElement getSecondCourseExpenseDescription() {
	    return secondCourseExpenseDescription;
	}

	public WebElement getThirdCourseExpenseDescription() {
	    return thirdCourseExpenseDescription;
	}

	public WebElement getFourthCourseExpenseDescription() {
	    return fourthCourseExpenseDescription;
	}

	public WebElement getFifthCourseExpenseDescription() {
	    return fifthCourseExpenseDescription;
	}

	public WebElement getSessionInformationHeaderText() {
		return sessionInformationHeaderText;
	}

	public WebElement getSecondCourseNameInputText() {
		return secondCourseNameInputText;
	}

	public WebElement getThirdCourseNameInputText() {
		return thirdCourseNameInputText;
	}

	public WebElement getFourthCourseNameInputText() {
		return fourthCourseNameInputText;
	}

	public WebElement getEditThirdCourseButton() {
		return editThirdCourseButton;
	}

	public WebElement getRemoveThirdCourseButton() {
		return removeThirdCourseButton;
	}

	public WebElement getEditFourthCourseButton() {
		return editFourthCourseButton;
	}

	public WebElement getRemoveFourthCourseButton() {
		return removeFourthCourseButton;
	}

	public WebElement getExpenseCard() {
		return expenseCard;
	}

	public WebElement getFirstExpenseText() {
		return firstExpenseText;
	}

	public WebElement getSecondExpenseText() {
		return secondExpenseText;
	}

	public WebElement getThirdExpenseText() {
		return thirdExpenseText;
	}

	public WebElement getFourthExpenseText() {
		return fourthExpenseText;
	}

	public WebElement getSecondCourseRequestedAmt() {
		return secondCourseRequestedAmt;
	}

	public WebElement getSecondCourseExpenseAmt() {
		return secondCourseExpenseAmt;
	}

	public WebElement getThirdCourseRequestedAmt() {
		return thirdCourseRequestedAmt;
	}

	public WebElement getThirdCourseExpenseAmt() {
		return thirdCourseExpenseAmt;
	}

	public WebElement getFourthCourseRequestedAmt() {
		return fourthCourseRequestedAmt;
	}

	public WebElement getFourthCourseExpenseAmt() {
		return fourthCourseExpenseAmt;
	}

	public List<WebElement> getExpenseRequestedAmt() {
		return expenseRequestedAmt;
	}

	public WebElement getCourseExpenseInformationHeaderText() {
		return courseExpenseInformationHeaderText;
	}

	public WebElement getCombinedExpenses() {
		return combinedExpenses;
	}

	public List<WebElement> getDollarSymbols() {
		return dollarSymbols;
	}

	public WebElement getGraduationQuestionText() {
		return graduationQuestionText;
	}

	public WebElement getExpectedGradDateLabel() {
		return expectedGradDateLabel;
	}

	public WebElement getActualGradDateLabel() {
		return actualGradDateLabel;
	}

	public WebElement getExpectedGradDateValidationText() {
		return expectedGradDateValidationText;
	}

	public WebElement getActualGradDateValidationText() {
		return actualGradDateValidationText;
	}

	public WebElement getDegreeCompleteYesButton() {
		return degreeCompleteYesButton;
	}

	public WebElement getDegreeCompleteNoButton() {
		return degreeCompleteNoButton;
	}

	public WebElement getCalendarClearBtn() {
		return calendarClearBtn;
	}

	public WebElement getSubscriptionTaxQ12() {
		return subscriptionTaxQ12;
	}
}