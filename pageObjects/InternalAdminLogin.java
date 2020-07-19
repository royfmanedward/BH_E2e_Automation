package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class InternalAdminLogin {

	public InternalAdminLogin(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}

	private String url = "login";

	@FindBy(id = "loginFormSubmitBtn")
	private WebElement loginSubmit;

	@FindBy(id = "loginUsername")
	private WebElement usernameInput;

	@FindBy(id = "loginPassword")
	private WebElement passwordInput;

	@FindBy(id = "loginRememberMeLabel")
	private WebElement rememberMeLabel;

	@FindBy(className = "aut-loginRememberMe-checkbox")
	private WebElement rememberMeCheckbox;

	@FindBy(className = "login-logo")
	private WebElement loginLogoImage;

	@FindBy(id = "termsConditions")
	private WebElement termsConditions;

	@FindBy(id = "privacyPolicy")
	private WebElement privacyPolicy;

	@FindBy(id = "trademarks")
	private WebElement trademarks;

	@FindBy(id = "copyright")
	private WebElement copyright;

	@FindBy(className = "alert-message")
	private WebElement alertBanner;

	@FindBy(className = "button-spinner")
	private WebElement buttonSpinner;

	public String getUrl() {
		return url;
	}

	public WebElement getLoginSubmit() {
		return loginSubmit;
	}

	public WebElement getUsernameInput() {
		return usernameInput;
	}

	public WebElement getPasswordInput() {
		return passwordInput;
	}

	public WebElement getRememberMeLabel() {
		return rememberMeLabel;
	}

	public WebElement getRememberMeCheckbox() {
		return rememberMeCheckbox;
	}

	public WebElement getLoginLogoImage() {
		return loginLogoImage;
	}

	public WebElement getTermsConditions() {
		return termsConditions;
	}

	public WebElement getPrivacyPolicy() {
		return privacyPolicy;
	}

	public WebElement getTrademarks() {
		return trademarks;
	}

	public WebElement getCopyright() {
		return copyright;
	}

	public WebElement getAlertBanner() {
		return alertBanner;
	}

	public WebElement getButtonSpinner() {
		return buttonSpinner;
	}
}