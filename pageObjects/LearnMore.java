package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class LearnMore {

	public LearnMore(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}

	private String url = "learnMore";

	@FindBy(className = "learn-more-tab-1")
	private WebElement learnMoreTab1;

	@FindBy(className = "learn-more-tab-2")
	private WebElement learnMoreTab2;

	@FindBy(className = "learn-more-tab-3")
	private WebElement learnMoreTab3;

	@FindBy(className = "learn-more-tab-4")
	private WebElement learnMoreTab4;

	@FindBy(className = "learn-more-tab-5")
	private WebElement learnMoreTab5;

	@FindBy(className = "learn-more-tab-6")
	private WebElement learnMoreTab6;

	@FindBy(id = "advisingLearnMoreResourcesForBorrowersContent")
	private WebElement advisingLearnMoreResourcesForBorrowersContent;

	public String getUrl() {
		return url;
	}

	public WebElement getLearnMoreTab1() {
		return learnMoreTab1;
	}

	public WebElement getLearnMoreTab2() {
		return learnMoreTab2;
	}

	public WebElement getLearnMoreTab3() {
		return learnMoreTab3;
	}

	public WebElement getLearnMoreTab4() {
		return learnMoreTab4;
	}

	public WebElement getLearnMoreTab5() {
		return learnMoreTab5;
	}

	public WebElement getLearnMoreTab6() {
		return learnMoreTab6;
	}

	public WebElement getAdvisingLearnMoreResourcesForBorrowersContent() {
		return advisingLearnMoreResourcesForBorrowersContent;
	}
}