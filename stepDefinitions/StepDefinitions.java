package stepDefinitions;

import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.cucumber.datatable.DataTable;
import org.apache.commons.io.FileUtils;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.Point;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import pageObjects.EdAccessLearnMore;
import pageObjects.InternalAdminHome;
import utility.CommonUtil;
import utility.CommonUtils.TakeScreenShot;
import utility.PageObjectUtility;
import utility.WebDriverFactory;
import utility.testrail.APIClient;
import utility.testrail.APIException;
import utility.testrail.TestRailPostRequest;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

public class StepDefinitions {

	private WebDriver driver;
	private String baseURL = "";
	private PageObjectUtility pageObjectUtility;
	private String currentPage;
	private String currentClient;
	private String actualText;
	private String currentApplication;
	private String currentAppNumber;
	private final int timeout = 45;
	private String testCaseId = "";
	private static String previousTestCaseId;
	private static ArrayList<String> testExampleStatuses = new ArrayList<>();
	private String testStatus;
	private String env = System.getProperty("aut_env", "stg");
	private final String fileUploadBaseDir = System.getProperty("user.dir") + "\\src\\test\\TestFile\\";
	private APIClient testrailClient = new APIClient("https://edassist.testrail.io/");
	private TestRailPostRequest testrailPost = new TestRailPostRequest();
	private String currentLoanNumber;
	private int beforeDeletion;
	private int afterDeletion;
	private boolean isInternalAdmin = false;
	private TakeScreenShot screenShot = new TakeScreenShot();
	private String randomNumber;
	private String numericDate;
	private String textToBeVerified;
	private static Map<String,String> dateMap = new HashMap<>();
	private String url;

	@Before
	public void setup() {
		deleteDirectory();
		if (env.equalsIgnoreCase("stg") ||
				env.equalsIgnoreCase("uat") ||
				env.equalsIgnoreCase("dev")) {
			baseURL = "-" + env + ".edassist.com/#/";

		} else if (env.equalsIgnoreCase("local")) {
			baseURL = "-dev.edassist.com:8444/";

		} else if (env.equalsIgnoreCase("mock")) {
			baseURL = "localhost/";

		} else {
			baseURL = env + ".edassist.com/#/";
		}
		driver = WebDriverFactory.createWebDriver();
		driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
		driver.manage().timeouts().pageLoadTimeout(60, TimeUnit.SECONDS);
		driver.manage().window().maximize();
		pageObjectUtility = new PageObjectUtility(driver);

		//Test is considered a fail unless it reaches the success step
		testStatus = "9";
	}

	@After(order = 0)
	public void updateTestrailWithStatus() throws IOException, APIException {
		if (!testCaseId.equals("")) {
			testExampleStatuses = testrailPost.createTestrailPostRequest(testrailClient, testCaseId, previousTestCaseId, testExampleStatuses, testStatus);
			previousTestCaseId = testCaseId;
		}
		deleteDirectory();
	}

	@After(order = 1)
	public void tearDown(Scenario scenario) {
		if (scenario.isFailed()) {
			scenario.write(" Execution Status of - "+scenario.getName()+"is "+scenario.getStatus());
			scenario.write("Failed scenario Env URL is "+driver.getCurrentUrl());
			screenShot.CaptureScreenShot(scenario, driver);
		}

		//Close the current tab.
		driver.close();

		//Close all open tabs and quit browser.
		driver.quit();
	}

	@Given("^I report test passing test status$")
	public void setTestPassStatusForTestrail() {
		testStatus = "1";
	}

	//Added code to set testrail testID based on env stg and uat and prod
	@Given("^I set the (\\S+), (\\S+) and (\\S+)$")
	public void setTestId(String stgTestCaseId, String uatTestCaseId, String prodTestCaseId) {
		if (env.equalsIgnoreCase("stg")) {
			testCaseId = stgTestCaseId;
		} else if (env.equalsIgnoreCase("uat")) {
			testCaseId = uatTestCaseId;
		} else
			testCaseId = prodTestCaseId;
		}

	@Given("^I set the (\\S+)$")
	public void setTestId(String testId) {
		testCaseId = testId;
	}

	@When("^I capture the current application ID from the url$")
	public void setApplicationNumber() {
		String[] currentUrl = driver.getCurrentUrl().split("/");
		int size = currentUrl.length;
		currentApplication = currentUrl[size - 1];
	}

	@Then("^I capture and compare the actual app ID from url and previous app ID are not equal$")
	public void compareApplications() {
		String[] currentUrl = driver.getCurrentUrl().split("/");
		int size = currentUrl.length;
		String actualApplication = currentUrl[size - 1];

		if (actualApplication.equalsIgnoreCase(currentApplication)){
			Assert.assertTrue(actualApplication + " is equal to " + currentApplication,false);
		}
		else {
			Assert.assertTrue(true);
		}
	}

	@Then("^I confirm current application page matches the captured application ID from the url$")
	public void verifyApplicationNumber() {
		String[] nowCurrentUrl = driver.getCurrentUrl().split("/");
		int size = nowCurrentUrl.length;
		String applicationId = nowCurrentUrl[size - 1];

		Assert.assertTrue(applicationId + " does not contain current application", applicationId.contains(currentApplication));
	}

