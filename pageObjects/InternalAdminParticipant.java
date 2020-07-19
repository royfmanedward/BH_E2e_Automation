package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.List;

public class InternalAdminParticipant {

    public InternalAdminParticipant(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "participant";

    public String getUrl() {
        return url;
    }

    @FindBy(xpath = "(//*[contains(@class,'aut-quick-search')]//input)")
    private WebElement quickSearchField;

    public WebElement getQuickSearchField() {
        return quickSearchField;
    }

}