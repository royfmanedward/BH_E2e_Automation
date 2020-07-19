package utility;

import com.google.common.base.CaseFormat;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Method;
import java.util.List;

public class PageObjectUtility {

	private WebDriver driver;
	private String pageObjectBasePackage = "pageObjects.";
	private String pageObjectComponentPackage = "pageObjects.components.";

	public PageObjectUtility(WebDriver driver) {
		this.driver = driver;
	}

	/**
	 * Dynamically retrieves a WebElement by using reflection to call the getter method of the corresponding element from a given page
	 * @param element the element to be retrieved
	 * @param page the page object class that contains the desired element
	 * @return WebElement
	 */

	public WebElement findElementInPage(String element, String page) {
		return findElement(element, page, pageObjectBasePackage);
	}

	public String findIdentifierInPom(String element, String page) {
		return getElementIdentifier(element, page, pageObjectBasePackage);
	}

	public String findIdentifierInComponentPom(String element, String page) {
		return getElementIdentifier(element, page, pageObjectComponentPackage);
	}

	public List<WebElement> findElementsInPage(String element, String page) {
		return findElements(element, page, pageObjectBasePackage);
	}

	public WebElement findElementInComponent(String element, String component) {
		String basePackage = pageObjectBasePackage + "components.";
		return findElement(element, component, basePackage);
	}

	public String getPageUrl(String page) {
		String url = null;
		try {
			page = CaseFormat.LOWER_CAMEL.to(CaseFormat.UPPER_CAMEL, page);
			Class clazz = Class.forName(pageObjectBasePackage + page);
			Object object = clazz.getDeclaredConstructor(WebDriver.class).newInstance(driver);
			Method getElement = ReflectionUtils.findMethod(clazz, "getUrl");
			url =  (String) getElement.invoke(object);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return url;
	}

    private String getElementIdentifier(String element, String containerName, String basePackage) {
        String elementIdentifier = null;
        try {
            // adjust the element and page casing to the expected case to accept case insensitive params
            element = CaseFormat.LOWER_CAMEL.to(CaseFormat.UPPER_CAMEL, element);
            containerName = CaseFormat.LOWER_CAMEL.to(CaseFormat.UPPER_CAMEL, containerName);
            Object object = getClassObject(containerName, basePackage);
            Method getElement = getPageObjectElement(element, containerName, basePackage);
            String elementFromPom = ReflectionUtils.invokeMethod(getElement, object).toString();
            String elementName = String.copyValueOf(elementFromPom.toCharArray());
            String[] multipleElements = elementName.split(",");
            elementIdentifier = multipleElements[0].replace("]", "");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return elementIdentifier;
    }

	private WebElement findElement(String element, String containerName, String basePackage) {
		WebElement webElement = null;
		try {
			// adjust the element and page casing to the expected case to accept case insensitive params
			element = CaseFormat.LOWER_CAMEL.to(CaseFormat.UPPER_CAMEL, element);
			containerName = CaseFormat.LOWER_CAMEL.to(CaseFormat.UPPER_CAMEL, containerName);
			Object object = getClassObject(containerName, basePackage);
			Method getElement = getPageObjectElement(element, containerName, basePackage);
			webElement = (WebElement) getElement.invoke(object);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return webElement;
	}

	private List<WebElement> findElements(String element, String containerName, String basePackage) {
		List<WebElement> webElements = null;
		try {
			// adjust the element and page casing to the expected case to accept case insensitive params
			element = CaseFormat.LOWER_CAMEL.to(CaseFormat.UPPER_CAMEL, element);
			containerName = CaseFormat.LOWER_CAMEL.to(CaseFormat.UPPER_CAMEL, containerName);
			Object object = getClassObject(containerName, basePackage);
			Method getElement = getPageObjectElement(element, containerName, basePackage);
			webElements = (List<WebElement>) getElement.invoke(object);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return webElements;
	}

	private Method getPageObjectElement(String element, String containerName, String basePackage) throws Exception {
		Class clazz = Class.forName(basePackage + containerName);
		return ReflectionUtils.findMethod(clazz, "get" + element);
	}

	private Object getClassObject(String containerName, String basePackage) throws Exception {
		Class clazz = Class.forName(basePackage + containerName);
		return clazz.getDeclaredConstructor(WebDriver.class).newInstance(driver);
	}
}
