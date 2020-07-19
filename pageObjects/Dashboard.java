package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import java.util.List;

public class Dashboard {

	public Dashboard(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}

	private String url = "dashboard";

	@FindBy(id = "otherLoansAddAnotherLoanBtn")
	private WebElement newStudentLoanNow;

	@FindBy(id = "btn-terms-conditions")
	private WebElement termsConditionsBtn;

	@FindBy(id = "btn-privacy-policy")
	private WebElement privacyPolicyBtn;

	@FindBy(id = "activeLoanCardRequestPaymentBtn")
	private WebElement requestPaymentBtn;

	@FindBy(id = "paymentRequestFormContinueBtn")
	private WebElement paymentRequestContinue;

	@FindBy(id = "paymentFrequency-dropdown")
	private WebElement paymentFreqDropdown;

	@FindBy(id = "paymentAmount")
	private WebElement newPaymentReqDollarAmount;

	@FindBy(id = "payment-request-id-0")
	private WebElement paymentRequestFirstAppLink;

	@FindBy(className = "toggle-more-link")
	private WebElement paymentRequestViewMore;

	@FindBy(className = "payment-requests-container")
	private WebElement paymentRequestContainer;

	@FindBy(id = "lrpBannerWelcomeHeader")
	private WebElement lrpBannerWelcomeText;

	@FindBy(id = "lrpBannerInactiveText")
	private WebElement lrpBannerInactiveText;

	@FindBy(id = "activeLoanCardLoanServicerName")
	private WebElement activeLoanCardLoanServicerName;

	@FindBy(id = "activeLoanCardLoanBalance")
	private WebElement activeLoanCardLoanBalance;

	@FindBy(id = "activeLoanCardLoanFrequency")
	private WebElement activeLoanCardLoanFrequency;

	@FindBy(className = "nav-link-loan-servicers")
	private WebElement superAdminLoanServicerNavLink;

	@FindBy(id = "principal")
	private WebElement principleTextBox;

	@FindBy(id = "extra")
	private WebElement extraTextBox;

	@FindBy(id = "interest")
	private WebElement interestTextBox;

	@FindBy(id = "term")
	private WebElement termTextBox;

	@FindBy(id = "amortizationCalcPrinciple")
	private WebElement amortizationCalcPrinciple;

	@FindBy(id = "amortizationCalcInterest")
	private WebElement amortizationCalcInterest;

	@FindBy(id = "amortizationCalcTotalSavings")
	private WebElement amortizationCalcTotalSavings;

	@FindBy(id = "amortizationCalcDiffInYears")
	private WebElement amortizationCalcDiffInYears;

	@FindBy(id = "amortizationCalcDiffInMonths")
	private WebElement amortizationCalcDiffInMonths;

	@FindBy(id = "lrpAmoritzationCalcCalculateButton")
	private WebElement calculateLoanInfo;

	@FindBy(className = "loading")
	private WebElement loadingSpinner;

	@FindBy(className = "other-loan-number")
	private List<WebElement> loanNumber;

	@FindBy(xpath = "//span[contains (@class, \"other-loan-number\")]/parent::div")
	private WebElement firstLoanNumber;

	@FindBy(id = "submissionConfirmationStatus")
	private WebElement paymentSubmitMsgText;

	@FindBy(className = "other-loan-card")
	private List<WebElement> loanCard;

	@FindBy(id = "modalSubmitBtn")
	private WebElement lrpDeleteLoanModalConfirmButton;

	@FindBy(id = "deleteLoanMenuBtn")
	private WebElement deleteButton;

	@FindBy(className = "modal-backdrop")
	private WebElement modalBackdrop;

	@FindBy(id = "activeLoansActionButton")
	private WebElement activeLoansActionButton;

	@FindBy(id = "lrpBannerAddloanButton")
	private WebElement lrpBannerAddloanButton;

	@FindBy(id = "payment-request-id-")
	private WebElement paymentRequestActiveFirstAppLink;

	@FindBy(id = "modalCloseButton")
	private WebElement modalCloseButton;

