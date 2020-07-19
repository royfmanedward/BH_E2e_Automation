package pageObjects.components;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class SaveAppForLaterOrDelete {

	public SaveAppForLaterOrDelete(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "modalCloseButton")
	private WebElement closeModalBtn;

	@FindBy(id = "modal-title")
	private WebElement titleText;

	@FindBy(id = "saveForLaterButton")
	private WebElement saveApplicationForLaterButton;

	@FindBy(id = "deleteApplicationButton")
	private WebElement deleteApplicationButton;

	public WebElement getCloseModalBtn() {
		return closeModalBtn;
	}

	public WebElement getTitleText() {
		return titleText;
	}

	public WebElement getSaveApplicationForLaterButton() {
		return saveApplicationForLaterButton;
	}

	public WebElement getDeleteApplicationButton() {
		return deleteApplicationButton;
	}
}
