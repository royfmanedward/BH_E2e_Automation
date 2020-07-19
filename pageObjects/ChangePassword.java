package pageObjects;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

public class ChangePassword {

    public ChangePassword(WebDriver driver) {
        PageFactory.initElements(driver, this);
    }

    private String url = "changePassword";

    public String getUrl() {
        return url;
    }

    }