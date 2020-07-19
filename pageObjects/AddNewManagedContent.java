package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class AddNewManagedContent {

    public AddNewManagedContent(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "manageContent";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "addContentFormClient")
    private WebElement addContentFormClient;

    @FindBy(id = "contentComponent")
    private WebElement addContentCategory;

    @FindBy(id = "name")
    private WebElement addContentName;

    @FindBy(id = "addContentFormContentType")
    private WebElement addContentFormContentType;

    @FindBy(id = "startDate")
    private WebElement startDate;

    @FindBy(id = "endDate")
    private WebElement endDate;

    @FindBy(xpath = "//div[contains(@id,'taTextElement')]")
    private WebElement addMaintenanceText;

    @FindBy(xpath = "//div/input[@name='contentTitle' and @type='text']")
    private WebElement title;

    @FindBy(xpath = "//button[ text()='Add New Content']")
    private WebElement addNewContentBtn;

    public WebElement getAddContentFormClient() {
        return addContentFormClient;
    }

    public WebElement getAddContentCategory() {
        return addContentCategory;
    }

    public WebElement getAddContentName() {
        return addContentName;
    }

    public WebElement getAddContentFormContentType() {
        return addContentFormContentType;
    }

    public WebElement getStartDate() {
        return startDate;
    }

    public WebElement getEndDate() {
        return endDate;
    }

    public WebElement getAddMaintenanceText() {
        return addMaintenanceText;
    }

    public WebElement getTitle() {
        return title;
    }

    public WebElement getAddNewContentBtn() {
        return addNewContentBtn;
    }
}