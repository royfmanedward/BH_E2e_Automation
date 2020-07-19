package utility.CommonUtils;

import cucumber.api.Scenario;
import org.openqa.selenium.WebDriver;
import ru.yandex.qatools.ashot.AShot;
import ru.yandex.qatools.ashot.Screenshot;
import ru.yandex.qatools.ashot.shooting.ShootingStrategies;
import org.openqa.selenium.WebDriverException;

import javax.imageio.ImageIO;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

public  class TakeScreenShot {

    public void CaptureScreenShot(Scenario scenario, WebDriver driver) {
        try {
            //Taking full page screenshot on failure.
            Screenshot screenshot = new AShot().shootingStrategy(ShootingStrategies.viewportPasting(ShootingStrategies.scaling(1.55f), 1000)).takeScreenshot(driver);

            //Create a ByteArrayOutputStream object.
            ByteArrayOutputStream bos=new ByteArrayOutputStream();
            ImageIO.write(screenshot.getImage(),"png",bos);
            byte[]embedScreenshot=bos.toByteArray();

            //Embed the image in cucumber reports.
            scenario.embed(embedScreenshot,"image/png");
            } catch(final UnsupportedOperationException somePlatformsDontSupportScreenshots) {
                System.err.println(somePlatformsDontSupportScreenshots.getMessage());
            } catch(final WebDriverException e) {
                scenario.write("WARNING. Failed take screenshots with exception:"+e.getMessage());
            } catch(IOException e) {
                e.printStackTrace();
            }
        }
    }

