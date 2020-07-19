package utility.APIUtils;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.awaitility.Awaitility;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.junit.Assert;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

public class CreateEdGoalApplicationAPI {
    private String sessionToken;
    private Long participantID;
    private String applicaitonID;
    private JSONObject step1ProgramInfoJsonObj = null;
    private JSONObject step2ExpenseInfoJsonObj = null;
    private JSONObject step2ExpenseInfoWithGrantsJsonObj = null;
    private JSONObject applicationCommentsJsonObj = null;
    private File docUploadfile = new File("src/resources/DocumentUpload.jpg");
    private String appComments = "false";
    private String uploadDocument = "false";
    private String grants = "false";




    public CreateEdGoalApplicationAPI() throws IOException, ParseException {
        JSONParser jsonParser = new JSONParser();
        step1ProgramInfoJsonObj = (JSONObject) jsonParser.parse(new FileReader("src/resources/EdGoalsRequestPayload/programInformation.json"));
        step2ExpenseInfoJsonObj = (JSONObject) jsonParser.parse(new FileReader("src/resources/EdGoalsRequestPayload/expenseInfo.json"));
        step2ExpenseInfoWithGrantsJsonObj = (JSONObject) jsonParser.parse(new FileReader("src/resources/EdGoalsRequestPayload/expenseInfoWithGrants.json"));
        applicationCommentsJsonObj = (JSONObject) jsonParser.parse(new FileReader("src/resources/CommonPayloads/applicationComments.json"));
    }

    public void initialization(String Token, Long ParticipantID) {
        this.sessionToken = Token;
        this.participantID = ParticipantID;
    }

    public String createEdGoalApp() throws ParseException {
        JSONParser jsonParser = new JSONParser();

        RestAssured.baseURI = "https://web1-stg.edassist.com/ed5/api/v1";
        System.out.println("------" + "\n" + "Step 1 Begins" + "\n" + "--------------");

        Response participantGetResponse = RestAssured.given()
                .header("X-AUTH-TOKEN", sessionToken)
                .contentType(ContentType.JSON)
                .get("/participants/" + participantID)
                .then()
                .assertThat()
                .statusCode(200)
                .extract()
                .response();

        step2ExpenseInfoJsonObj = (JSONObject) jsonParser.parse(step2ExpenseInfoJsonObj.toString().replace("\"participant\":null", "\"participant\":" + participantGetResponse.getBody().asString()));
        step2ExpenseInfoWithGrantsJsonObj = (JSONObject) jsonParser.parse(step2ExpenseInfoWithGrantsJsonObj.toString().replace("\"participant\":null", "\"participant\":" + participantGetResponse.getBody().asString()));

        step1ProgramInfoJsonObj = (JSONObject) jsonParser.parse(step1ProgramInfoJsonObj.toString().replace("21292243", String.valueOf(participantID)));
        Response programInfoResponse = RestAssured.given()
                .header("X-AUTH-TOKEN", sessionToken)
                .contentType(ContentType.JSON)
                .body(step1ProgramInfoJsonObj)
                .post("/participants/" + participantID + "/education-goals")
                .then()
                .assertThat()
                .statusCode(200)
                .extract()
                .response();

        applicaitonID = programInfoResponse.jsonPath().getString("id");
        System.out.println("------" + "\n" + "Step 1 Response" + "\n" + "--------------" + programInfoResponse.getBody().asString());
        if (grants.equalsIgnoreCase("true")){
            step2ExpenseInfoJsonObj = step2ExpenseInfoWithGrantsJsonObj;

        }
        step2ExpenseInfoJsonObj = (JSONObject) jsonParser.parse(step2ExpenseInfoJsonObj.toString().replace("credit hours", "50"));
        step2ExpenseInfoJsonObj = (JSONObject) jsonParser.parse(step2ExpenseInfoJsonObj.toString().replace("10028490", applicaitonID));
        step2ExpenseInfoJsonObj = (JSONObject) jsonParser.parse(step2ExpenseInfoJsonObj.toString().replace("21292243", String.valueOf(participantID)));

        System.out.println(step2ExpenseInfoJsonObj.toString());

        System.out.println("------" + "\n" + "Step 2 Begins" + "\n" + "--------------");
        Response expenseInfoResponse = RestAssured.given()
                .header("X-AUTH-TOKEN", sessionToken)
                .contentType(ContentType.JSON)
                .body(step2ExpenseInfoJsonObj)
                .put("/participants/" + participantID + "/education-goals/" + applicaitonID)
                .then()
                .assertThat()
                .statusCode(200)
                .extract()
                .response();
        System.out.println("------" + "\n" + "Step 2 Response" + "\n" + "--------------" + expenseInfoResponse.getBody().asString());

        System.out.println("------" + "\n" + "Step 3 Begins" + "\n" + "--------------");
        Response agreementInfoResponse = RestAssured.given()
                .header("X-AUTH-TOKEN", sessionToken)
                .contentType(ContentType.JSON)
                //.body(step3AgreementJsonObj)
                .post("/applications/" + applicaitonID + "/agreements?agreementVerify=true")
                .then()
                .assertThat()
                .statusCode(200)
                .extract()
                .response();
        System.out.println("------" + "\n" + "Step 3 Response" + "\n" + "--------------" + agreementInfoResponse.getBody().asString());

        System.out.println("------" + "\n" + "Step 4 Begins" + "\n" + "--------------");

        if (uploadDocument.equalsIgnoreCase("true")){
            //Below is Step4 of EdGoal Application where PPT upload the documents
            System.out.println("------" + "\n" + "Step 4 Document Upload Begins" + "\n" + "--------------");
            Response docUploadResponse = RestAssured.given()
                    .header("X-AUTH-TOKEN", sessionToken)
                    .pathParam("app_ID", applicaitonID)
                    .contentType("multipart/form-data")
                    .multiPart("documentType", "Course Syllabus")
                    .multiPart(docUploadfile)
                    .post("/applications/{app_ID}/application-documents")
                    .then()
                    .extract()
                    .response();
            Awaitility.await().atMost(8, TimeUnit.SECONDS).until(() -> docUploadResponse.getStatusCode() == 200);
            System.out.println("Status code returned is  " + "\n" + docUploadResponse.getStatusCode());
            Assert.assertNotNull(docUploadResponse.getBody());
            String docName = docUploadResponse.body().path("documentName");
            Assert.assertEquals("Course Syllabus", docName);
            String docUploadJson = docUploadResponse.getBody().asString();
            System.out.println("Step4 Doc Upload API Response is  " + "\n" + docUploadJson);
        }

        if (appComments.equalsIgnoreCase("true")){
            //Below is Step4 of EdGoal Application where PPT adds a comments
            System.out.println("------" + "\n" + "Step 4 application comments" + "\n" + "--------------");
            applicationCommentsJsonObj = (JSONObject) jsonParser.parse(applicationCommentsJsonObj.toString().replace("10009518", applicaitonID));
            Response commentResponse = RestAssured.given()
                    .header("X-AUTH-TOKEN", sessionToken)
                    .contentType(ContentType.JSON)
                    .body(applicationCommentsJsonObj)
                    .post("/applications/" + applicaitonID + "/comments")
                    .then()
                    .assertThat()
                    .statusCode(200)
                    .extract()
                    .response();


            Assert.assertNotNull(commentResponse.getBody());
            String comment = commentResponse.path("comment");
            Assert.assertEquals("Testing comments section",comment);
            String commentResponseJson = commentResponse.getBody().asString();
            System.out.println("Step 4 commentResponse is  " + "\n" + commentResponseJson);
        }

        Response reviewAndSubmitResponse = RestAssured.given()
                .header("X-AUTH-TOKEN", sessionToken)
                .contentType(ContentType.JSON)
                .post("/participants/" + participantID + "/education-goals/" + applicaitonID + "/submission")
                .then()
                .assertThat()
                .statusCode(200)
                .extract()
                .response();
        System.out.println("------" + "\n" + "Step 4 Response" + "\n" + "--------------" + reviewAndSubmitResponse.getBody().asString());

        return applicaitonID;
    }

