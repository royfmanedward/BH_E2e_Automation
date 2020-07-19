package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class ClientAdmin {
    public ClientAdmin(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "applicationSearch";

    public String getUrl() {
        return url;
    }

    @FindBy(id = "clientAdminSearchButton")
    private WebElement clientAdminSearchButton;

    @FindBy(id = "employeeId")
    private WebElement clientAdminIdSearchInput;

    @FindBy(className = "tile-content")
    private WebElement dataTable;

    @FindBy(id = "advancedSearchButton")
    private WebElement adminPageAdvancedSearch;

    @FindBy(id = "applicationNum")
    private WebElement adminApplicationNum;

    @FindBy(id = "firstName")
    private WebElement clientAdminFnameSearchInput;

    @FindBy(id = "lastName")
    private WebElement clientAdminLnameSearchInput;

    @FindBy(id = "advancedSearchButton")
    private WebElement clientAdminAdvanceSearchButton;

    @FindBy(id = "applicationStatus-dropdown")
    private WebElement clientAdminAppStatusDropdown;

    @FindBy(id = "benefitPeriodName-dropdown")
    private WebElement clientAdminAppSessionStartDateDropdown;

    @FindBy(id = "active-dropdown")
    private WebElement clientAdminActiveInactiveDropdown;

    @FindBy(id = "educationalProvider")
    private WebElement clientAdminEducationProviderInput;

    @FindBy(className = "applications-amount-aut-test")
    private WebElement appHistoryLink;

    @FindBy(id = "clientAdminClearButton")
    private WebElement clientAdminClearButton;

    @FindBy(className = "participant-name-aut-test")
    private WebElement userProfileLink;

    @FindBy(id = "applicationNum")
    private WebElement clientAdminAppNumInput;

    @FindBy(className = "description")
    private WebElement clientAdminAppNumLink;

    @FindBy(className = "application-tickets-aut-test")
    private WebElement clientAdminTicketsLink;

    @FindBy(className = "application-number-aut-test")
    private WebElement clientAdminAppNumberLink;

    @FindBy(className = "fa-credit-card")
    private WebElement vcPageLink;

    @FindBy(className = "application-number-aut-test")
    private List<WebElement> appSearchAppNumberLink;

    public WebElement getVcPageLink() {
        return vcPageLink;
    }

    public WebElement getDataTable() {
        return dataTable;
    }

    public WebElement getClientAdminIdSearchInput() {
        return clientAdminIdSearchInput;
    }

    public WebElement getClientAdminSearchButton() {
        return clientAdminSearchButton;
    }

    public WebElement getAdminPageAdvancedSearch() {
        return adminPageAdvancedSearch;
    }

    public WebElement getAdminApplicationNum() {
        return adminApplicationNum;
    }

    public WebElement getClientAdminFnameSearchInput() {
        return clientAdminFnameSearchInput;
    }

    public WebElement getClientAdminLnameSearchInput() {
        return clientAdminLnameSearchInput;
    }

    public WebElement getClientAdminAdvanceSearchButton() {
        return clientAdminAdvanceSearchButton;
    }

    public WebElement getClientAdminAppStatusDropdown() {
        return clientAdminAppStatusDropdown;
    }

    public WebElement getClientAdminAppSessionStartDateDropdown() {
        return clientAdminAppSessionStartDateDropdown;
    }

    public WebElement getClientAdminActiveInactiveDropdown() {
        return clientAdminActiveInactiveDropdown;
    }

    public WebElement getClientAdminEducationProviderInput() {
        return clientAdminEducationProviderInput;
    }

    public WebElement getAppHistoryLink() {
        return appHistoryLink;
    }

    public WebElement getClientAdminClearButton() {
        return clientAdminClearButton;
    }

    public WebElement getUserProfileLink() {
        return userProfileLink;
    }

    public WebElement getClientAdminAppNumInput() {
        return clientAdminAppNumInput;
    }

    public WebElement getClientAdminAppNumLink() {
        return clientAdminAppNumLink;
    }

    public WebElement getClientAdminTicketsLink() {
        return clientAdminTicketsLink;
    }

    public WebElement getClientAdminAppNumberLink() {
        return clientAdminAppNumberLink;
    }

    public List<WebElement> getAppSearchAppNumberLink() {
        return appSearchAppNumberLink;
    }

}
