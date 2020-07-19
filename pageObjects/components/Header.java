package pageObjects.components;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class Header {

	public Header(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "navLogoImage")
	private WebElement homeLogoImage;

	@FindBy(id = "navLinkNewApplicationButton")
	private WebElement newApplicationButton;

	@FindBy(id = "nav-link-home")
	private WebElement homeNav;

	@FindBy(id = "nav-link-advising")
	private WebElement educationCoachingNav;

	@FindBy(id = "nav-link-history")
	private WebElement historyNav;

	@FindBy(id = "nav-link-payment-request-history")
	private WebElement paymentHistoryNav;

	@FindBy(id = "navSupportBtn")
	private WebElement supportNav;

	@FindBy(id = "navProfileButton")
	private WebElement iconProfile;

	@FindBy(id = "profile-link")
	private WebElement profileNav;

	@FindBy(id = "profile-link-logout")
	private WebElement logoutNav;

	@FindBy(id = "nav-link-clientAdmin")
	private WebElement adminNav;

	@FindBy(id = "productSelectionBtn")
	private WebElement productSelectionIcon;

	@FindBy(id = "Tuition Program ManagementLink")
	private WebElement tuitionProductSelection;

	@FindBy(id = "Student Loan RepaymentLink")
	private WebElement loanProductSelection;

	@FindBy(id = "supportLink")
	private WebElement supportLink;

	@FindBy(id = "edAccessSupportLink")
	private WebElement edAccessSupportLink;

	@FindBy(id = "logoutConfirmButton")
	private WebElement logOutButton;

	@FindBy(id = "nav--btn-toggle-messages")
	private WebElement viewMessages;

	@FindBy(className = "message-content")
	private WebElement messageContent;

	@FindBy(id = "supportLiveChatButton-btn-link")
	private WebElement liveChatLink;

	@FindBy(id = "earlyEducationAndPreschoolLink")
	private WebElement earlyEducationAndPreschoolLink;

	@FindBy(id = "backUpCareLink")
	private WebElement backUpCareLink;

	@FindBy(id = "collegeCoachLink")
	private WebElement collegeCoachLink;

	public WebElement getLiveChatLink() {
		return liveChatLink;
	}

	public WebElement getMessageContent() {
		return messageContent;
	}

	public WebElement getViewMessages() {
		return viewMessages;
	}

	public WebElement getEdAccessSupportLink() {
		return edAccessSupportLink;
	}

	public WebElement getAdminNav() {
		return adminNav;
	}

    public WebElement getSupportLink() {
        return supportLink;
    }

	public WebElement getHomeLogoImage() {
		return homeLogoImage;
	}

	public WebElement getNewApplicationButton() {
		return newApplicationButton;
	}

	public WebElement getHomeNav() {
		return homeNav;
	}

	public WebElement getEducationCoachingNav() {
		return educationCoachingNav;
	}

	public WebElement getHistoryNav() {
		return historyNav;
	}

	public WebElement getSupportNav() {
		return supportNav;
	}

	public WebElement getIconProfile() {
		return iconProfile;
	}

	public WebElement getProfileNav() {
		return profileNav;
	}

	public WebElement getLogoutNav() {
		return logoutNav;
	}

	public WebElement getPaymentHistoryNav() {
		return paymentHistoryNav;
	}

	public WebElement getProductSelectionIcon() {
		return productSelectionIcon;
	}

	public WebElement getTuitionProductSelection() {
		return tuitionProductSelection;
	}

	public WebElement getLoanProductSelection() {
		return loanProductSelection;
	}

	public WebElement getLogOutButton() {
		return logOutButton;
	}

	public WebElement getEarlyEducationAndPreschoolLink() {
		return earlyEducationAndPreschoolLink;
	}

	public WebElement getBackUpCareLink() {
		return backUpCareLink;
	}

	public WebElement getCollegeCoachLink() {
		return collegeCoachLink;
	}
}
