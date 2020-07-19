package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class InternalAdminHome {

	public InternalAdminHome(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}

	private String url = "home";

	@FindBy(className = "component-spinner")
	private WebElement componentSpinner;

	@FindBy(className = "fa-angle-double-left")
	private WebElement pageNavLeftArrow;

	@FindBy(className = "fa-angle-double-right")
	private WebElement pageNavRightArrow;

	@FindBy(xpath = "(//*[contains(@href, '/application/')])[1]")
	private WebElement firstAppNumberLink;

	@FindBy(xpath = "(//*[contains(@id,'application-task-0')]//parent::td//parent::tr/td[3]//a)")
	private WebElement firstUserProfileLink;

	@FindBy(xpath = "(//*[contains(@href, '/home')])")
	private WebElement homeTab;

	@FindBy(xpath = "(//ea-navbar)")
	private WebElement navBar;

	@FindBy(className = "aut-tasklist-page-1")
	private WebElement firstTasklistPage;

	@FindBy(className = "aut-tasklist-ellipsis-right")
	private WebElement tasklistEllipsisRight;

	@FindBy(className = "aut-tasklist-ellipsis-left")
	private WebElement tasklistEllipsisLeft;

	@FindBy(className = "aut-tasklist-first-page")
	private WebElement tasklistPageOne;

	@FindBy(className = "aut-no-results")
	private WebElement noResultsFound;

	@FindBy(className = "aut-tasklist-page")
	private List<WebElement> tasklistPage;

	@FindBy(className = "aut-app-number")
	private List<WebElement> appNumber;

	@FindBy(id = "application-task-0")
	private WebElement firstApplicationNumber;

	@FindBy(id = "application-task-1")
	private WebElement secondApplicationNumber;

	@FindBy(xpath = "(//*[contains(@class,'aut-quick-search')]//input)")
	private WebElement quickSearchField;

	public String getUrl() {
		return url;
	}

	public WebElement getComponentSpinner() {
		return componentSpinner;
	}

	public WebElement getPageNavLeftArrow() {
		return pageNavLeftArrow;
	}

	public WebElement getPageNavRightArrow() {
		return pageNavRightArrow;
	}

	public WebElement getFirstAppNumberLink() {
		return firstAppNumberLink;
	}

	public WebElement getHomeTab() {
		return homeTab;
	}

	public WebElement getNavBar() {
		return navBar;
	}

	public WebElement getFirstTasklistPage() {
		return firstTasklistPage;
	}

	public WebElement getTasklistEllipsisRight() {
		return tasklistEllipsisRight;
	}

	public WebElement getTasklistEllipsisLeft() {
		return tasklistEllipsisLeft;
	}

	public WebElement getTasklistPageOne() {
		return tasklistPageOne;
	}

	public WebElement getNoResultsFound() {
		return noResultsFound;
	}

	public  List<WebElement> getTasklistPage() {
		return tasklistPage;
	}

	public  List<WebElement> getAppNumber() {
		return appNumber;
	}

	public WebElement getFirstApplicationNumber() {
		return firstApplicationNumber;
	}

	public WebElement getSecondApplicationNumber() {
		return secondApplicationNumber;
	}

	public WebElement getFirstUserProfileLink() {
		return firstUserProfileLink;
	}

	public WebElement getQuickSearchField() {
		return quickSearchField;
	}

}
