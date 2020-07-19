package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class ForgotPassword {

	public ForgotPassword(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}

	private String url = "forgotPassword";

	@FindBy(id = "emailForgetPwd")
	private WebElement emailInput;

	@FindBy(id = "lastNameForgotPwd")
	private WebElement lastNameInput;

	@FindBy(id = "userNameForgotPwd")
	private WebElement userNameInput;

	@FindBy(id = "emailForgotPwd")
	private WebElement emailAddressInput;

	@FindBy(id = "confirmEmailForgotPwd")
	private WebElement confirmEmailAddressInput;

	@FindBy(id = "forgotPwdSendEmailButton")
	private WebElement sendLink;

	@FindBy(id = "forgotPwdBackToLoginLink")
	private WebElement backToLoginLink;

	@FindBy(id = "forgotPwdSuccessText")
	private WebElement forgotPwdSuccessText;

	public String getUrl() {
		return url;
	}

	public WebElement getEmailInput() {
		return emailInput;
	}

	public WebElement getLastNameInput() {
		return lastNameInput;
	}

	public WebElement getUserNameInput() {
		return userNameInput;
	}

	public WebElement getEmailAddressInput() {
		return emailAddressInput;
	}

	public WebElement getConfirmEmailAddressInput() {
		return confirmEmailAddressInput;
	}

	public WebElement getSendLink() {
		return sendLink;
	}

	public WebElement getBackToLoginLink() {
		return backToLoginLink;
	}

	public WebElement getForgotPwdSuccessText() {
		return forgotPwdSuccessText;
	}
}