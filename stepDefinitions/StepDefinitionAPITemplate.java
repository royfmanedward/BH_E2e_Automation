package stepDefinitions;

import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.cucumber.datatable.DataTable;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.junit.Assert;
import org.openqa.selenium.JavascriptExecutor;
import utility.APIUtils.CreateEdGoalApplicationAPI;
import utility.APIUtils.CreateTuitionApplicationAPI;
import utility.CommonUtil;

import java.io.FileInputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class StepDefinitionAPITemplate {

    private String sessionToken;
    private Long participantID;
    private StepDefinitions stepDefinitionsMain;
    private CreateTuitionApplicationAPI createTuitionApplicationAPI;
    private CreateEdGoalApplicationAPI createEdGoalApplicationAPI;

    public StepDefinitionAPITemplate(StepDefinitions stepDefinitionsMain) {
        this.stepDefinitionsMain = stepDefinitionsMain;
    }

    @Before
    public void setup() throws IOException, ParseException {
        createTuitionApplicationAPI = new CreateTuitionApplicationAPI();
        createEdGoalApplicationAPI = new CreateEdGoalApplicationAPI();
    }

    @Given("^I Update the tuition API request$")
    public void updateJsonContent(DataTable JsonTable) throws ParseException, IOException {
        Map<String, String> dataMap = JsonTable.asMap(String.class, String.class);
        String programDataExcel = "src/resources/apiTestData/clientProgramData.xlsx";
        for ( String attribute : dataMap.keySet() )
        {
            if (attribute.toUpperCase().contains("DATE")) {
                String attributeValue = dataMap.get(attribute);
                String Date = courseApiDate(attributeValue);
                createTuitionApplicationAPI.updateJSON(attribute, Date);
            } else if (attribute.equalsIgnoreCase("PROGRAM")) {
                Map<String, String> excelFileMap = readExcelDataIntoMap(programDataExcel, stepDefinitionsMain.getCurrentClient());
                String ProgramID = excelFileMap.get(dataMap.get(attribute));
                createTuitionApplicationAPI.updateJSON(attribute, ProgramID);
            } else if (attribute.equalsIgnoreCase("PROGRAM SUBTYPE")) {
                Map<String, String> excelFileMap = readExcelDataIntoMap(programDataExcel, "programSubtypes");
                String subTypeID = excelFileMap.get(dataMap.get(attribute));
                createTuitionApplicationAPI.updateJSON(attribute, subTypeID);
            } else if (attribute.equalsIgnoreCase("FIELD OF STUDY")) {
                Map<String, String> excelFileMap = readExcelDataIntoMap(programDataExcel, "FieldOfStudy");
                String FieldOfStudyID = excelFileMap.get(dataMap.get(attribute));
                createTuitionApplicationAPI.updateJSON(attribute, FieldOfStudyID);
            } else {
                String attributeValue = dataMap.get(attribute);
                createTuitionApplicationAPI.updateJSON(attribute, attributeValue);
            }
        }
    }

    @Given("^I Update the EdGoal JSON files before doing an EdGoal API request$")
    public void updateEdGoalJsonContent(DataTable JsonTable) throws ParseException, IOException {
        Map<String, String> dataMap = JsonTable.asMap(String.class, String.class);
        String programDataExcel = "src/resources/apiTestData/clientProgramData.xlsx";
        for ( String attribute : dataMap.keySet() )
        {
            if (attribute.toUpperCase().contains("DATE")) {
                String attributeValue = dataMap.get(attribute);
                String Date = courseApiDate(attributeValue);
                createEdGoalApplicationAPI.updateEdGoalPayloads(attribute, Date);
            } else if (attribute.equalsIgnoreCase("PROGRAM")) {
                Map<String, String> excelFileMap = readExcelDataIntoMap(programDataExcel, stepDefinitionsMain.getCurrentClient());
                String ProgramID = excelFileMap.get(dataMap.get(attribute));
                createEdGoalApplicationAPI.updateEdGoalPayloads(attribute, ProgramID);
            } else {
                String attributeValue = dataMap.get(attribute);
                createEdGoalApplicationAPI.updateEdGoalPayloads(attribute, attributeValue);
            }
        }
    }

    @When("^I create tuition application using API$")
    public void createTuitionApplication() throws ParseException {
        sessionToken();
        String stepName = "Full Application";
        startTuitionApplicationWorkflow(stepName);
    }

    @When("^I create tuition application until (\\S+) using API$")
    public void startTuitionApplicationWorkflow(String stepName) throws ParseException {
        sessionToken();
        createTuitionApplicationAPI.initialization(sessionToken, participantID);
        createTuitionApplicationAPI.step1ContactInformation();
        String applicationID = createTuitionApplicationAPI.step2ProgramInformation(stepName);
        createTuitionApplicationAPI.step3ExpenseInformation(stepName);
        createTuitionApplicationAPI.step4AgreementInformation(stepName);
        createTuitionApplicationAPI.step5ReviewAndSubmit();
        stepDefinitionsMain.setCurrentApplication(applicationID);
        createTuitionApplicationAPI.setContinueAPIExecution(true);
    }

    @When("^I submit API request to create a an EdGoal application$")
    public void createEdGoal() throws ParseException, IOException {
        sessionToken();
        createEdGoalApplicationAPI.initialization(sessionToken, participantID);
        String applicationID = createEdGoalApplicationAPI.createEdGoalApp();
        stepDefinitionsMain.setCurrentApplication(applicationID);
    }


    @When("^I retrieve session token and participantID after login$")
    public void sessionToken() throws ParseException {
        JSONParser jsonParser = new JSONParser();
        JavascriptExecutor js = (JavascriptExecutor) stepDefinitionsMain.getDriver();

        String sessionJson=(String) js.executeScript("return window.localStorage.getItem(\"ngStorage-session\")");
        String userJson=(String) js.executeScript("return window.localStorage.getItem(\"ngStorage-user\")");

        JSONObject sessionJO = (JSONObject) jsonParser.parse(sessionJson);
        JSONObject userJO = (JSONObject) jsonParser.parse(userJson);

        JSONObject TokenJsonObj = (JSONObject) sessionJO.get("tokens");
        sessionToken = (String) TokenJsonObj.get("sessionToken");

        JSONObject userDetailsJsonObj = (JSONObject)userJO.get("userDetails");
        participantID = (Long) userDetailsJsonObj.get("participantId");
    }

    @When("^I navigate to page with current application under action needed$")
    public void findAndNavigateToThePage() throws ParseException {
        sessionToken();
        Response responseForPages = taskListApiCall("1");
        int appsInActionNeed = responseForPages.body().path("pagination.total");
        int numberOfPages = (int) Math.ceil(appsInActionNeed/10D);

        for (int i = 1; i <= numberOfPages; i++) {
            Response taskListResponse = taskListApiCall("" + i +"");
            String taskListResponseJson = taskListResponse.getBody().asString();

            if (taskListResponseJson.contains("\"number\":" + stepDefinitionsMain.getCurrentAppNumber())) {
                JavascriptExecutor js = (JavascriptExecutor) stepDefinitionsMain.getDriver();
                String sessionJson = (String) js.executeScript("return window.localStorage.getItem(\"ngStorage-session\")");
                String updateSessionJson = sessionJson.replace("\"currentPage\":1", "\"currentPage\":"+ i);
                js.executeScript("window.localStorage.setItem(\"ngStorage-session\", arguments[0])",updateSessionJson);
                stepDefinitionsMain.getDriver().navigate().refresh();
                break;
            }
        }
    }

    @Then("^I retrieve application number from applicationId$")
    public void retrieveApplicationNumber() throws ParseException {
        sessionToken();
        Response appResponse = applicationDetails(stepDefinitionsMain.getCurrentApplication(), 200);
        stepDefinitionsMain.setCurrentApplicationNumber(appResponse.jsonPath().getString("number"));
    }

    @Then("^I delete current tuition application using API$")
    public void deleteApplication() throws ParseException {
        sessionToken();
        deleteApp(stepDefinitionsMain.getCurrentApplication());
        Response appResponse = applicationDetails(stepDefinitionsMain.getCurrentApplication(), 400);
        Assert.assertTrue("Application was not deleted",appResponse.asString().contains("Application was not found"));
    }

    @When("^I navigate to (.*) web page$")
    public void navigateToWebPage(String Page) throws ParseException {
        String baseURL = "-" + stepDefinitionsMain.getEnv() + ".edassist.com/";
        sessionToken();

        switch (Page.toUpperCase()) {
            case "CONTACT INFORMATION" : {
                String url = "https://" + stepDefinitionsMain.getCurrentClient() + baseURL + "#/createApplication/contactInformation/" + participantID +"/";
                stepDefinitionsMain.getDriver().get(url);
                break;
            }
            case "PROGRAM INFORMATION" : {
                String url = "https://" + stepDefinitionsMain.getCurrentClient() + baseURL + "#/createApplication/educationInformation/" + participantID +"//";
                stepDefinitionsMain.getDriver().get(url);
                break;
            }
            case "EXPENSE INFORMATION" : {
                String url = "https://" + stepDefinitionsMain.getCurrentClient() + baseURL + "#/createApplication/courses/" + stepDefinitionsMain.getCurrentApplication();
                stepDefinitionsMain.getDriver().get(url);
                break;
            }
            case "AGREEMENTS INFORMATION" : {
                String url = "https://" + stepDefinitionsMain.getCurrentClient() + baseURL + "#/createApplication/agreement/" + stepDefinitionsMain.getCurrentApplication();
                stepDefinitionsMain.getDriver().get(url);
                break;
            }
            case "REVIEW AND SUBMIT" : {
                String url = "https://" + stepDefinitionsMain.getCurrentClient() + baseURL + "#/application/" + stepDefinitionsMain.getCurrentApplication();
                stepDefinitionsMain.getDriver().get(url);
                break;
            }
            case "PROFILE" : {
                String url = "https://" + stepDefinitionsMain.getCurrentClient() + baseURL + "#/profile/" + participantID;
                stepDefinitionsMain.getDriver().get(url);
                break;
            }
            case "HISTORY" : {
                String url = "https://" + stepDefinitionsMain.getCurrentClient() + baseURL + "#/history/" + participantID;
                stepDefinitionsMain.getDriver().get(url);
                break;
            }
            case "EDUCATION COACHING" : {
                String url = "https://" + stepDefinitionsMain.getCurrentClient() + baseURL + "#/advising";
                stepDefinitionsMain.getDriver().get(url);
                break;
            }
            case "SUPPORT" : {
                String url = "https://" + stepDefinitionsMain.getCurrentClient() + baseURL + "#/support";
                stepDefinitionsMain.getDriver().get(url);
                break;
            }
            default: {
                Assert.assertFalse("REQUESTED PAGE" + Page + "is not valid",true);
            }
        }
    }

    public String courseApiDate(String numDays) {
        DateFormat dateFormat  = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        Date sessionDate = CommonUtil.addDays(date,Integer.valueOf(numDays));
        return dateFormat.format(sessionDate);
    }

    public Map<String,  String> readExcelDataIntoMap(String excelPath, String sheetName) throws IOException {
        FileInputStream file = new FileInputStream(excelPath);
        XSSFWorkbook workbook = new XSSFWorkbook(file);
        Sheet sheet = workbook.getSheet(sheetName);
        int lastRow = sheet.getLastRowNum();
        Map<String, String> excelFileMap = new HashMap<>();

        for (int i = 0; i <= lastRow; i++) {
            Row row = sheet.getRow(i);

            Cell valueCell = row.getCell(1);
            Cell keyCell = row.getCell(0);

            String value = valueCell.getStringCellValue().trim();
            String key = keyCell.getStringCellValue().trim();

            excelFileMap.put(key, value);
        }
        return excelFileMap;
    }

    public Response taskListApiCall(String index){
        RestAssured.baseURI = "https://web1-stg.edassist.com/ed5/api/v1";

        Response taskListResponse = RestAssured.given()
                .header("X-AUTH-TOKEN", sessionToken)
                .contentType(ContentType.JSON)
                .pathParam("index", index)
                .pathParam("recordsPerPage", 10)
                .get("/participants/"+ participantID + "/tasklist?index={index}&recordsPerPage={recordsPerPage}")
                .then()
                .assertThat()
                .statusCode(200)
                .extract()
                .response();

        return taskListResponse;
    }

    public Response applicationDetails(String appID, int apiStatusCode) {
        RestAssured.baseURI = "https://web1-stg.edassist.com/ed5/api/v1";

        Response applicationDetailsRes = RestAssured.given()
                .header("X-AUTH-TOKEN", sessionToken)
                .contentType(ContentType.JSON)
                .get("/applications/" + appID)
                .then()
                .assertThat()
                .statusCode(apiStatusCode)
                .extract()
                .response();

        return applicationDetailsRes;
    }

    public void deleteApp(String appID) {
        RestAssured.baseURI = "https://web1-stg.edassist.com/ed5/api/v1";

        Response applicationDetailsRes = RestAssured.given()
                .header("X-AUTH-TOKEN", sessionToken)
                .contentType(ContentType.JSON)
                .delete("/applications/" + appID)
                .then()
                .assertThat()
                .statusCode(200)
                .extract()
                .response();
    }
}
