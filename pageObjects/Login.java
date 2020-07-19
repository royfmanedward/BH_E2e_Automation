package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class Login {

	public Login(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}

	private String url = "nonsso";

	@FindBy(id = "loginBtnSubmit")
	private WebElement loginSubmit;

	@FindBy(id = "loginUsername")
	private WebElement usernameInput;

	@FindBy(id = "loginPassword")
	private WebElement passwordInput;

	@FindBy(id = "loginLinkFirstTime")
	private WebElement firstTimeHere;

	@FindBy(id = "loginLinkForgotPwd")
	private WebElement forgotPassword;

	@FindBy (xpath = "//span[contains(@id,'loginErrorMessageMsg')]/parent::div")
	private WebElement errorText;

	@FindBy (xpath = "//div[contains(@class,'alert alert-danger')]")
	private WebElement invalidLoginText;

	@FindBy(id ="emailForgotPwd")
	private WebElement sendEmailInput;

	@FindBy(id = "forgot-password-btn-send-email")
	private WebElement forgotSendLink;

	@FindBy(id = "loginProductSelectButton-1")
	private WebElement tuitionProgramManagement;

	@FindBy(id = "loginProductSelectButton-2")
	private WebElement studentLoanRepayment;

	@FindBy(id = "loginProductSelectButton-3")
	private WebElement studentLoanExpertGuidance;

	@FindBy(xpath = "//button[contains(@id,'loginProductSelectButton')]")
	private List<WebElement> eligibleProductList;

	@FindBy(id = "eulaAgreeLabel")
	private WebElement serviceAgreementLabel;

	@FindBy(id = "loginAcceptEulaButton")
	private WebElement serviceAgreementButton;

	@FindBy(id = "rememberMe")
	private WebElement rememberMeCheckbox;

	@FindBy(id = "rememberMe")
	private List<WebElement> rememberMeCheckboxList;

	@FindBy(id = "loginLogoImage")
	private WebElement loginLogoImage;
	
	@FindBy(id = "ContentPlaceHolder1_MFALoginControl1_UserIDView_txtUserid_UiInput")
	private WebElement bhUsernameInput;

	@FindBy(id = "ContentPlaceHolder1_MFALoginControl1_UserIDView_tbxPassword_UiInput")
	private WebElement bhPasswordInput;

	@FindBy(xpath = "//a[contains( text(), 'Log')]")
	private WebElement bhLoginBtn;

	@FindBy(xpath = "//label[contains(@class,'page-header')]")
	private WebElement bhLoginHeader;

	@FindBy(id = "loginLinkSignedUptYetRegister")
	private WebElement registerNow;

	@FindBy(id = "preLoader")
	private WebElement preLoader;

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

	public WebElement getFirstTimeHere() {
		return firstTimeHere;
	}

	public WebElement getForgotPassword() {
		return forgotPassword;
	}

	public WebElement getErrorText() {
		return errorText;
	}

	public WebElement getSendEmailInput() {
		return sendEmailInput;
	}

	public WebElement getForgotSendLink() {
		return forgotSendLink;
	}

	public WebElement getTuitionProgramManagement() {
		return tuitionProgramManagement;
	}

	public WebElement getStudentLoanRepayment() {
		return studentLoanRepayment;
	}

	public WebElement getStudentLoanExpertGuidance() {
		return studentLoanExpertGuidance;
	}

	public WebElement getServiceAgreementLabel() {
		return serviceAgreementLabel;
	}

	public WebElement getServiceAgreementButton() {
		return serviceAgreementButton;
	}

	public List<WebElement> getRememberMeCheckboxList() {
		return rememberMeCheckboxList;
	}

	public WebElement getRememberMeCheckbox() {
		return rememberMeCheckbox;
	}

	public WebElement getLoginLogoImage() {
		return loginLogoImage;
	}

	public WebElement getBhUsernameInput() {
		return bhUsernameInput;
	}

	public WebElement getBhPasswordInput() {
		return bhPasswordInput;
	}

	public WebElement getBhLoginBtn() {
		return bhLoginBtn;
	}

	public WebElement getBhLoginHeader() {
		return bhLoginHeader;
    }
    
	public List<WebElement> getEligibleProductList() {
		return eligibleProductList;
	}

	public WebElement getRegisterNow() {
		return registerNow;
	}

	public WebElement getPreLoader() {
		return preLoader;
	}

	public WebElement getInvalidLoginText() {
		return invalidLoginText;
	}
}