	@FindBy(id = "supportingDocumentationDocument0")
	private WebElement firstSupportingDocumentLR5PR;

	@FindBy(id = "supportingDocumentationDocument1")
	private WebElement secondSupportingDocumentLR5PR;

	@FindBy(id = "supportingDocumentationDocument2")
	private WebElement thirdSupportingDocumentLR5PR;

	@FindBy(id = "documentType")
	private WebElement documentTypeBoxPrModal;

	@FindBy(id = "supportingDocumentationSubmitDocumentButton")
	private WebElement suppDocSubmitPrModal;

	@FindBy(id = "modal-title")
	private WebElement addPaymentConfirmation;

	@FindBy(id = "modalCloseBtnHeader")
	private WebElement closeAddPaymentConfirmation;

	@FindBy(id = "advisingTile")
	private WebElement advisingTile;

	@FindBy(id = "navigateLoanActionBtn")
	private WebElement editLoanButton;

	@FindBy(className = "pagination")
	private WebElement pagination;

	@FindBy(id = "modal-title")
	private WebElement modalTitle;

	@FindBy(id = "modalSubmitBtn")
	private WebElement modalContinueButton;

	@FindBy(id = "preferredLenderTile")
	private WebElement preferredLenderTile;

	@FindBy(id = "thirdPartySiteWarning")
	private WebElement thirdPartySiteWarning;

	@FindBy(id = "externalWebsiteText")
	private WebElement externalWebsiteText;

	@FindBy(id = "externalWebsiteUrl")
	private WebElement externalWebsiteUrl;

	@FindBy(xpath = "//card[@status-color=\"gray\"]//span[contains(text(), \"Saved — Not Submitted\")]")
	private List<WebElement> grayTileNotSubmitted;

	@FindBy(xpath = "//card[@status-color=\"green\"]//span[contains(text(), \"Inactive\")]")
	private List<WebElement> greenTileInactive;

	@FindBy(id = "advisingTileLearnMore")
	private WebElement advisingTileLearnMore;

	@FindBy(id = "comments")
	private WebElement comments;

	@FindBy(id = "editLoanMenuBtn")
	private WebElement editLoanMenuBtn;

	@FindBy(id = "modal-content-inner")
	private WebElement modaltextBody;

	@FindBy(className = "application-status-aut-test")
	private WebElement paymentAppStatus;

	public String getUrl() {
		return url;
	}

	public WebElement getFirstLoanNumber() {
		return firstLoanNumber;
	}

	public List<WebElement> getGrayTileNotSubmitted() {
		return grayTileNotSubmitted;
	}

	public List<WebElement> getGreenTileInactive() {
		return greenTileInactive;
	}

	public WebElement getThirdSupportingDocumentLR5PR() {
		return thirdSupportingDocumentLR5PR;
	}

	public WebElement getModalCloseButton() {
		return modalCloseButton;
	}

	public WebElement getLrpBannerAddloanButton() {
		return lrpBannerAddloanButton;
	}

	public WebElement getModalBackdrop() {
		return modalBackdrop;
	}

	public WebElement getActiveLoansActionButton() {
		return activeLoansActionButton;
	}

	public WebElement getDeleteButton() {
		return deleteButton;
	}

	public WebElement getLrpDeleteLoanModalConfirmButton() {
		return lrpDeleteLoanModalConfirmButton;
	}

	public List<WebElement> getLoanCard() {
		return loanCard;
	}

	public List<WebElement> getLoanNumber() {
		return loanNumber;
	}

	public WebElement getLoadingSpinner() {
		return loadingSpinner;
	}

	public WebElement getCalculateLoanInfo() {
		return calculateLoanInfo;
	}

	public WebElement getAmortizationCalcDiffInYears() {
		return amortizationCalcDiffInYears;
	}

	public WebElement getAmortizationCalcDiffInMonths() {
		return amortizationCalcDiffInMonths;
	}

	public WebElement getAmortizationCalcTotalSavings() {
		return amortizationCalcTotalSavings;
	}

	public WebElement getAmortizationCalcInterest() {
		return amortizationCalcInterest;
	}

