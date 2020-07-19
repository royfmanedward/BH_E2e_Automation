package pageObjects.components;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class ChatSupport {

	public ChatSupport(WebDriver driver) {
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "lpChat")
	private WebElement chatWindow;

	@FindBy(id = "chat_EdAssist_3")
	private WebElement beginChatButton;

	@FindBy(id = "supportLiveChatButton-white")
	private WebElement supportLiveChatButton;

	@FindBy(id = "supportLink")
	private WebElement supportButton;

	@FindBy(className = "lp_maximized")
	private WebElement livePersonChat;

	@FindBy(className = "lp_cancel_button")
	private WebElement livePersonClose;

	public WebElement getSupportLiveChatButton() {
		return supportLiveChatButton;
	}

	public WebElement getChatWindow() {
		return chatWindow;
	}

	public WebElement getBeginChatButton() {
		return beginChatButton;
	}

	public WebElement getSupportButton() {
		return supportButton;
	}

	public WebElement getLivePersonChat() {
		return livePersonChat;
	}

	public WebElement getLivePersonClose() {
		return livePersonClose;
	}

}