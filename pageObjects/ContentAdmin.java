package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class ContentAdmin {

    public ContentAdmin(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "admin";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "type")
    private WebElement contentAdminContentType;

    @FindBy(id = "component")
    private WebElement contentAdminContentCategory;

    @FindBy(id = "name")
    private WebElement contentAdminContentName;

    @FindBy(id = "addNewContentBtn")
    private WebElement addNewContentBtn;

    @FindBy(xpath = "//button[ text()='Search']")
    private WebElement searchContent;

    @FindBy(id = "editContentTitle")
    private WebElement editContentTitle;

    @FindBy(xpath = "//div[text()='siteMaintenanceNotification']")
    private WebElement siteMaintenanceNotification;

    @FindBy(xpath = "//button[text()='Delete']")
    private WebElement deleteContentBtn;

    @FindBy(id = "client")
    private WebElement clientDropdown;

    @FindBy(id = "program")
    private WebElement programDropdown;

    public WebElement getContentAdminContentType() {
        return contentAdminContentType;
    }

    public WebElement getContentAdminContentCategory() {
        return contentAdminContentCategory;
    }

    public WebElement getContentAdminContentName() {
        return contentAdminContentName;
    }

    public WebElement getAddNewContentBtn() {
        return addNewContentBtn;
    }

    public WebElement getSearchContent() {
        return searchContent;
    }

    public WebElement getEditContentTitle() {
        return editContentTitle;
    }

    public WebElement getSiteMaintenanceNotification() {
        return siteMaintenanceNotification;
    }

    public WebElement getDeleteContentBtn() {
        return deleteContentBtn;
    }

    public WebElement getClientDropdown() {
        return clientDropdown;
    }

    public WebElement getProgramDropdown() {
        return programDropdown;
    }
}
