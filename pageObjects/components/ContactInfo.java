package pageObjects.components;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class ContactInfo {

	public ContactInfo(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "contactInformationHomeStreetAddress1")
	private WebElement homeStreetAddress1Text;

	@FindBy(id = "contactInformationHomeStreetAddress2")
	private WebElement homeStreetAddress2Text;

	@FindBy(id = "contactInformationHomeAddressCity")
	private WebElement homeAddressCityText;

	@FindBy(id = "contactInformationWorkStreetAddress1")
	private WebElement workStreetAddress1Text;

	@FindBy(id = "contactInformationWorkStreetAddress2")
	private WebElement workStreetAddress2Text;

	@FindBy(id = "contactInformationWorkAddressCity")
	private WebElement workAddressCityText;

	@FindBy(id = "profileContactInfoCancelButton")
	private WebElement cancelButton;

	@FindBy(id = "profileContactInfoSaveButton")
	private WebElement contactInformationSaveButton;

	@FindBy(id = "workPhoneNumber")
	private WebElement workPhoneText;

	@FindBy(id = "homePhoneNumber")
	private WebElement homePhoneText;

	@FindBy(id = "workEmailAddress")
	private WebElement workEmailText;

	@FindBy(id = "homeEmailAddress")
	private WebElement homeEmailText;

	@FindBy(id = "profileOtherEmail")
	private WebElement otherEmailInput;

	@FindBy(id = "profileOtherPhone")
	private WebElement otherPhoneInput;

	@FindBy(id = "profileOtherPhoneValidationText")
	private WebElement otherPhoneError;

	@FindBy(id = "profileOtherEmailValidationText")
	private WebElement OtherEmailError;

	@FindBy(id = "addressRadioGroup")
	private WebElement addressRadioGroup;

	@FindBy(id = "phoneRadioGroup")
	private WebElement phoneRadioGroup;

	@FindBy(id = "emailRadioGroup")
	private WebElement emailRadioGroup;

	public WebElement getAddressRadioGroup() {
		return addressRadioGroup;
	}

	public WebElement getPhoneRadioGroup() {
		return phoneRadioGroup;
	}

	public WebElement getEmailRadioGroup() {
		return emailRadioGroup;
	}

	public WebElement getHomeStreetAddress1Text() {
		return homeStreetAddress1Text;
	}

	public WebElement getHomeStreetAddress2Text() {
		return homeStreetAddress2Text;
	}

	public WebElement getHomeAddressCityText() {
		return homeAddressCityText;
	}

	public WebElement getWorkStreetAddress1Text() {
		return workStreetAddress1Text;
	}

	public WebElement getWorkStreetAddress2Text() {
		return workStreetAddress2Text;
	}

	public WebElement getWorkAddressCityText() {
		return workAddressCityText;
	}


	public WebElement getCancelButton() {
		return cancelButton;
	}

	public WebElement getContactInformationSaveButton() {
		return contactInformationSaveButton;
	}

	public WebElement getWorkPhoneText() {
		return workPhoneText;
	}

	public WebElement getHomePhoneText() {
		return homePhoneText;
	}

	public WebElement getWorkEmailText() {
		return workEmailText;
	}

	public WebElement getHomeEmailText() {
		return homeEmailText;
	}

	public WebElement getOtherPhoneInput() {
		return otherPhoneInput;
	}

	public WebElement getOtherPhoneError() {
		return otherPhoneError;
	}

	public WebElement getOtherEmailError() {
		return OtherEmailError;
	}

	public WebElement getOtherEmailInput() {
		return otherEmailInput;
	}
}