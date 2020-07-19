package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class EdGoalProgramInfo {

    public EdGoalProgramInfo (WebDriver driver) {
        PageFactory.initElements(driver, this);
    }
    private String url = "programInformation";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "programRadioGroup")
    private WebElement programsRadioGroup;

    @FindBy(id = "degreeObjective-dropdown")
    private WebElement educationProgramDropdown;

    @FindBy(id = "fieldOfStudy-dropdown")
    private WebElement fieldOfStudyDropdown;

    @FindBy(xpath = "//*[contains(@id,'fieldOfStudy-option')]")
    private List<WebElement> fieldOfStudyDropdownElements;

    @FindBy(id = "programRadioGroup1")
    private WebElement educationGoalRadio;

    @FindBy(id = "courseStartDate")
    private WebElement courseStartDate;

    @FindBy(id = "courseEndDate")
    private WebElement courseEndDate;

    @FindBy(id = "providerName")
    private WebElement providerName;

    @FindBy(id = "programInformationContinueButton")
    private WebElement programInformationContinueButton;

    @FindBy(id = "whoIsYourPrimaryEducationProviderEditButton")
    private WebElement whoIsYourPrimaryEducationProviderEditButton;

    @FindBy(id = "providerInformationAddEducationProviderButton")
    private WebElement providerInformationAddEducationProviderButton;

    @FindBy(id = "providerSearchSubmitButton")
    private WebElement providerSearchSubmitButton;

    @FindBy(id = "providerSearchTbl")
    private WebElement providerSearchTbl;

    @FindBy(id = "programInformationCancelButton")
    private WebElement programInformationCancelButton;

    @FindBy(id="fieldOfStudy-button")
    private WebElement fieldOfStudyButton;

    public WebElement getEducationGoalRadio() {
        return educationGoalRadio;
    }

    public WebElement getCourseStartDate() {
        return courseStartDate;
    }

    public WebElement getCourseEndDate() {
        return courseEndDate;
    }

    public WebElement getProviderName() {
        return providerName;
    }

    public WebElement getProgramInformationContinueButton() {
        return programInformationContinueButton;
    }

    public WebElement getEducationProgramDropdown() {
        return educationProgramDropdown;
    }

    public WebElement getFieldOfStudyDropdown() {
        return fieldOfStudyDropdown;
    }

    public List<WebElement> getFieldOfStudyDropdownElements() {
        return fieldOfStudyDropdownElements;
    }

    public WebElement getWhoIsYourPrimaryEducationProviderEditButton() {
        return whoIsYourPrimaryEducationProviderEditButton;
    }

    public WebElement getProviderSearchSubmitButton() {
        return providerSearchSubmitButton;
    }

    public WebElement getProviderSearchTbl() {
        return providerSearchTbl;
    }

    public WebElement getProgramInformationCancelButton() {
        return programInformationCancelButton;
    }
    
    public WebElement getFieldOfStudyButton() {
        return fieldOfStudyButton;
    }

    public WebElement getProgramsRadioGroup() {
        return programsRadioGroup;
    }

    public WebElement getProviderInformationAddEducationProviderButton() {
        return providerInformationAddEducationProviderButton;
    }
}