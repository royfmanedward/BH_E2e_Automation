package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class ClientAdminTickets {
	public ClientAdminTickets(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}

	private String url = "tickets";

	public String getUrl() {
		return url;
	}

	@FindBy(className = "table-data-container")
	private WebElement dataTable;

	public WebElement getDataTable() {
		return dataTable;
	}
}
