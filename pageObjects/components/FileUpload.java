package pageObjects.components;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class FileUpload {

	public FileUpload(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "uploadAppDocsInput")
	private WebElement sharedFileUpload;

	public WebElement getSharedFileUpload() {
		return sharedFileUpload;
	}
}