	@When("^I capture the application number (\\S+) from the submission page$")
	public void setApplicationNum(String element) {
		verifyElementIsVisible(element);
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);
		currentAppNumber = webElement.getText();
	}

	@When("^I navigate to the current application summary page$")
	public void navigateToApplication() {
		if (isInternalAdmin == true && env == "mock") {
			url = "https://" + baseURL + "application/" + this.getCurrentApplication();

		} else if (isInternalAdmin == true && env != "local") {
			baseURL = baseURL.substring(0, baseURL.length() - 2);
			url = "https://" + currentClient + baseURL + "application/" + this.getCurrentApplication();

		} else {
			url = "https://" + currentClient + baseURL + "application/" + this.getCurrentApplication();

		}

		driver.get(url);
	}

	@When("^The application number is present within (\\S+) element$")
	public void verifyApplicationNumberPresent(String element) {
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);
		String elementText = webElement.getText();

		Assert.assertTrue("The application number is not present within the " + element, elementText.contains(currentAppNumber));
	}

	@When("^I navigate to the current educationGoal page$")
	public void navigateToeducationGoal() {
		url = "https://" + currentClient + baseURL + "educationGoal/" + currentApplication;
		driver.get(url);
	}

	@Given("^I'm on the (\\S+) site$")
	public void setCurrentClient(String client) {
		currentClient = client;
		if (currentClient.toLowerCase().contains("internaladmin")) {
			isInternalAdmin = true;
		}
	}

	@When("^I go to the (\\S+) page$")
	public void goToPage(String page) {
		if (currentClient.toLowerCase().contains("lr5demotestperf") || currentClient.toLowerCase().contains("lrtu5demotestperf")) {
			driver.get("https://" + pageObjectUtility.getPageUrl(page) + ".com/" + currentClient);

		} else if (isInternalAdmin == true && env == "mock" ) {
			driver.get("https://" + baseURL + pageObjectUtility.getPageUrl(page));

		} else {
			driver.get("https://" + currentClient + baseURL + pageObjectUtility.getPageUrl(page));
		}
		currentPage = page;
	}

	@When("^I enter (.*) in (\\S+) textfield$")
	public void enterTextInField(String inputValue, String element) {
		if (inputValue.equalsIgnoreCase("randomnumber")) {
			enterRandomNumberInField(element);
		} else {
			WebElement inputElement = pageObjectUtility.findElementInPage(element, currentPage);
			waitForElement(inputElement);
			inputElement.sendKeys(inputValue);
		}
	}

	@When("^I click (\\S+) key in (\\S+) textfield$")
	public void simulateKeypress(String key, String element) {
		WebElement inputElement = createWebElement(element);
		inputElement.sendKeys(Keys.valueOf(key));
	}

	@When("^I enter (.*) in (\\S+) textfield in the (\\S+) component")
	public void enterTextInComponentField(String inputValue, String element, String component) {
		WebElement input = pageObjectUtility.findElementInComponent(element, component);
		waitForElement(input);
		input.sendKeys(inputValue);
	}

	@When("^I enter application number in the (\\S+) textfield$")
	public void enterTextInAppNum( String element) {
		WebElement inputElement = createWebElement(element);
		inputElement.sendKeys(currentAppNumber);
	}

	@When("^I enter current date plus (.*) days in (\\S+)$")
	public void enterCourseDate(int numOfDays, String element) {
		WebElement input = pageObjectUtility.findElementInPage(element, currentPage);
		waitForElement(input);
		input.sendKeys(courseDate(numOfDays, element));
	}

	@When("^I convert (\\S+) date format from (.*) to (.*)$")
	public void convertDateFormat(String actualDate, String actualDateFormat, String toDateFormat) throws ParseException {
		String dateToBeConverted = dateMap.get(actualDate);
		DateFormat sdf = new SimpleDateFormat(actualDateFormat);
		Date date = sdf.parse(dateToBeConverted);
		String convertedDate = new SimpleDateFormat(toDateFormat).format(date);
		dateMap.put(actualDate, convertedDate);
	}

	@Then("^I validate (\\S+) date is equal to (.*) date$")
	public void compareDates(String element, String dateKey) {
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);
		String actualDate = webElement.getText();
		String expectedDate = dateMap.get(dateKey);
		Assert.assertTrue("dates are not equal "+ actualDate, actualDate.contains(expectedDate));
	}

	@Then("^I click (.*) button in action needed tile for current application$")
	public void clickOnButtonInActionNeededSection(String buttonText) {
		WebElement appTile = new WebDriverWait(driver, timeout).
				until(ExpectedConditions.visibilityOf(
						driver.findElement(By.xpath("//button[text()='#"+ currentAppNumber +"']/ancestor::div[@class='application-action-block']"))));

		WebElement applicationLink = appTile.findElement(By.id("app-link-number-lg"));
		WebElement appActionBtn = appTile.findElement(By.className("action-needed-application-action"));

		if (applicationLink.getText().contains(currentAppNumber) && buttonText.equalsIgnoreCase("appLink")){
			clickOnElementByJsExecutor(applicationLink);
		} else {
			clickOnElementByJsExecutor(applicationLink);
		}
	}

	@Then("^I should see (.*) in current Application's tile in action needed section$")
	public void verifyTextInActionNeeded(String expectedText) {
		verifyElementIsVisible("actionNeededContent");
		scrollToElement("actionNeededContent");
		WebElement appTile = new WebDriverWait(driver, timeout).
				until(ExpectedConditions.visibilityOf(
						driver.findElement(By.xpath("//button[text()='#"+ currentAppNumber +"']/ancestor::div[@class='application-action-block']"))));
		String actualText = appTile.getText();
		if (expectedText.toUpperCase().contains("DATE")) {
			String expectedDate = dateMap.get(expectedText);
			Assert.assertTrue("Expected date is not present in Action needed section ", actualText.contains(expectedDate));
		} else if (expectedText.equalsIgnoreCase("APPNUMBER")) {
			Assert.assertTrue("Expected text is not present in Actual Action needed section ", actualText.contains(currentAppNumber));
		} else if (expectedText.toLowerCase().contains("extracted")) {
			if (textToBeVerified.contains("Dependent")) {
				System.out.println(textToBeVerified.replace("Dependent (", ""));
				Assert.assertTrue("Expected text is not present in Actual Action needed section ", actualText.contains(textToBeVerified.replace("Dependent (", "")));
			} else if (textToBeVerified.contains("Spouse")) {
				Assert.assertTrue("Expected text is not present in Actual Action needed section ", actualText.contains(textToBeVerified.replace("Spouse (", "")));
			} else {
				Assert.assertTrue("Expected text is not present in Actual Action needed section ", actualText.contains(textToBeVerified));
			}
		} else {
			Assert.assertTrue("Expected text is not present in Actual Action needed section ", actualText.contains(expectedText) );
		}
	}

	@When("^I enter random number in (\\S+) field$")
	public void enterRandomNumberInField(String element) {
		String inputValue = randomAccountNumber();
		WebElement input = pageObjectUtility.findElementInPage(element, currentPage);
		input.sendKeys(inputValue);
	}

	@When("^I clear the (\\S+) field$")
	public void clearTextInputField(String element) {
		WebElement input = pageObjectUtility.findElementInPage(element, currentPage);
		clearTextInputElement(input);
	}

	@When("^I switch to (\\S+) frame$")
	public void switchToIFrame(String element) {
		WebElement frameElement = pageObjectUtility.findElementInPage(element, currentPage);
		driver.switchTo().frame(frameElement);
	}

	@When("^I verify file is downloaded with name (\\S+)$")
	public void isFileDownloaded(String filename) {
		File downloadedFile = new File("src/resources/tempDownloadFiles/" + filename);
		try {
			WebDriverWait wait = new WebDriverWait(driver, timeout);
			ExpectedCondition<Boolean> fileIsPresent = arg0 -> downloadedFile.exists();
			wait.until(fileIsPresent);
		} catch (TimeoutException TEx) {
			Assert.assertTrue(System.getProperty("user.dir") + "Can't find the file \n" +TEx , false);
		}
	}

	@When("^I switch back to main frame$")
	public void switchBackToMainFrame() {
		driver.switchTo().defaultContent();
	}

	@When("^I clear the (\\S+) field in the (\\S+) component$")
	public void clearTextInputInComponentField(String element, String component) {
		WebElement input = pageObjectUtility.findElementInComponent(element, component);
		clearTextInputElement(input);
	}

	@When("^I click the (\\S+) element")
	public void clickElement(String element) {
		new WebDriverWait(driver, timeout).until(
				webDriver -> ((JavascriptExecutor) webDriver).executeScript("return document.readyState").equals("complete"));
		WebElement elementToClick = pageObjectUtility.findElementInPage(element, currentPage);
		try {
			elementToClick.click();
		} catch(StaleElementReferenceException e) {
			elementToClick.click();
		}
	}

	@When("^I click first available day with available time$")
	public void clickElementInCalender() {
		// Available times are two months out, clicking to next tab to ensure timeslots are returned
		WebElement datePickerMonthRightArrow = new WebDriverWait(driver, timeout).
				until(ExpectedConditions.elementToBeClickable(
						driver.findElement(By.id("datePickerMonthRightArrow"))));

		datePickerMonthRightArrow.click();
		datePickerMonthRightArrow.click();

		WebElement availableDay = new WebDriverWait(driver, timeout).
				until(ExpectedConditions.elementToBeClickable(
						driver.findElements(By.className("calendar-enabled-day")).get(24)));

		availableDay.click();
	}

	@When("^I click the (\\S+) in the (\\S+) component$")
	public void clickElementInComponent(String element, String component) {
		clickOnElementInComponent(element, component);
	}

	@When("^I move to (\\S+) xpath element and click$")
	public void moveToAndClickElement(String element) {
		WebElement elementToClick = pageObjectUtility.findElementInPage(element, currentPage);

		Point coordinates = elementToClick.getLocation();
		int x = coordinates.getX();
		int y = coordinates.getY();

		Actions action = new Actions(driver);
		action.moveToElement(elementToClick).moveByOffset(x,y).click().build().perform();
		elementToClick.click();
	}

	@When("^I click the (\\S+) in the (\\S+) component with jsExecutor$")
	public void clickElementInComponentJsExecutor(String element, String component) {
		clickOnElementInComponentJsExecutor(element, component);
	}

	@When("^I login with (\\S+) username and (\\S+) password$")
	public void login(String username, String password) {
		if (isInternalAdmin == true) {
			goToPage("InternalAdminLogin");
			enterTextInField(username, "UsernameInput");
			enterTextInField(password, "PasswordInput");
			clickElement("LoginSubmit");
		}
		else if (currentClient.contains("lr5demo") || currentClient.contains("lr5tu5demo") || currentClient.contains("eg5demo") || currentClient.contains("eg5tu5demo")) {
			goToPage("Login");
			waitForElementNotVisible("preLoader");
			enterTextInField(username,"bhUsernameInput");
			enterTextInField(password,"bhPasswordInput");
			clickElement("bhLoginBtn");
		}
		else if (currentClient.contains("lrtu5demotestperf")) {
			waitForElementNotVisible("preLoader");
			enterTextInField(username,"bhUsernameInput");
			enterTextInField(password,"bhPasswordInput");
			clickElement("bhLoginBtn");
		}
		else {
			goToPage("Login");
			enterTextInField(username, "UsernameInput");
			enterTextInField(password, "PasswordInput");
			clickElement("LoginSubmit");
		}
	}

	@When("^I click (\\S+) to go to (\\S+) page$")
	public void clickAndGoToPage(String button, String page) {
		clickElement(button);
		verifyPage(page);
		currentPage = page;
	}

	@When("^I check (.*) radio dial from the (\\S+)$")
	public void checkFromRadio(String optionText, String radioName) {
		WebElement radioGroupElement = new WebDriverWait(driver, timeout).until
				(ExpectedConditions.elementToBeClickable(pageObjectUtility.findElementInPage(radioName, currentPage)));
		WebElement radioToClick = radioGroupElement.findElement(By.xpath(".//label[text()=\"" + optionText + "\"]"));

		radioToClick.click();
	}

	@When("^I select the radio dial with (.*) text from the (\\S+) group$")
	public void checkFromRadioGroup(String optionText, String radioName) {
		WebElement radioGroupElement = new WebDriverWait(driver, timeout).until
				(ExpectedConditions.visibilityOf(driver.findElement(By.name(radioName))));
		WebElement radioToClick = radioGroupElement.findElement(By.xpath(".//label[text()=\"" + optionText + "\"]"));

		JavascriptExecutor js = (JavascriptExecutor) driver;
		js.executeScript("arguments[0].click();",radioToClick);
	}

	@Then("^The radio dial with (.*) text from the (\\S+) group is selected$")
	public void radioDialIsSelected(String optionText, String radioName) {
	    Boolean correctRadioSelected = false;
        String radioSelected = "radio text not found";

        String scriptToExecute = "var radioElement = $('input[type=radio][name=" + radioName + "]:checked').parent().children()[1]; return radioElement.innerText";
        JavascriptExecutor jsExec = (JavascriptExecutor) driver;

        try {
            radioSelected = (String) jsExec.executeScript(scriptToExecute);

            if (radioSelected.equals(optionText)) {
                correctRadioSelected = true;
            }
        } catch (Exception e) {
            System.out.println(String.format("%s not found, trying again", optionText));
        }

        if (!correctRadioSelected) {
            try {
                scriptToExecute = "var radioElement = $('input[type=radio][name=" + radioName + "]:checked'); return radioElement.innerText";
                radioSelected = (String) jsExec.executeScript(scriptToExecute);

                if (radioSelected.equals(optionText)) {
                    correctRadioSelected = true;
                }
            } catch (Exception e) {
                System.out.println(String.format("%s not found", optionText));
            }
        }

        if (!correctRadioSelected) {
            //Try isSelected if no other methods work
            WebElement radioGroupElement = new WebDriverWait(driver, timeout).until
                    (ExpectedConditions.elementToBeClickable(driver.findElement(By.name(radioName))));
            WebElement radioToVerify = radioGroupElement.findElement(By.xpath(".//label[text()=\"" + optionText + "\"]"));

            if (radioToVerify.isSelected()) {
                correctRadioSelected = true;
            }
        }
        Assert.assertTrue("Correct radio button is not selected", correctRadioSelected);
	}

    @Then("^The radio dial with (.*) text in the (\\S+) group is visible")
    public void verifyRadioDialWithTextIsVisible(String optionText, String radioName) {
		WebElement radioGroupElement = new WebDriverWait(driver, timeout).until
				(ExpectedConditions.visibilityOf(driver.findElement(By.name(radioName))));
		WebElement radioToVerify = radioGroupElement.findElement(By.xpath(".//label[text()=\"" + optionText + "\"]"));

		Assert.assertTrue("Radio dial with " + optionText + " is not visible", radioToVerify.isDisplayed());
    }

	@Then("^The (\\S+) radio group is disabled")
	public void verifyElementWithTextIsDisabled( String radioName) {
		WebElement radioGroupElement = new WebDriverWait(driver, timeout).until(
				ExpectedConditions.visibilityOfElementLocated(By.name(radioName)));

		Assert.assertTrue(radioName + " radio group is not disabled", radioGroupElement.getAttribute("class").contains("disabled-radio-group"));
	}

	@When("^I select (.*) from the (\\S+)$")
	public void selectFromDropdown(String optionText, String dropdownName) {
		WebElement dropdownElement = new WebDriverWait(driver, timeout).until(
				ExpectedConditions.visibilityOfElementLocated(
						By.id(pageObjectUtility.findElementInPage(dropdownName, currentPage)
								.getAttribute("id"))));

		WebElement dropDownButton = new WebDriverWait(driver, timeout).until(
				ExpectedConditions.visibilityOfElementLocated(
						By.id(dropdownElement.findElement(By.tagName("button"))
								.getAttribute("id"))));

		dropDownButton.click();

		if (optionText.toLowerCase().contains("random")) {
			WebElement itemToSelect = new WebDriverWait(driver, timeout).until(
					ExpectedConditions.elementToBeClickable(
							By.id(dropdownElement.findElement(By.xpath(".//span[contains(text(),\"" + randomNumber + "\")]/ancestor::li"))
									.getAttribute("id"))));
			itemToSelect.isEnabled();
			itemToSelect.click();
		} else {
			WebElement itemToSelect = new WebDriverWait(driver, timeout).until(
					ExpectedConditions.elementToBeClickable(
							By.id(dropdownElement.findElement(By.xpath(".//span[contains(text(),\"" + optionText + "\")]/ancestor::li"))
									.getAttribute("id"))));
			itemToSelect.isEnabled();
			itemToSelect.click();
		}
	}

	@When("^I select application number from (\\S+)$")
	public void selectFromDropdownByCurrentAppNum(String dropdownName) {
		selectFromDropdown(currentAppNumber, dropdownName);
	}

	@When("^I select (.*) from (\\S+) dropdown$")
	public void selectFromListBox(String optionText, String dropdownName) {
		WebElement dropdownElement = createWebElement(dropdownName);
		Select dropdown = new Select(dropdownElement);
		dropdown.selectByVisibleText(optionText);
	}

	@When("^I select (\\S+) from the (\\S+) combobox$")
	public void selectFromComboBox(String selectionID, String dropdownName) {
		WebElement dropdownElement = createWebElement(dropdownName);
		dropdownElement.click();

		WebElement itemToSelect = createWebElement(selectionID);
		itemToSelect.click();
	}

	@When("^I click the first selection in the education providers search results table (\\S+)")
	public void clickEdProvider(String tableId) {
		WebElement table = createWebElement(tableId);
		List<WebElement> rows = table.findElements(By.className("link"));

		//Click first row in table
		WebElement row = rows.get(0);
		row.click();
	}

	@When("^I click the (\\S+) in first (\\S+)")
	public void clickFirstChildOfFirstElement(String childElement, String container) {
		WebElement webElement = getElementInTheContainerByIndex(childElement, container, 0, 0);

		JavascriptExecutor js = (JavascriptExecutor) driver;

		String id = webElement.getAttribute("id");

		if (!id.equals("")) {
			webElement = new WebDriverWait(driver, timeout).until(
					ExpectedConditions.visibilityOfElementLocated(
							By.id(getElementInTheContainerByIndex(
									childElement, container, 0, 0).getAttribute("id"))));

			js.executeScript("arguments[0].click();",webElement);
		} else {
			String childClasses = "." + getElementInTheContainerByIndex(childElement, container, 0, 0).getAttribute("class").replace(" ", ".");

			webElement = new WebDriverWait(driver, timeout).until(
					ExpectedConditions.visibilityOfElementLocated(By.cssSelector(childClasses)));

			js.executeScript("arguments[0].click();",webElement);
		}
	}

	@When("^I verify (\\S+) is (.*) and click (\\S+)")
	public void verifyFirstText(String container, String text, String Link) {
		List<WebElement> webElements = getListWebElement(container);
		List<WebElement> numberLink = getListWebElement(Link);

		for (WebElement webElement : webElements) {
			if (webElement.getText().equalsIgnoreCase(text)) {

				JavascriptExecutor js = (JavascriptExecutor) driver;
				js.executeScript("arguments[0].click();",numberLink.get(0));
				break;
			}
		}
	}

	@Then("^The (\\S+) in the first (\\S+) is visible$")
	public void verifyElementIsVisible(String childElement, String container) {
		WebElement webElement = getElementInTheContainerByIndex(childElement, container, 0, 0);

		String elementType = typeOfElementTag(webElement);

		if (elementType.equals("id")) {
			webElement = new WebDriverWait(driver, timeout).until(
					ExpectedConditions.visibilityOfElementLocated(
							By.id(getElementInTheContainerByIndex(
									childElement, container, 0, 0).getAttribute("id"))));
		} else {
			String childClasses = "." + getElementInTheContainerByIndex(
					childElement, container, 0, 0).getAttribute("class")
					.replace(" ", ".");

			webElement = new WebDriverWait(driver, timeout).until(ExpectedConditions.visibilityOfElementLocated(
					By.cssSelector(childClasses)));
		}

		Assert.assertTrue(childElement + " is not visible", webElement.isDisplayed());
	}

	@Then("^title should be (.*)$")
	public void verifyTitle(String pageTitle) {
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		try {
			ExpectedCondition<Boolean> pageTitleIsAsExpected = arg0 -> driver.getTitle().equals(pageTitle);
			wait.until(pageTitleIsAsExpected);
		} catch (TimeoutException TexMsg){
			Assert.assertFalse("Title is not " + pageTitle + TexMsg.getMessage(),true);
		}
	}

	@Then("^The (\\S+) element is disabled$")
	public void isButtonDisabled(String button) {
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		WebElement element = pageObjectUtility.findElementInPage(button, currentPage);
		if (isInternalAdmin == true) {
			wait.until(ExpectedConditions.attributeContains(element, "disabled", ""));
		}
		else {
			wait.until(ExpectedConditions.attributeContains(element, "disabled", "true"));
		}
		Assert.assertFalse( button +" is enabled",element.isEnabled());
	}

	@Then("^The (\\S+) element is enabled$")
	public void isButtonEnabled(String button) {
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		WebElement element = pageObjectUtility.findElementInPage(button, currentPage);
		wait.until(ExpectedConditions.visibilityOf(element));
		wait.until(ExpectedConditions.elementToBeClickable(element));
		try {
			Assert.assertTrue(button + " is disabled",element.isEnabled());
		} catch(StaleElementReferenceException e) {
			Assert.assertTrue(button + " is disabled",element.isEnabled());
		}
	}

	@Then("^The (\\S+) in the (\\S+) component is highlighted")
	public void isElementActive(String element, String component) {
		WebElement webElement = pageObjectUtility.findElementInComponent(element, component);
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		wait.until(ExpectedConditions.attributeContains(webElement, "class", "active"));
		Assert.assertTrue(element + " in the Component " + component + " is not enabled", webElement.isEnabled());
	}

	@Then("^The (\\S+) in the (\\S+) component is not highlighted")
	public void isElementNotActive(String element, String component) {
		WebElement webElement = pageObjectUtility.findElementInComponent(element, component);
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		wait.until(ExpectedConditions.not(ExpectedConditions.attributeContains(webElement, "class", "active")));
		Assert.assertTrue(element +" in the Component " + component + " is not enabled", webElement.isEnabled());
	}

	@Then("^The (\\S+) is not fixed to page")
	public void isElementFixed(String element) {
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		wait.until(ExpectedConditions.not(ExpectedConditions.attributeContains(webElement, "properties", "fixed")));
		Assert.assertTrue(element + " is not enabled", webElement.isEnabled());
	}

	@Then("^the (\\S+) is selected$")
	public void isElementSelected(String elementIdentifier) {
		WebElement element = pageObjectUtility.findElementInPage(elementIdentifier, currentPage);
		Assert.assertTrue(elementIdentifier + " is not selected", element.isSelected());
	}
	@Then("^the (\\S+) is not selected$")
	public void isElementNotSelected(String elementIdentifier) {
		WebElement element = pageObjectUtility.findElementInPage(elementIdentifier, currentPage);
		Assert.assertFalse(elementIdentifier + " is selected",element.isSelected());
	}

	@Then("^I wait for the (\\S+) to be selected$")
	public void waitForElementToBeSelected(String elementIdentifier) {
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		WebElement element = pageObjectUtility.findElementInPage(elementIdentifier, currentPage);
		wait.until(ExpectedConditions.elementToBeSelected(element));
	}

	@Then("^I should be on the (\\S+) page$")
	public void verifyPage(String page) {
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		String expectedPage = pageObjectUtility.getPageUrl(page);
		wait.until(ExpectedConditions.urlContains(expectedPage));
		Assert.assertTrue("User is not on the " + page, driver.getCurrentUrl().toLowerCase().contains(expectedPage.toLowerCase()));
		currentPage = page;
	}

	@When("^I refresh the page$")
	public void refreshPage() {
		driver.navigate().refresh();
	}

	@Then("^The exact text in (\\S+) should be (.*)$")
	public void verifyText(String element, String expectedValue) {
		verifyElementIsVisible(element);
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);

		WebDriverWait wait = new WebDriverWait(driver,5);
		wait.until(ExpectedConditions.textToBePresentInElement(webElement, expectedValue));

		String actualValue = webElement.getText();
		Assert.assertEquals(element + " does not contain the exact text " + expectedValue, expectedValue, actualValue);
	}

	@Then("^The exact text in (\\S+) from the (\\S+) component should be (.*)$")
	public void verifyText(String element, String component, String expectedValue) {
		WebElement webElement = pageObjectUtility.findElementInComponent(element, component);
		String actualValue = webElement.getText();
		if (actualValue.equals("")) {
			actualValue = webElement.getAttribute("value");
		}
		Assert.assertEquals(element + " from the " + component + " does not contain " + expectedValue, expectedValue, actualValue);
	}

	@Then("^The exact text in (\\S+) field should be (.*)$")
	public void verifyTextInField(String element, String expectedValue) {
		new WebDriverWait(driver, timeout).until(
				webDriver -> ((JavascriptExecutor) webDriver).executeScript("return document.readyState").equals("complete"));
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);
		verifyElementIsVisible(element);
		String actualValue = webElement.getAttribute("value");
		Assert.assertEquals(element + " does not contain " + expectedValue, expectedValue, actualValue);
	}

	@Then("^I validate (.*) text is present in all the (\\S+) list elements$")
	public void validateTextInContainer(String text, String element){
		List<WebElement> textToValidate = pageObjectUtility.findElementsInPage(element, currentPage);
		for (WebElement webElement : textToValidate) {
			String actualText = webElement.getText();
			Assert.assertEquals(text +"is not equal to" + element, actualText, text);
		}
	}

	@Then("^I extract text from (\\S+) field$")
	public void extractValue(String element) {
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);
		verifyElementIsVisible(element);
		textToBeVerified = webElement.getText();
		Assert.assertNotNull("text to be verified is null",textToBeVerified);
	}

	@Then("^The exact text in (\\S+) in the first (\\S+) should be (.*)$")
	public void verifyTextInContainer(String childElement, String container, String expectedValue) {
		WebElement webElement = getElementInTheContainerByIndex(childElement, container, 0, 0);
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		wait.until(ExpectedConditions.visibilityOf(webElement));
		String actualValue = webElement.getText();
		Assert.assertEquals(childElement + " in the first " + container + " does not contain " + expectedValue, expectedValue, actualValue);
	}

	@Then("^The exact text in (\\S+) list should be$")
	public void verifyListofTextInContainer(String childElement, List<String> expectedValue) {
		List<WebElement> childElements = pageObjectUtility.findElementsInPage(childElement, currentPage);
		int i=0;
		for(String value: expectedValue){
			WebElement webElement = childElements.get(i);
			String actualValue = webElement.getText();
			Assert.assertEquals(childElement + " does not contain " + expectedValue, value, actualValue);
			i++;
		}
	}

	//Added for ED-27647
	@Then("^The (\\S+) items on (\\S+) element are visible$")
	public void verifyElementByIdIsPresent(int itemNumber, String element) {
		int maxTaskItems = itemNumber;
		for (int i = 0; i < maxTaskItems; i++) {
			WebDriverWait wait = new WebDriverWait(driver, timeout/maxTaskItems);
			WebElement webElement = wait.until(ExpectedConditions.presenceOfElementLocated(By.id(element + "-" + i)));
			Assert.assertTrue(itemNumber + " items on " + element + " are not visible", webElement.isDisplayed());
		}
	}

	//Added for ED-27647, to do: move into the InternalAdminHome class
	@Then("^The page (\\S+) navigation is (\\S+)")
	public void verifyPagination(String pageNumber, String pageNavigationDisplay) {
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		WebElement webElement = wait.until(ExpectedConditions.presenceOfElementLocated(By.
				xpath(derivePaginationXpath(pageNumber,pageNavigationDisplay))));
		Assert.assertTrue(webElement.isDisplayed());
	}

	//Added for ED-27647, to do: move into the InternalAdminHome class
	@Then("^I click on the page (\\S+) navigation (\\S+) link$")
	public void clickOnTheXpathElement(String pageNumber, String pageNavigationDisplay) {
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		WebElement webElement = wait.until(ExpectedConditions.presenceOfElementLocated(By.
				xpath(derivePaginationXpath(pageNumber,pageNavigationDisplay))));
		webElement.click();
	}

	@Then("^I wait for and click on the (\\S+) element$")
	public void WaitAndClickOnTheElement(String methodName) {
		InternalAdminHome page = PageFactory.initElements(driver, InternalAdminHome.class);
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		try {
			Method methodNameInstance = page.getClass().getMethod(methodName);
			WebElement webElement = wait.until(ExpectedConditions.
					elementToBeClickable((WebElement) methodNameInstance.invoke(page)));
			webElement.click();
		} catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
			System.out.println(e);
			Assert.fail();
		}
	}

    @Then("^The (\\S+) is visible$")
    public void verifyElementIsVisible(String element) {
        if (isInternalAdmin == true) {
            new WebDriverWait(driver, timeout).until(
                    webDriver -> ((JavascriptExecutor) webDriver).executeScript("return document.readyState").equals("complete"));
            WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);
            Assert.assertTrue(element + " is not visible", webElement.isDisplayed());
        } else {
            WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);
            WebDriverWait wait = new WebDriverWait(driver, timeout);
            wait.until(ExpectedConditions.visibilityOf(webElement));
            Assert.assertTrue(element + " is not visible", webElement.isDisplayed());
        }
    }

	@Then("^The (\\S+) (\\S+) elements contain partial text (.*)$")
	public void verifyHeaderElementIsVisible(String firstParentElement, String secondParentElement, String partialText) {
		WebElement webElement = driver.findElement(By.xpath(String.format(
				"//%s/%s[starts-with(text(),'%s')]", firstParentElement, secondParentElement, partialText)));
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		wait.until(ExpectedConditions.visibilityOf(webElement));
		Assert.assertTrue(firstParentElement + ", " + secondParentElement + " does not contain partial text " + partialText, webElement.isDisplayed());
	}

	@Then("^The (\\S+) is not visible$")
	public void verifyElementIsNotVisible(String element) {
		new WebDriverWait(driver, timeout).until(
				webDriver -> ((JavascriptExecutor) webDriver).executeScript("return document.readyState").equals("complete"));
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);
		try {
			Assert.assertFalse(element + " is visible",webElement.isDisplayed());
		} catch (Exception ex) {
			// Catch any stale element reference errors
		}
	}

	@Then("^The (\\S+) in the (\\S+) component is not visible")
	public void verifyElementInComponentNotVisible(String element, String component) {
		WebElement webElement = pageObjectUtility.findElementInComponent(element, component);
		try {
			Assert.assertFalse(element + " is visible in " + component, webElement.isDisplayed());
		} catch (Exception ex) {
			// Catch any stale element reference errors
		}
	}

	@Then("^Text in (\\S+) field is present$")
	public void verifyTextInElement(String element) {
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);
		Assert.assertFalse("WebElement unexpectedly contains no text", webElement.getText().isEmpty());
	}

	@Then("^Text in (\\S+) field is not present$")
	public void verifyTextIsNotInElement(String element) {
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);
		Assert.assertTrue("WebElement unexpectedly contains text", webElement.getText().isEmpty());
	}

	@Then("^The (\\S+) element is present$")
	public void verifyElementIsPresent(String element) {
		 WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);
		 Assert.assertNotNull(element + " is not present", webElement.getTagName());
	}

	@Then("^The (\\S+) in the (\\S+) component is visible")
	public void verifyElementInComponentIsVisible(String element, String component) {
		WebElement webElement = pageObjectUtility.findElementInComponent(element, component);
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		wait.until(ExpectedConditions.visibilityOf(webElement));
		Assert.assertNotNull(element + " in the " + component + " is not visible", webElement);
	}

	@Then("^I wait until the (\\S+) is not visible")
	public void waitForElementNotVisible(String element) {

		String elementIdentifier = pageObjectUtility.findIdentifierInPom(element, currentPage);

		WebDriverWait wait = new WebDriverWait(driver, timeout);

		if (elementIdentifier.contains("id: ")) {
            String[] id = elementIdentifier.split("id: ");

			wait.until(ExpectedConditions.invisibilityOfElementLocated(By.id(id[1])));
		}
		else if (elementIdentifier.contains("class name: ")){
            String[] className = elementIdentifier.split("class name: ");
			wait.until(ExpectedConditions.invisibilityOfElementLocated(By.className(className[1])));
		}
	}

	@Then("^I wait until the (\\S+) in the (\\S+) component is not visible")
	public void waitForElementNotVisibleInComponent(String element, String component) {

		String elementIdentifier = pageObjectUtility.findIdentifierInComponentPom(element, component);

		WebDriverWait wait = new WebDriverWait(driver, 20);

		if (elementIdentifier.contains("id: ")) {
			String[] id = elementIdentifier.split("id: ");
			wait.until(ExpectedConditions.invisibilityOfElementLocated(By.id(id[1])));
		}
		else if (elementIdentifier.contains("class name: ")){
			String[] className = elementIdentifier.split("class name: ");
			wait.until(ExpectedConditions.invisibilityOfElementLocated(By.className(className[1])));
		}
	}

	@Then("^Text in (\\S+) in the (\\S+) component is present$")
	public void verifyTextIsPresent(String element, String component) {
		WebElement webElement = pageObjectUtility.findElementInComponent(element, component);
		textLengthInElement(webElement);
	}

	@Then("^I should see (.*) text in (\\S+) field$")
	public void errorText(String expectedText, String element) {
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);
		waitForElement(webElement);
		actualText = webElement.getText().replace("\n", " ");

		if (expectedText.equalsIgnoreCase("masked")) {
			currentLoanNumber = currentLoanNumber.substring(2);
			String maskedNumber = "******" + currentLoanNumber.substring(6);

			Assert.assertEquals(maskedNumber + " does not contain the text " + actualText, maskedNumber, actualText);
		}
		else if (expectedText.toLowerCase().contains("extracted")) {
			Assert.assertTrue(element + " does not contain the text " + expectedText, textToBeVerified.contains(actualText));
		}
		else {
			Assert.assertTrue(element + " does not contain the text " + expectedText, actualText.contains(expectedText));
		}
	}

	@Then("^I should see (.*) text in one of the (\\S+) fields$")
	public void verifyTextIsPresentInMultipleElements(String expectedText, String element) {
		if(expectedText.toLowerCase().contains("random")) {
			WebElement webElement = findElementByText(randomNumber, element);
			Assert.assertNotNull(webElement);
		}
		else {
			WebElement webElement = findElementByText(expectedText, element);
			Assert.assertNotNull(webElement);
		}
	}

	@Then("^I click (.*) text in one of the (\\S+) fields$")
	public void clickTextFromMultipleElements(String expectedText, String element) {
		WebElement webElement = findElementByText(expectedText, element);

		webElement.click();
	}

	@Then("^I should not see (.*) text in one of the (\\S+) fields$")
	public void verifyTextIsNotPresentInMultipleElements(String expectedText, String element) {
		List<WebElement> webElements = pageObjectUtility.findElementsInPage(element, currentPage);

		for (WebElement webElement : webElements) {
			waitForElement(webElement);
			actualText = webElement.getText();
			Assert.assertFalse(expectedText + " is present in " + element, actualText.contains(expectedText));
		}
	}

    @Then("^I should not see (.*) text in first field of the (\\S+) fields$")
    public void verifyTextIsNotPresentInFirstElementOfTheList(String expectedText, String element) {
        List<WebElement> webElements = pageObjectUtility.findElementsInPage(element, currentPage);
        actualText = webElements.get(0).getText().replace("\n", " ");
        Assert.assertFalse("actual text is ::"+actualText,actualText.contains(expectedText));
    }

	@Then("^I should see any of the below text is displayed in the (\\S+) fields$")
	public void verifyEitherOneOfTheTextIsPresentInMultipleDisplayedElements(String childElement, List<String> expectedValue) {
		List<WebElement> childElements = pageObjectUtility.findElementsInPage(childElement, currentPage);

		for (WebElement element : childElements) {
			boolean isPresent = false;
			String text = element.getText();
			if(text!= null && !text.isEmpty()){
				for (String val : expectedValue) {
					if (text.contains(val)) {
						isPresent = true;
					}
				}
				Assert.assertTrue("Expected Text is not displayed in " + childElement, isPresent);
			}
		}
	}

	//String order should be Ascending or Descending
	@Then("^I verify sorting worked for (\\S+) according to (\\S+) order$")
	public void sortingAccordingToOrder(String element, String order) {
		List<WebElement> webElements = pageObjectUtility.findElementsInPage(element, currentPage);
		List<String> actualList = new ArrayList<>();
		Boolean elementsOrderedCorrectly = false;

		for (WebElement webElement : webElements) {
			JavascriptExecutor js = (JavascriptExecutor) driver;
			String value = (String) js.executeScript("return arguments[0].innerText;",webElement);
			actualList.add(value);
		}

		if(order.equalsIgnoreCase("Descending")) {
			elementsOrderedCorrectly=checkListIsDescending(actualList);
		}
		else if(order.equalsIgnoreCase("Ascending")) {
			elementsOrderedCorrectly=checkListIsAscending(actualList);
		}
		Assert.assertTrue("Sorting Failed as elementsOrderedCorrectly variable returned :"+elementsOrderedCorrectly+"", elementsOrderedCorrectly);
	}

	@When("^I upload (.*) file using the (\\S+) component$")
	public void uploadDocument(String fileName, String fileUploadComponent) {
		fileUpload(fileName, fileUploadComponent);
	}

	@When("^I fillout specified text fields with the following text$")
	public void iFilloutTextFields(DataTable table) {
		Map<String, String> dataMap = table.asMap(String.class, String.class);

		for( String key : dataMap.keySet())
		{
			String value = dataMap.get(key);
			enterTextInField(value, key);
		}
	}

	@When("^I click the following elements$")
	public void iClickElements(List<String> buttonsToClick){
		for( String buttonID :buttonsToClick)
		{
			clickElement(buttonID);
		}
	}

	@When("^I close the current tab$")
	public void closeCurrentTab(){
		driver.close();
	}

	@When("^I click the following elements in a component$")
	public void iClickElementsInComponent(List<String> buttonsToClick){
		for (int i = 0; i < buttonsToClick.size(); i++) {
			if (i % 2 == 0) {
				clickElementInComponent(buttonsToClick.get(i), buttonsToClick.get(i + 1));
			}
		}
	}

	@Then("^I verify the text below is present on the page$")
	public void iVerifyText(DataTable table) {
		Map<String, String> dataMap = table.asMap(String.class, String.class);

		for( String key : dataMap.keySet())
		{
			String value = dataMap.get(key);
			verifyText(key, value);
		}
	}

	@When("^I select specified text from dropdown$")
	public void iSelectFromDropdown(DataTable table) {
		Map<String, String> dataMap = table.asMap(String.class, String.class);
		for( String key : dataMap.keySet())
		{
			String value = dataMap.get(key);
			selectFromDropdown(value,key);
		}
	}

	@When("^I switch to second tab$")
	public void switchToChildTab(){
		for (String handle1 : driver.getWindowHandles())
		{
			driver.switchTo().window(handle1);
		}
	}

	@Then("^I wait (\\S+) milliseconds for an element$")
	public void waitSpecificAmountOfTime(int milliseconds) throws InterruptedException {
		Thread.sleep(milliseconds);
	}

	@Then("^I verify dropDown (.*) should contain (.*) elements of list (.*) with following text$")
	public void iVerifyListElements(String dropDown, int total, String list, List<String> dropDownText) {
		WebElement dropDownElement= pageObjectUtility.findElementInPage(dropDown, currentPage);
		WebElement dropDownButton = new WebDriverWait(driver, timeout).until(
				ExpectedConditions.elementToBeClickable(
						By.id(dropDownElement.findElement(By.tagName("button"))
								.getAttribute("id"))));
		dropDownButton.click();
		validateNumberOfElementsOnPage(list,total);
		for(String text :dropDownText)	{
			visibilityOfElementWithInContainer(dropDown,text);
		}
		dropDownButton.click();
	}

	@Then("^The (.*) should contain (.*) lines of following text$")
	public void verifyTextInEachLine(String element, int totalLines,List<String> LineText) {
		WebElement textToBeVerified= pageObjectUtility.findElementInPage(element, currentPage);
		JavascriptExecutor js = (JavascriptExecutor) driver;
		Object actualLinesObj = js.executeScript("return arguments[0].innerHTML.split('\\n');", textToBeVerified);
		ArrayList actualLinesList =  (ArrayList)actualLinesObj;
		Assert.assertEquals("Number of lines is not equal to "+ totalLines, totalLines, actualLinesList.size());
		for (int i = 0; i < LineText.size(); i++) {
			Assert.assertEquals("Line Text "+ actualLinesList.get(i)+" is not as expected "+LineText.get(i), LineText.get(i), actualLinesList.get(i));
		}
	}

	@When("^I scroll to (\\S+) element$")
	public void scrollToElement(String element)
	{
		WebElement buttonElement = pageObjectUtility.findElementInPage(element, currentPage);
		JavascriptExecutor js = (JavascriptExecutor) driver;
		js.executeScript("arguments[0].scrollIntoView();",buttonElement);
		js.executeScript("window.scrollBy(0,-250)","");
	}

	@When("^I scroll to end of the page$")
	public void scrollToEndOfThePage()
	{
		JavascriptExecutor js = (JavascriptExecutor) driver;
		js.executeScript("window.scrollTo(0,document.body.scrollHeight)");
	}

	@When("^I navigate to this (\\S+)$")
	public void navigateToUrl(String url) {
		driver.get(url);
	}

	@When("^I change focus to tab (\\S+)$")
	public void changeTabs(String tab) {
		ArrayList<String> tabs = new ArrayList<> (driver.getWindowHandles());
		int tabToSwitchTo = Integer.parseInt(tab);
		driver.switchTo().window(tabs.get(tabToSwitchTo));
	}

	@Then("^The url should be (\\S+)$")
	public void verifyUrl(String expectedUrl) {
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		wait.until(ExpectedConditions.urlContains(expectedUrl));
		String currentUrl = driver.getCurrentUrl();
		Assert.assertTrue("Current Url is not the same as expected " + expectedUrl, currentUrl.contains(expectedUrl));
	}

	@Then("^The current loan (\\S+) is present on the page")
	public void verifyLoanNumber(String loanNumberIdentifier) {
		Boolean loanNumberFound = false;

		List<WebElement> loanNumbers = pageObjectUtility.findElementsInPage(loanNumberIdentifier, currentPage);

		for( WebElement loanNumber : loanNumbers)
		{
			// Retrieve the last 4 digits
			String newLoanNumLast4 = currentLoanNumber.substring(currentLoanNumber.length() - 4);
			String actualLoanNumber = loanNumber.getText();
			String dashboardLoanNumber = actualLoanNumber.substring(actualLoanNumber.length() - 4);
			// Compare last 4 digits visible on the screen with last 4 digits from test input
			if (dashboardLoanNumber.equals(newLoanNumLast4)){
				loanNumberFound = true;
				break;
			}
		}
		Assert.assertTrue("Loan number not found on page", loanNumberFound);
	}

	@Then("^The current loan (\\S+) is not present on the page")
	public void verifyLoanNumbers(String loanNumbersIdentifier) {
		Boolean loanNumberNotFound = false;

		refreshPage();

		List<WebElement> loanNumbers = pageObjectUtility.findElementsInPage(loanNumbersIdentifier, currentPage);

		for( WebElement loanNumber : loanNumbers)
		{
			String dashboardLoanNumber = loanNumber.getText();
			if(dashboardLoanNumber.equals(currentLoanNumber)) {
				loanNumberNotFound = true;
				break;
			}
		}
		Assert.assertFalse("Loan number found on page", loanNumberNotFound);
	}

	//action string should be "Edit" or "Start Paying This Loan"
	@When("^I click (.*) in actionMenu of new inactive loan")
	public void inactiveLoanActionMenu(String action){
		String loanCardPageObject = "loanCard";
		String loanNumberClassName = "other-loan-number";
		String loanTileMenuClassName = "fa-ellipsis-h";
		Boolean newLoanFound = false;
		String actionToBePerformed =null;

		if (action.equalsIgnoreCase("Edit")){
			actionToBePerformed = "navigateLoanActionBtn";
		}
		else if (action.equalsIgnoreCase("Start Paying This Loan")){
			actionToBePerformed = "startPayingLoanMenuBtn";
		}
		else {
			Assert.assertTrue("Enter a valid action string",false);
		}

		//Find all loan tiles on the page
		List<WebElement> loanTiles = pageObjectUtility.findElementsInPage(loanCardPageObject, currentPage);
		verifyElementIsVisible("newStudentLoanNow");

		//If loan not present, pagination is happening
		try {
			verifyLoanNumber("loanNumber");
		} catch (AssertionError a) {
			clickLastPageOfPagination();
		}

		// Search through each loan tile for the one that contains the new loan
		for (WebElement loanTile : loanTiles) {
			WebElement loanElement = new WebDriverWait(driver, timeout)
					.until(ExpectedConditions
							.visibilityOfElementLocated(By.className(loanNumberClassName)));

			//If new loan found, access the edit feature
			String loanNumber = loanElement.getText().substring(loanElement.getText().length() - 4);
			if (currentLoanNumber.contains(loanNumber)) {
				WebElement actionMenu = loanTile.findElement(By.className(loanTileMenuClassName));

				actionMenu.click();
				WebElement editLoanMenuBtn = loanTile.findElement(By.id(actionToBePerformed));
				editLoanMenuBtn.click();
				newLoanFound = true;
				break;
			}
		}
		Assert.assertTrue("New loan not found on dashboard", newLoanFound);
	}

	@Then("^The new loan ID is deleted from the dashboard")
	public void deleteNewLoan() {
		String loanNumberClassName = "other-loan-number";
		String loanTileMenuClassName = "fa-ellipsis-h";
		String loanTileDeleteId = "deleteLoanMenuBtn";
		String loanCardPageObject = "loanCard";
		Boolean paginationPresent = false;
		Boolean newLoanFound = false;

		//Find all loan tiles on the page
		List<WebElement> loanTiles = pageObjectUtility.findElementsInPage(loanCardPageObject, currentPage);

		verifyElementIsVisible("newStudentLoanNow");

		//If loan not present, pagination is happening
		try {
			verifyLoanNumber("loanNumber");
		} catch (AssertionError a) {
			paginationPresent = true;
			clickLastPageOfPagination();
		}

		//Search through each loan tile for the one that contains the new loan
		for (WebElement loanTile : loanTiles) {
				WebElement loanNumber = new WebDriverWait(driver, timeout)
						.until(ExpectedConditions
								.visibilityOfElementLocated(By.className(loanNumberClassName)));

			//If new loan found, access the delete feature
			String newLoanNumLast4 = currentLoanNumber.substring(currentLoanNumber.length() - 4);
			String actualLoanNumber = loanNumber.getText();
			String dashboardLoanNumber = actualLoanNumber.substring(actualLoanNumber.length() - 4);
			// Compare last 4 digits visible on the screen with last 4 digits from test input
			if (dashboardLoanNumber.equals(newLoanNumLast4)) {
				WebElement actionMenu = loanTile.findElement(By.className(loanTileMenuClassName));

				actionMenu.click();

				WebElement deleteLoanMenuBtn = loanTile.findElement(By.id(loanTileDeleteId));
				deleteLoanMenuBtn.click();

				verifyPage("dashboard");

				clickElement("lrpDeleteLoanModalConfirmButton");

				newLoanFound = true;

				break;
			}
		}

		//Verify that the loan was actually deleted
		verifyElementIsVisible("newStudentLoanNow");

		if (paginationPresent) {
			waitForElementNotVisible("modalBackdrop");
			clickLastPageOfPagination();
		}

		Assert.assertTrue("New loan not found on dashboard", newLoanFound);
		verifyLoanNumbers("loanNumber");
	}

	@Then("I verify current loan is displayed on top of other inactive loans (.*)")
	public void verifyInActiveLoanPosition(String loanNumbers) {
		List<WebElement> inActiveLoanNumbers = pageObjectUtility.findElementsInPage(loanNumbers, currentPage);
		String	loanNumberAtPositionOne = inActiveLoanNumbers.get(0).getText();
		loanNumberAtPositionOne = loanNumberAtPositionOne.substring(6, 10);
		Assert.assertTrue("Newly Created loan is not on Top",currentLoanNumber.contains(loanNumberAtPositionOne));
	}

	@Then("^I verify the number of (\\S+) before deletion$")
	public void elementCountBeforeDeletion(String elements) {
		//Find all elements on the Application page
		List<WebElement> listBeforeDeletion = pageObjectUtility.findElementsInPage(elements, currentPage);
		beforeDeletion=listBeforeDeletion.size();
	}

	@Then("^I verify the number of (\\S+) after deletion$")
	public void elementCountAfterDeletion(String elements) {
		List<WebElement> listAfterDeletion = pageObjectUtility.findElementsInPage(elements, currentPage);
		afterDeletion=listAfterDeletion.size();
		Assert.assertTrue("Number of " + elements + " is not less after Deletion", afterDeletion < beforeDeletion);
	}

	@Then("^The current date is present in (\\S+) field with format (.*)")
	public void verifyCurrentDateInField(String element, String ExpectedDateFormat) throws ParseException {
		new WebDriverWait(driver, timeout).until(
				webDriver -> ((JavascriptExecutor) webDriver).executeScript("return document.readyState").equals("complete"));
		WebElement dateElement = pageObjectUtility.findElementInPage(element, currentPage);
		String dateOnPage = dateElement.getText();

		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat(ExpectedDateFormat);
		String currentDate = dateFormat.format(date);
		Date ActualDateOnPage = dateFormat.parse(dateOnPage);
		String currentDateOnPage = dateFormat.format(ActualDateOnPage);

		Assert.assertTrue("Date on page doesn't match current date",
				currentDate.equalsIgnoreCase(currentDateOnPage));
	}

	@Then("^The current time is present in (\\S+) field")
	public void verifyCurrentTimeInField(String element) {
		new WebDriverWait(driver, timeout).until(
				webDriver -> ((JavascriptExecutor) webDriver).executeScript("return document.readyState").equals("complete"));
		WebElement timeElement = pageObjectUtility.findElementInPage(element, currentPage);
		String dateOnPage = timeElement.getText();

		Date date = new Date();
		SimpleDateFormat timeFormatFirstVariation = new SimpleDateFormat("h:mm aa");
		String currentTime = formatAsMountainTime(date, timeFormatFirstVariation);

		SimpleDateFormat timeFormatSecondVariation = new SimpleDateFormat("HH:mm:ss aa zz");
		String currTime = formatAsMountainTime(date, timeFormatSecondVariation);

		Assert.assertTrue("Time on page doesn't match current time",
				dateOnPage.equals(currentTime) || dateOnPage.equals(currTime));
	}

	@Then("^The (\\S+) in the (\\S+) component is disabled")
	public void isElementDisabedInComponent(String element, String component){
		WebElement webElement = pageObjectUtility.findElementInComponent(element, component);
		Assert.assertFalse(element + " is enabled in " + component, webElement.isEnabled());
	}

	@Then("^The (\\S+) in the (\\S+) component is enabled")
	public void isElementEnabledInComponent(String element, String component) {
		WebElement webElement = pageObjectUtility.findElementInComponent(element, component);
		Assert.assertTrue(element + " in the " + component + " is not enabled", webElement.isEnabled());
	}

	@When("^I click on application number where application status is (.*)$")
	public void clickOnAppNumberBasedOnAppStatus(String AppStatus){
		List<WebElement> ApplicationsList = driver.findElements(By.xpath("//div/div[contains(text(),'"+AppStatus+"')]/following-sibling::div/button"));
		JavascriptExecutor js = (JavascriptExecutor) driver;
		js.executeScript("arguments[0].click();",ApplicationsList.get(0));
	}

	@Then("^I confirm there is a column where the title is (.*)$")
	public void confirmTableColumnHeaderBasedOnColumnTitle(String columnTitle){
		WebElement columnTitlePosition = driver.findElement(By.xpath("//th/*[contains(text(),'" +columnTitle+ "')]"));

		Assert.assertTrue(""+columnTitle+" is not visible", columnTitlePosition.isDisplayed());
	}

	@Then("^I verify number of (.*) on the page should be (.*)$")
	public void validateNumberOfElementsOnPage(String elements, int Total){
		List<WebElement> totalNumOfElements = pageObjectUtility.findElementsInPage(elements, currentPage);
		Assert.assertEquals("Number of " + elements + " on the page are not " + Total, Total,totalNumOfElements.size());
	}

	@When("^I hover over the element (.*)$")
	public void hoverOverTheElement(String element){
		Actions action = new Actions(driver);
		WebElement elementToMove = pageObjectUtility.findElementInPage(element, currentPage);
		action.moveToElement(elementToMove).clickAndHold().build().perform();
	}

	@When("^I hover over (.*) in component (.*)$")
	public void hoverOverElementInComponent(String element, String component){
		WebElement webElement = pageObjectUtility.findElementInComponent(element, component);
		Actions action = new Actions(driver);
		action.moveToElement(webElement).clickAndHold().build().perform();
	}

	@When("^I hover on the element (.*) of the list (.*)$")
	public void hoverOverElementInAList(int index, String element) {
		Actions action = new Actions(driver);
		List<WebElement> elementToMove = pageObjectUtility.findElementsInPage(element, currentPage);
		action.moveToElement(elementToMove.get(index - 1)).perform();
	}

	@When("^I click on the element (.*) of the list (.*)$")
	public void clickNthElementOfTheList(int index, String list) {
		List<WebElement> webElements = pageObjectUtility.findElementsInPage(list, currentPage);
		waitForElement(webElements.get(index - 1));
		webElements.get(index - 1).isEnabled();
		clickOnElementByJsExecutor(webElements.get(index-1));
	}

	@Then("^I validate (.*) text is present in index (.*) of list (\\S+)$")
	public void validateTextInList(String text, int index, String list) {
		if (isInternalAdmin == true) {
			List<WebElement> elementsToValidate = pageObjectUtility.findElementsInPage(list, currentPage);
			String actualTextAtIndex = elementsToValidate.get(index - 1).getText();
			Assert.assertEquals("Can't find the expected text: " + text, text, actualTextAtIndex);
		} else {
			List<WebElement> elementsToValidate = pageObjectUtility.findElementsInPage(list, currentPage);
			String actualTextAtIndex = elementsToValidate.get(index - 1).getText().trim();
			Assert.assertEquals("Can't find the expected text: " + text, text, actualTextAtIndex);
		}
	}

	@Then("^I validate (.*) text is present in index (.*) of list (\\S+) without nested (\\S+) element$")
	public void validateTextInListWithoutChildrenText(String text, int index, String list, String child) {
		List<WebElement> elementsToValidate = pageObjectUtility.findElementsInPage(list, currentPage);
		List<WebElement> elementToIgnore = pageObjectUtility.findElementsInPage(child, currentPage);

		String textToIgnore = elementToIgnore.get(index - 1).getText();
		String actualTextAtIndex = elementsToValidate.get(index - 1).getText().replace(textToIgnore, "").trim();
		Assert.assertEquals("Can't find the expected text :" + text, text, actualTextAtIndex);
	}

	@Then("^I validate (\\S+) attribute contains (\\S+) value in (.*) list at index (.*)")
	public void validateAttributeInList(String attribute, String expectedAttributeValue, String list, int index) {
		List<WebElement> elementsToValidate = pageObjectUtility.findElementsInPage(list, currentPage);
		String actualVal = elementsToValidate.get(index - 1).getAttribute(attribute);
		Assert.assertTrue(attribute + " does not contain the expected value" + expectedAttributeValue + " at the given index ", actualVal.contains(expectedAttributeValue));
	}

	@When("^I verify (.*) contains (.*) text")
	public void visibilityOfElementWithInContainer(String container,String text){
		WebElement referenceElement= pageObjectUtility.findElementInPage(container, currentPage);
		WebElement childElement=referenceElement.findElement(By.xpath(".//*[text()[contains(.,'"+text+"')]]"));
		waitForElement(childElement);
		Assert.assertTrue(""+text+" button is not visible",childElement.isDisplayed());
	}

	@When("^I click on (.*) text in (.*) container")
	public void clickElementWithReferenceToElement(String text,String container){
		WebElement referenceElement= pageObjectUtility.findElementInPage(container, currentPage);
		WebElement childElement=referenceElement.findElement(By.xpath("//*[contains(text(),'"+text+"')]"));
		childElement.click();
	}

	@When("^The (.*) is equal to current loan number")
	public void accountNumbrValidation(String accountNum){
		WebElement accountNumberElement = pageObjectUtility.findElementInPage(accountNum, currentPage);
		String accountNumber = accountNumberElement.getAttribute("value");
		String loanNumber = accountNumber.substring(accountNumber.length() - 4);
		Assert.assertTrue ("account numbers are not equal",currentLoanNumber.contains(loanNumber));
	}

	@Then("^I validate (\\S+) attribute value of (\\S+) is equal to (.*)$")
	public void validateToolTipContent(String attribute, String element, String expectedVal) {
		WebElement elementToValidate = pageObjectUtility.findElementInPage(element, currentPage);
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		ExpectedCondition<Boolean> elementContainsExpectedColor = arg0 -> elementToValidate.getAttribute(attribute).contains(expectedVal);
		wait.until(elementContainsExpectedColor);
		String actualVal = elementToValidate.getAttribute(attribute);
		Assert.assertEquals(attribute + " does not contain the expected value " + expectedVal, expectedVal, actualVal);
	}

	@Then("^I validate (\\S+) attribute value of (\\S+) is not equal to (.*)$")
	public void validateAttributeContentNotPresent(String attribute, String element, String expectedVal) {
		WebElement elementToValidate = pageObjectUtility.findElementInPage(element, currentPage);
		String actualVal = elementToValidate.getAttribute(attribute);
		Assert.assertNotEquals(attribute + " contains the value that is not expected " + expectedVal, expectedVal, actualVal);
	}

	@When("^I click page (.*) on pagination under action needed section$")
	public void pageNavigation(String pageNumber){
		WebElement pageLink = driver.findElement(By.xpath("(//a[contains(.,'"+pageNumber+"')])"));
		pageLink.click();
	}

	@Then("^I should be on page (.*) under action needed$")
	public void navigationCheck(String pageNumber){
		WebElement activePage = driver.findElement(By.xpath("//a[contains(.,'"+pageNumber+"')]/ancestor::li[contains(@class,'active')]"));
		Assert.assertTrue("Active page: " + pageNumber + " is not displayed", activePage.isDisplayed());
	}

	@Then("^I verify cell (.*) of (.*) in table contains (.*)$")
	public void tableRowNavigation(String index, String element, String expectedText ){
		WebElement rowNumber = pageObjectUtility.findElementInPage(element, currentPage);
		WebElement cellPosition = rowNumber.findElement(By.xpath("td["+index+"]"));
		Assert.assertEquals("Expected cell in the table does not contain " + expectedText, expectedText,cellPosition.getText());
	}

	@Then("^I verify (.*) text is not displayed$")
	public void iVerifyTextAbsent(String absentText) {
		Assert.assertFalse(absentText + " is displayed", driver.getPageSource().contains(absentText));
	}

	@Then("^I verify (.*) text is displayed$")
	public void iVerifyTextPresent(String presentText) {
		Assert.assertTrue(presentText + " is not displayed", driver.getPageSource().contains(presentText));
	}

	@When("^I click the link with text (.*)$")
	public void clickOnALinkWithText(String text){
		WebElement link = new WebDriverWait(driver, timeout)
				.until(ExpectedConditions
						.elementToBeClickable(By.linkText(text)));

		clickOnElementByJsExecutor(link);
	}

	@Then("^I verify that href of link with text (.*) should be (.*)$")
	public void verifyHrefAttribute(String text,String expectedURL){
		WebElement link = new WebDriverWait(driver, timeout)
				.until(ExpectedConditions
						.visibilityOfElementLocated(By.linkText(text)));
		Assert.assertEquals("href of the link with text " + text + " is not " + expectedURL, expectedURL, link.getAttribute("href"));
	}

	@Then("^I confirm the href of link with text (.*) should be (.*) then I click$")
	public void verifyHrefAttributeAndClick(String text,String expectedText){
		WebElement link = new WebDriverWait(driver, timeout)
				.until(ExpectedConditions
						.visibilityOfElementLocated(By.partialLinkText(text)));
		String actualURL =  link.getAttribute("href");
		String[] parts = actualURL.split("/");
		int size = parts.length;
		actualText = parts[size - 1];

		Assert.assertEquals("href of the link with text " + text + " is not " + expectedText, expectedText, actualText);
		link.click();
	}

	@Then("^I validate the color of the (.*) using CssProperty:(.*) should be (.*)$")
	public void colorValidation(String element, String propertyName, String expectedColor){
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);

		WebDriverWait wait = new WebDriverWait(driver, timeout);
		ExpectedCondition<Boolean> elementContainsExpectedColor = arg0 -> webElement.getCssValue(propertyName).equals(expectedColor);
		wait.until(elementContainsExpectedColor);

		String actualColor = webElement.getCssValue(propertyName);
		Assert.assertEquals("The color of " + element + " is not " + expectedColor, expectedColor, actualColor);
	}

	@Then("^I verify the color of the (.*) in (.*) component using CssProperty:(.*) should be (.*)$")
	public void colorValidationInComponent(String element,String component, String propertyName, String expectedColor) {
		WebElement webElement = pageObjectUtility.findElementInComponent(element, component);
		WebDriverWait wait = new WebDriverWait(driver, timeout);
		ExpectedCondition<Boolean> elementContainsExpectedColor = arg0 -> webElement.getCssValue(propertyName).equals(expectedColor);
		wait.until(elementContainsExpectedColor);
		String actualColor = webElement.getCssValue(propertyName);
		Assert.assertEquals("The color of " + element + " in the " + component + " is not " + expectedColor, expectedColor, actualColor);
	}

	@Then("^I verify I am on the page (.*) of pagination$")
	public void verifyActivePageOfPagination(String pageNumber){
		WebElement activePage = new WebDriverWait(driver, timeout)
				.until(ExpectedConditions
						.visibilityOfElementLocated(By.xpath("//*[contains(text(),'"+pageNumber+"')]/ancestor::li[contains(@class, 'active')]")));
		activePage.isDisplayed();
	}

	@When("^I navigate to previous page$")
	public void navigateToPreviousPage(){
		driver.navigate().back();
	}

	@When("^I click on (.*) using jsExecutor$")
	public void javascriptExecutorClick(String element){
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);

		verifyElementIsVisible(element);

		clickOnElementByJsExecutor(webElement);
	}

	@When("^I click on the (.*) child element of (.*)$")
	public void clickNthChildElement(int child, String element){
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);
		List<WebElement> childToClick = webElement.findElements(By.xpath("*"));

		childToClick.get(child).click();
	}

	@When("^If button (.*) text is (.*) a click should not land on a BrightHorizons page$")
	public void landingPageBasedOnButtonText(String element, String expectedElementText){
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);
		String elementText = webElement.getText();
		String currentUrl;

		webElement.click();

		if (elementText.equalsIgnoreCase(expectedElementText)) {
			changeTabs("1");
			currentUrl = driver.getCurrentUrl().toLowerCase();
			Assert.assertFalse(currentUrl + " does not contain 'edassist'", currentUrl.contains("edassist"));
		}
		else {
			currentUrl = driver.getCurrentUrl().toLowerCase();
			Assert.assertTrue(currentUrl + " does not contain 'createapplication/contactinformation'",currentUrl.contains("createapplication/contactinformation"));
		}
	}

	@When("^I verify that (.*) contains (.*) of element (.*)$")
	public void clickNthChildElement(String container, int number, String element){
		WebElement containerElement = pageObjectUtility.findElementInPage(container, currentPage);
		EdAccessLearnMore page = PageFactory.initElements(driver, EdAccessLearnMore.class);
		String methodName = "get" + element.substring(0, 1).toUpperCase() + element.substring(1);

				try {
					Method methodNameInstance = page.getClass().getMethod(methodName);
					String webElement = ((WebElement) methodNameInstance.invoke(page)).getAttribute("class");
					List<WebElement> webElements = containerElement.findElements(By.className(webElement));

					Assert.assertTrue(webElements.size() == number);
				} catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
					System.out.println(e);
					Assert.fail();
				}
	}

	@When("^I should not see (.*) text in (.*) element$")
	public void verifyTextNotInElement(String text, String element) {
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);
		String actualText = webElement.getText().replace("\n", " ");

		if (actualText == "") {
			actualText = webElement.getAttribute("value");
		}
		Assert.assertTrue(element + " contains the text " + text, !actualText.contains(text));
	}

	@Then("^I verify that (.*) element is in focus$")
	public void verifyElementFocus(String element) {
		WebElement webElement = pageObjectUtility.findElementInPage(element, currentPage);

		Assert.assertTrue("Expected element is not in focus", webElement.equals(driver.switchTo().activeElement()));
	}

	@Then("^I verify the (\\S+) date/time is in format (.*) with timezone = (\\S+)$")
	public void verifyValidFormat(String element, String dateFormat, String timeZone) {
		new WebDriverWait(driver, timeout).until(
				webDriver -> ((JavascriptExecutor) webDriver).executeScript("return document.readyState").equals("complete"));
		WebElement dateElement = pageObjectUtility.findElementInPage(element, currentPage);

		String dateOnPage = dateElement.getText();
		System.out.println("date on the page " + dateOnPage);

		if(dateOnPage.contains(timeZone) || timeZone.equalsIgnoreCase("N/A")) {
			SimpleDateFormat timeFormat = new SimpleDateFormat(dateFormat);
			timeFormat.setLenient(false);
			try {
				timeFormat.parse(dateOnPage);
			} catch(ParseException e) {
				Assert.assertFalse("Date on page is not formatted correctly",true);
			}
		} else {
			Assert.assertFalse("Timezone is incorrect",true);
		}
	}

	@When("^I set the current ApplicaionID to (\\S+)$")
	public void setCurrentApplicationId(String currentAppId) {
		currentApplication = currentAppId;
	}

	@When("^I click (.*) from the (.*) Card at index (.*)$")
	public void clickElementInHistoryCard(String clickThis, String card, int cardIndex){
		WebElement webElement = getElementInIndexedContainer(clickThis, card, cardIndex);
		String id = webElement.getAttribute("id");

		if (!id.equals("")) {
			webElement = new WebDriverWait(driver, timeout).until(
					ExpectedConditions.visibilityOfElementLocated(
							By.id(getElementInIndexedContainer(
									clickThis, card, cardIndex).getAttribute("id"))));
		} else {
			String childClasses = "." + getElementInIndexedContainer(clickThis, card,cardIndex).getAttribute("class").split(" ");

			webElement = new WebDriverWait(driver, timeout).until(
					ExpectedConditions.visibilityOfElementLocated(By.cssSelector(childClasses)));
		}
		webElement.click();
	}

	private void clickOnElementByJsExecutor(WebElement webElement){
		JavascriptExecutor js = (JavascriptExecutor) driver;
		js.executeScript("arguments[0].click();", webElement);
	}

	public String courseDate(int numDays, String element) {
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date date = new Date();
		Date sessionDate = CommonUtil.addDays(date,numDays);
		numericDate = dateFormat.format(sessionDate);
		dateMap.put(element, numericDate);
		return numericDate;
	}

	private void clickLastPageOfPagination() {
		WebElement pagination;
		try {
			pagination = driver.findElement(By.className("pagination-sm"));
		} catch (Exception e){
			return;
		}

		List<WebElement> lastPage = pagination.findElements(By.className("pagination-page"));
		int size = lastPage.size();
		lastPage.get(size - 1).findElement(By.tagName("a")).click();

	}

	private void clickOnElement(String identifier) {
		WebElement elementToClick = createWebElement(identifier);
		elementToClick.click();
	}

	private WebElement createWebElement (String identifier) {
		WebElement element = pageObjectUtility.findElementInPage(identifier, currentPage);
		String elementType = typeOfElementTag(element);

		WebElement elementToClick;

		if (elementType.equals("id")) {
			elementToClick = new WebDriverWait(driver, timeout)
					.until(ExpectedConditions.visibilityOfElementLocated(
							By.id(pageObjectUtility.findElementInPage(identifier, currentPage)
									.getAttribute("id"))));
		}
		else if (elementType.equals("xpath")) {
			elementToClick = new WebDriverWait(driver, timeout)
					.until(ExpectedConditions.visibilityOf(
							pageObjectUtility.findElementInPage(identifier, currentPage)));
		}
		else {
			String childClasses =  "." + pageObjectUtility
					.findElementInPage(identifier, currentPage)
					.getAttribute("class")
					.replace(" ", ".");

			elementToClick = new WebDriverWait(driver, timeout).until(
					ExpectedConditions.visibilityOfElementLocated(By.cssSelector(childClasses)));
		}

		return elementToClick;
	}

    private void clickOnElementInComponent(String webElement, String component) {
		WebElement elementToClick = createWebElementInComponent(webElement, component);

        elementToClick.click();
    }

	private void clickOnElementInComponentJsExecutor(String webElement, String component) {
		WebElement elementToClick = createWebElementInComponent(webElement, component);

		JavascriptExecutor js = (JavascriptExecutor) driver;
		js.executeScript("arguments[0].click();", elementToClick);
	}

    private WebElement createWebElementInComponent(String locator, String component) {
		WebElement element = pageObjectUtility.findElementInComponent(locator, component);
		String elementType = typeOfElementTag(element);

		WebElement elementToClick;

		if (elementType.equals("id")) {
			elementToClick = new WebDriverWait(driver, timeout).until(
					ExpectedConditions.visibilityOfElementLocated(
							By.id(pageObjectUtility.findElementInComponent(locator, component).getAttribute("id"))));
		}

		else if (elementType.equals("xpath")) {
			elementToClick = pageObjectUtility.findElementInComponent(locator, component);
		}

		else {
			String childClasses =  "." + pageObjectUtility
					.findElementInComponent(locator, component)
					.getAttribute("class")
					.replace(" ", ".");

			elementToClick = new WebDriverWait(driver, timeout).until(
					ExpectedConditions.visibilityOfElementLocated(By.cssSelector(childClasses)));
		}

		return elementToClick;
	}

	private void waitForElement(WebElement element) {
		WebDriverWait wait = new WebDriverWait(driver, timeout);
        try {
            wait.until(ExpectedConditions.visibilityOf(element));
        } catch(StaleElementReferenceException e) {
            wait.until(ExpectedConditions.visibilityOf(element));
        }
	}

	private void clearTextInputElement(WebElement webElement) {
		waitForElement(webElement);
		webElement.clear();
	}

	private void textLengthInElement(WebElement webElement) {
		waitForElement(webElement);
		actualText= webElement.getText();
		int textLength= actualText.length();
		Assert.assertTrue(textLength > 10);
	}

	private void fileUpload(String fileName, String fileUploadElementComponent) {
		WebElement fileElement = pageObjectUtility.findElementInComponent(fileUploadElementComponent, "fileUpload");
		fileElement.sendKeys(fileUploadBaseDir + fileName);
	}

	private String randomAccountNumber() {
		Double value =  Math.random() * 1000000000000L;
		BigDecimal newdec = new BigDecimal(value);

		currentLoanNumber = newdec.toBigInteger().toString();
		randomNumber = currentLoanNumber;

		return currentLoanNumber;
	}

	private WebElement getElementInTheContainerByIndex(String childElement, String container, int childElementIndex, int containerIndex) {
		List<WebElement> containers =  pageObjectUtility.findElementsInPage(container, currentPage);
		String elementIdentifier = pageObjectUtility.findIdentifierInPom(childElement, currentPage);

		if (isInternalAdmin == true) {
			String[] className = elementIdentifier.split("class name: ");
			List<WebElement> childElements = containers.get(containerIndex).findElements(By.className(className[0]));
			return childElements.get(childElementIndex);
		} else {
			if (elementIdentifier.contains("id: ")) {
				String[] id = elementIdentifier.split("id: ");
				List<WebElement> childElements = containers.get(containerIndex).findElements(By.id(id[1]));
				return childElements.get(childElementIndex);
			} else {
				String[] className = elementIdentifier.split("class name: ");
				List<WebElement> childElements = containers.get(containerIndex).findElements(By.className(className[1]));
				return childElements.get(childElementIndex);
			}
		}
	}

	private List<WebElement> getListWebElement(String container){
		return pageObjectUtility.findElementsInPage(container, currentPage);
	}

	private String typeOfElementTag(WebElement webElement) {
		String id = webElement.getAttribute("id");

		if (!id.equals("")) {
			return "id";
		}
		else if (webElement.toString().contains("xpath")) {
			return "xpath";
		}

		return "class";
    }

    private void deleteDirectory() {
		try{
			File downloadFileDir = new File("src/resources/tempDownloadFiles");
			FileUtils.deleteDirectory(downloadFileDir);
		} catch (IOException e) {
		}
	}

	private WebElement findElementByText(String expectedText, String element) {
		List<WebElement> webElements = pageObjectUtility.findElementsInPage(element, currentPage);

		for (WebElement webElement : webElements) {
			waitForElement(webElement);
			JavascriptExecutor js = (JavascriptExecutor) driver;
			actualText = (String) js.executeScript("return arguments[0].innerText;",webElement);
			if(actualText.contains(expectedText)) {
				return webElement;
			}
		}
		return null;
	}

	private Boolean checkListIsDescending(List<String> sortedList) {
		boolean isListDescending = false;
		for(int i=1; i < sortedList.size(); i++) {
			if (sortedList.get(i - 1).compareTo(sortedList.get(i)) >= 0) {
				isListDescending = true;
			}
			else {
				isListDescending = false;
				break;
			}
		}
		return isListDescending;
	}

	private Boolean checkListIsAscending(List<String> sortedList) {
		boolean isListAscending = false;
		for(int i=1; i < sortedList.size(); i++) {
			if (sortedList.get(i - 1).compareTo(sortedList.get(i)) <= 0) {
				isListAscending = true;
			}
			else {
				isListAscending = false;
				break;
			}
		}
		return isListAscending;
	}

	//Added for ED-27647, to do: move into the InternalAdminHome class
	private String derivePaginationXpath (String pageNumber, String pageNavigationDisplay) {
		String xpathElement;
		if (pageNavigationDisplay.equals("selected")) {
			xpathElement = "selected";
		} else {
			xpathElement = "";
		}
		return String.format("//li[contains(@class,'%s') and contains(text(),'%s')]", xpathElement, pageNumber);
	}

	public String getCurrentApplication() {
		return currentApplication;
	}

	public String getEnv() {
		return env;
	}

	public void setCurrentApplication(String currentApplication) {
		this.currentApplication = currentApplication;
	}

	public WebDriver getDriver() {
		return driver;
	}

	public String getCurrentClient() {
		return currentClient;
	}

	private String formatAsMountainTime(Date theDate, SimpleDateFormat timeFormat) {
		timeFormat.setTimeZone(TimeZone.getTimeZone("US/Mountain"));
		String timeOutputString = timeFormat.format(theDate) + " MT";
		return timeOutputString;
	}

	public String getCurrentAppNumber() {
		return currentAppNumber;
	}

	public void setCurrentApplicationNumber(String currentAppNumber) {
		this.currentAppNumber = currentAppNumber;
	}

	private WebElement getElementInIndexedContainer(String childElement, String container, int containerIndex) {
		List<WebElement> containers =  pageObjectUtility.findElementsInPage(container, currentPage);
		String elementIdentifier = pageObjectUtility.findIdentifierInPom(childElement, currentPage);

		if (elementIdentifier.contains("id: ")) {
			String[] id = elementIdentifier.split("id: ");
			WebElement elementToFind = containers.get(containerIndex).findElement(By.id(String.valueOf(id)));
			return elementToFind;
		} else {
			String[] className = elementIdentifier.split("class name: ");
			WebElement elementToFind = containers.get(containerIndex).findElement(By.className(String.valueOf(className)));
			return elementToFind;
		}
	}
}