    public void updateEdGoalPayloads(String attribute, String value) throws ParseException {
        JSONParser jsonParser = new JSONParser();

        String defaultCreditHours = "\"estimatedCreditHours\":\"30\"";
        String defaultProgram = "1488";
        String defaultAnticipatedStartDate = "2019-09-04";
        String defaultAnticipatedEndDate = "2019-09-08";

        switch (attribute.toUpperCase()) {

            case "PROGRAM": {
                step1ProgramInfoJsonObj = (JSONObject) jsonParser.parse(step1ProgramInfoJsonObj.toString().replace(defaultProgram, value));
                break;
            }
            case "ANTICIPATED START DATE FROM TODAY": {
                System.out.println(value);
                step2ExpenseInfoJsonObj = (JSONObject) jsonParser.parse(step2ExpenseInfoJsonObj.toString().replace(defaultAnticipatedStartDate, value));
                break;
            }
            case "ANTICIPATED END DATE FROM TODAY": {
                step2ExpenseInfoJsonObj = (JSONObject) jsonParser.parse(step2ExpenseInfoJsonObj.toString().replace(defaultAnticipatedEndDate, value));
                break;
            }
            case "CREDIT HOURS": {
                step2ExpenseInfoJsonObj = (JSONObject) jsonParser.parse(step2ExpenseInfoJsonObj.toString().replace("credit hours", value));
                step2ExpenseInfoWithGrantsJsonObj = (JSONObject) jsonParser.parse(step2ExpenseInfoWithGrantsJsonObj.toString().replace("credit hours", value));
                break;
            }
            case "COMMENT": {
                if (value.equalsIgnoreCase("true")){
                    this.appComments = "true";
                }
                break;
            }
            case "UPLOAD": {
                if (value.equalsIgnoreCase("true")) {
                    this.uploadDocument = value;
                }
                break;
            }
            case "GRANTS": {
                if (value.equalsIgnoreCase("true")){
                    this.grants = "true";
                }
                break;
            }
        }
    }
}
