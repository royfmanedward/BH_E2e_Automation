package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class ContentAdminUser {

    public ContentAdminUser(WebDriver driver) { PageFactory.initElements(driver, this);}

    private String url = "users";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "clientList-dropdown")
    private WebElement clientListDropdown;

    @FindBy(id = "employeeId")
    private WebElement employeeId;

    @FindBy(id = "searchButton")
    private WebElement searchButton;

    @FindBy(id = "updateUserLink")
    private WebElement userNameLink;

    @FindBy(id = "userType-button")
    private WebElement userTypeButton;

    @FindBy(id = "userType-dropdown")
    private WebElement userTypeDropdown;

    @FindBy(id = "updateUserSaveBtn")
    private WebElement saveButton;

    @FindBy(id = "userAdminUpdateSuccessBanner")
    private WebElement userSavedBanner;

    @FindBy(id = "firstName")
    private WebElement firstName;

    @FindBy(id = "lastName")
    private WebElement lastName;

    public WebElement getClientListDropdown() {
        return clientListDropdown;
    }

    public WebElement getEmployeeId() {
        return employeeId;
    }

    public WebElement getSearchButton() {
        return searchButton;
    }

    public WebElement getUserNameLink() {
        return userNameLink;
    }

    public WebElement getUserTypeDropdown() {
        return userTypeDropdown;
    }

    public WebElement getUserTypeButton() {
        return userTypeButton;
    }

    public WebElement getSaveButton() {
        return saveButton;
    }

    public WebElement getUserSavedBanner() {
        return userSavedBanner;
    }

    public WebElement getFirstName() {
        return firstName;
    }

    public WebElement getLastName() {
        return lastName;
    }
}