	public WebElement getAmortizationCalcPrinciple() {
		return amortizationCalcPrinciple;
	}

	public WebElement getTermTextBox() {
		return termTextBox;
	}

	public WebElement getInterestTextBox() {
		return interestTextBox;
	}

	public WebElement getExtraTextBox() {
		return extraTextBox;
	}

	public WebElement getPrincipleTextBox() {
		return principleTextBox;
	}

	public WebElement getPaymentRequestFirstAppLink() {
		return paymentRequestFirstAppLink;
	}

	public WebElement getPaymentRequestViewMore() {
		return paymentRequestViewMore;
	}

	public WebElement getPaymentRequestContainer() {
		return paymentRequestContainer;
	}

	public WebElement getNewStudentLoanNow() {
		return newStudentLoanNow;
	}

	public WebElement getTermsConditionsBtn() {
		return termsConditionsBtn;
	}

	public WebElement getPrivacyPolicyBtn() {
		return privacyPolicyBtn;
	}

	public WebElement getRequestPaymentBtn() {
		return requestPaymentBtn;
	}

	public WebElement getPaymentRequestContinue() {
		return paymentRequestContinue;
	}

	public WebElement getPaymentFreqDropdown() {
		return paymentFreqDropdown;
	}

	public WebElement getNewPaymentReqDollarAmount() {
		return newPaymentReqDollarAmount;
	}

	public WebElement getLrpBannerWelcomeText() {
		return lrpBannerWelcomeText;
	}

	public WebElement getActiveLoanCardLoanServicerName() {
		return activeLoanCardLoanServicerName;
	}

	public WebElement getActiveLoanCardLoanBalance() {
		return activeLoanCardLoanBalance;
	}

	public WebElement getActiveLoanCardLoanFrequency() {
		return activeLoanCardLoanFrequency;
	}

	public WebElement getSuperAdminLoanServicerNavLink() {
		return superAdminLoanServicerNavLink;
	}

	public WebElement getPaymentSubmitMsgText() {
		return paymentSubmitMsgText;
	}

	public WebElement getPaymentRequestActiveFirstAppLink() {
		return paymentRequestActiveFirstAppLink;
	}

	public WebElement getFirstSupportingDocumentLR5PR() {
		return firstSupportingDocumentLR5PR;
	}

	public WebElement getSecondSupportingDocumentLR5PR() {
		return secondSupportingDocumentLR5PR;
	}

	public WebElement getDocumentTypeBoxPrModal() {
		return documentTypeBoxPrModal;
	}

	public WebElement getSuppDocSubmitPrModal() {
		return suppDocSubmitPrModal;
	}

	public WebElement getAddPaymentConfirmation() {
		return addPaymentConfirmation;
	}

	public WebElement getCloseAddPaymentConfirmation() {
		return closeAddPaymentConfirmation;
	}

	public WebElement getAdvisingTile() {
		return advisingTile;
	}

	public WebElement getEditLoanButton() {
		return editLoanButton;
	}

	public WebElement getPagination() {
		return pagination;
	}

	public WebElement getModalTitle() {
		return modalTitle;
	}

	public WebElement getModalContinueButton() {
		return modalContinueButton;
	}

	public WebElement getLrpBannerInactiveText() {
		return lrpBannerInactiveText;
	}

	public WebElement getPreferredLenderTile() {
		return preferredLenderTile;
	}

	public WebElement getThirdPartySiteWarning() {
		return thirdPartySiteWarning;
	}

	public WebElement getExternalWebsiteText() {
		return externalWebsiteText;
	}

	public WebElement getExternalWebsiteUrl() {
		return externalWebsiteUrl;
	}

	public WebElement getAdvisingTileLearnMore() {
		return advisingTileLearnMore;
	}

	public WebElement getComments() {
		return comments;
	}

	public WebElement getEditLoanMenuBtn() {
		return editLoanMenuBtn;
	}

	public WebElement getModaltextBody() {
		return modaltextBody;
	}

	public WebElement getPaymentAppStatus() {
		return paymentAppStatus;
	}
}