package utility;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.Platform;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.LocalFileDetector;
import org.openqa.selenium.remote.RemoteWebDriver;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

public class WebDriverFactory {
	private static boolean isRemote;
	public static WebDriver createWebDriver() {
		//Allows tests to run in headless mode locally for Chrome and Firefox - false by default
		Boolean runHeadless = Boolean.parseBoolean(System.getProperty("enable_headless"));
		WebDriver driver = null;
		String remote = System.getProperty("aut_remote");
		isRemote = StringUtils.isNotBlank(remote) && remote.equals("remote");
		String runner = System.getProperty("runnerNumber", "1");
		// supported browsers are listed here with values of 1, 2, 3, etc
		// when running the test suite through command line, these numbers also represents parallel execution forks (JVMs)
		// we can assign different browsers to different forks ex. -Daut_runner_firefox=1 -Daut_runner_chrome=2
		// for local runs through IDE, to change the default browser, assign the default value (second param) of 1 to the desired browser below
		String chrome = System.getProperty("aut_runner_chrome");
		String firefox = System.getProperty("aut_runner_firefox");
		String ie = System.getProperty("aut_runner_ie");
		String edge = System.getProperty("aut_runner_edge");
		try {
			if (runner.equals(chrome)) {
				driver = isRemote ? getRemoteChromeDriver() : getLocalChromeDriver(runHeadless);
			} else if (runner.equals(firefox)) {
				driver = isRemote ? getRemoteFirefoxDriver() : getLocalFirefoxDriver(runHeadless);
			} else if (runner.equals(ie)) {
				driver = isRemote ? getRemoteIeDriver() : getLocalIeDriver();
			} else if (runner.equals(edge)) {
				driver = isRemote ? getRemoteEdgeDriver() : getLocalEdgeDriver();
			} else {
				driver = isRemote ? getRemoteChromeDriver() : getLocalChromeDriver(runHeadless);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return driver;
	}

	public static boolean isRemoteRunner() {
		return isRemote;
	}

	private static String buildRemoteRunnerUrl() {
		String username = System.getProperty("aut_username");
		String accessKey = System.getProperty("aut_access_key");
		return  "http://" + username + ":" + accessKey + "@ondemand.saucelabs.com:80/wd/hub";
	}

	private static WebDriver getLocalChromeDriver(Boolean runHeadless) {
		String chromeVersion = getVersionInstalledChrome();
		WebDriverManager.chromedriver().version(chromeVersion).setup();
		File NewDirectory = new File(System.getProperty("user.dir") + File.separator + "src"+ File.separator +"resources"+ File.separator +"tempDownloadFiles");

		if(!NewDirectory.exists()) {
			NewDirectory.mkdir();
		}

		Map<String, Object> NewPreferences = new HashMap<String, Object>();
		NewPreferences.put("download.default_directory", NewDirectory);
		ChromeOptions options = new ChromeOptions();
		options.addArguments("--allow-insecure-localhost");
		options.setExperimentalOption("prefs", NewPreferences);
		//Set flag to enable/disable headless mode via system property
		if (runHeadless) {
			options.addArguments("--headless");
			options.addArguments("--window-size=1920, 1080");
		}
		return new ChromeDriver(options);
	}

	private static WebDriver getLocalFirefoxDriver(Boolean runHeadless) {
		WebDriverManager.firefoxdriver().setup();
		FirefoxOptions options = new FirefoxOptions();
		//Set flag to enable/disable headless mode via system property
		if (runHeadless) {
			options.addArguments("--headless");
			options.addArguments("--window-size=1920, 1080");
		}
		return new FirefoxDriver(options);
	}

	private static WebDriver getLocalIeDriver() {
		WebDriverManager.iedriver().setup();
		return new InternetExplorerDriver();
	}

	private static WebDriver getLocalEdgeDriver() {
		WebDriverManager.edgedriver().setup();
		return new EdgeDriver();
	}

	private static RemoteWebDriver getRemoteWebDriver(String url, DesiredCapabilities capabilities) throws MalformedURLException {
		RemoteWebDriver driver = new RemoteWebDriver(new URL(url), capabilities);
		driver.setFileDetector(new LocalFileDetector());
		return driver;
	}

	private static RemoteWebDriver getRemoteChromeDriver() throws MalformedURLException {
		String url = buildRemoteRunnerUrl();
		DesiredCapabilities capabilities = DesiredCapabilities.chrome();
		capabilities.setCapability("platform", Platform.WIN8);
		capabilities.setCapability("version", "latest");
		capabilities.setCapability("recordVideo", "false");
		capabilities.setCapability("recordScreenshots", "false");
		return getRemoteWebDriver(url, capabilities);
	}

	private static RemoteWebDriver getRemoteFirefoxDriver() throws MalformedURLException {
		String url = buildRemoteRunnerUrl();
		DesiredCapabilities capabilities = DesiredCapabilities.firefox();
		capabilities.setCapability("platform", Platform.WIN10);
		capabilities.setCapability("version", "latest");
		return getRemoteWebDriver(url, capabilities);
	}

	private static RemoteWebDriver getRemoteIeDriver() throws MalformedURLException {
		String url = buildRemoteRunnerUrl();
		DesiredCapabilities capabilities = DesiredCapabilities.internetExplorer();
		capabilities.setCapability("platform", Platform.WIN8_1);
		capabilities.setCapability("version", "11.0");
		capabilities.setCapability("recordVideo", "false");
		capabilities.setCapability("recordScreenshots", "false");
		return getRemoteWebDriver(url, capabilities);
	}

	private static RemoteWebDriver getRemoteEdgeDriver() throws MalformedURLException {
		String url = buildRemoteRunnerUrl();
		DesiredCapabilities capabilities = DesiredCapabilities.edge();
		capabilities.setCapability("platform", Platform.WIN10);
		capabilities.setCapability("version", "16");
		return getRemoteWebDriver(url, capabilities);
	}

	private static String getVersionInstalledChrome() {
		StringBuilder cmdOutput = new StringBuilder();
		String os = System.getProperty("os.name").toLowerCase();
		String[] command;
		Process process;

		if (os.contains("windows")) {
			command = new String[] {"cmd /c reg query \"HKEY_CURRENT_USER\\Software\\Google\\Chrome\\BLBeacon\" /v version"};
		}
		else if (os.contains("mac")) {
			command = new String[] {"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome", "--version" };
		}
		else {
			throw new java.lang.Error("OS version not being properly detected for Chromedriver");
		}

		try {
			if (command.length == 1) {
				process = Runtime.getRuntime().exec(command[0]);
			}
			else {
				process = Runtime.getRuntime().exec(command);
			}
			BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
			String line;
			while ((line = reader.readLine()) != null) {
				cmdOutput.append(line + "\n");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		String[] chromeInfo = cmdOutput.toString().split("\\s+");
		int stringCount = chromeInfo.length;

		return chromeInfo[stringCount - 1].substring(0, 2);
	}
}
