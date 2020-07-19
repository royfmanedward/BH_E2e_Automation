package utility.APIUtils;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import org.awaitility.Awaitility;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.junit.Assert;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

public class CreateTuitionApplicationAPI {

    private String sessionToken;
    private Long participantID;
    private String uploadDocument = "false";
    private String appComments = "false";
    private String certificationProgram = "false";
    private String examExpenses = "false";
    private String lastName = null;
    private String baseURI = "https://web1-stg.edassist.com/ed5/api/v1";
    private String appID;
    private Boolean continueAPIExecution = true;
    private JSONObject sessionTokenJsonObject = null;
    private JSONObject step1ContactInfoJsonObject = null;
    private JSONObject step2ProgramJsonObject = null;
    private JSONObject step2SubTypesJsonObject = null;
    private JSONArray step3CourseExpensesJsonArray = null;
    private JSONArray step3CertificateExpensesJsonArray = null;
    private JSONObject step3SessionInfoJsonObject = null;
    private JSONArray step3OtherExpensesJsonArray = null;
    private JSONObject step2CertificationProgramJsonObject= null;
    private JSONObject step4AgreementsVerifyJsonObject = null;
    private JSONObject step4GrantsJsonObject = null;
    private JSONObject step5ApplicationCommentsJsonObject = null;
    private File docUploadfile = new File("src/resources/DocumentUpload.jpg");
    private JSONParser jsonParser = new JSONParser();


    public CreateTuitionApplicationAPI() throws IOException, ParseException {
        JSONParser jsonParser = new JSONParser();

        step1ContactInfoJsonObject = (JSONObject) jsonParser.parse(new FileReader("src/resources/TuitionApplicationPayloads/Step1ContactInfo.json"));
        step2ProgramJsonObject = (JSONObject) jsonParser.parse(new FileReader("src/resources/TuitionApplicationPayloads/step2Program.json"));
        step3CourseExpensesJsonArray = (JSONArray) jsonParser.parse(new FileReader("src/resources/TuitionApplicationPayloads/Step3CourseAndExpenses.json"));
        step3CertificateExpensesJsonArray = (JSONArray) jsonParser.parse(new FileReader("src/resources/TuitionApplicationPayloads/Step3CertificateExpenses.json"));
        step2CertificationProgramJsonObject= (JSONObject) jsonParser.parse(new FileReader("src/resources/TuitionApplicationPayloads/step2CertificationProgram.json"));
        step2SubTypesJsonObject= (JSONObject) jsonParser.parse(new FileReader("src/resources/TuitionApplicationPayloads/step2SubType.json"));
        step3SessionInfoJsonObject = (JSONObject) jsonParser.parse(new FileReader("src/resources/TuitionApplicationPayloads/Step3SessionInfo.json"));
        step3OtherExpensesJsonArray = (JSONArray) jsonParser.parse(new FileReader("src/resources/TuitionApplicationPayloads/Step3OtherExpenses.json"));
        step4AgreementsVerifyJsonObject = (JSONObject) jsonParser.parse(new FileReader("src/resources/CommonPayloads/agreementsVerify.json"));
        step4GrantsJsonObject = (JSONObject) jsonParser.parse(new FileReader("src/resources/CommonPayloads/grants.json"));
        step5ApplicationCommentsJsonObject = (JSONObject) jsonParser.parse(new FileReader("src/resources/CommonPayloads/applicationComments.json"));
    }

    //Creating and storing the sessionToken and Participant ID from the login call
    public void initialization(String Token, Long ParticipantID) {
        this.sessionToken = Token;
        this.participantID = ParticipantID;
    }

    public void step1ContactInformation(){
        RestAssured.baseURI = baseURI;

        //Passing the PPT session token and sending the Contact Information in Step1
        System.out.println("------" + "\n" + "Step 1 Begins" + "\n" + "--------------");

        Response contactGetResponse = RestAssured.given()
                .header("X-AUTH-TOKEN", sessionToken)
                .contentType(ContentType.JSON)
                .get("/participants/" + participantID)
                .then()
                .assertThat()
                .statusCode(200)
                .extract()
                .response();

        lastName = contactGetResponse.body().path("user.lastName");
        String contactJson = contactGetResponse.getBody().asString();

        Response contactPostResponse = RestAssured.given()
                .header("X-AUTH-TOKEN", sessionToken)
                .contentType(ContentType.JSON)
                .body(contactJson)
                .put("/participants/" + participantID)
                .then()
                .assertThat()
                .statusCode(200)
                .extract()
                .response();

        String contactPostJson = contactPostResponse.getBody().asString();
        System.out.println("Step1 API Response is  " + "\n" + contactPostJson);
    }

    public String step2ProgramInformation(String stepName) throws ParseException {
        RestAssured.baseURI = baseURI;

        //Below is Step2 of Tuition Application where PPT selects the Programs
        System.out.println("------" + "\n" + "Step 2 Begins" + "\n" + "--------------");

        if (certificationProgram.equalsIgnoreCase("true")){

            step2CertificationProgramJsonObject = (JSONObject) jsonParser.parse(step2CertificationProgramJsonObject.toString().replace("21292238", String.valueOf(participantID)));

            Response prgmResponse = RestAssured.given()
                    .header("X-AUTH-TOKEN", sessionToken)
                    .contentType(ContentType.JSON)
                    .body(step2CertificationProgramJsonObject)
                    .post("/applications")
                    .then()
                    .assertThat()
                    .statusCode(200)
                    .extract()
                    .response();


            Assert.assertNotNull(prgmResponse.getBody());
            String pgmName = prgmResponse.jsonPath().getString("programName");
            appID = prgmResponse.jsonPath().getString("id");
            String prgmJson = prgmResponse.getBody().asString();

            System.out.println("------" + "\n" + "Program Name is" + "\n" +
                    pgmName + "\n" + "Step2 Program API Response is  " + "\n" + prgmJson);

            step2SubTypesJsonObject = (JSONObject) jsonParser.parse(step2SubTypesJsonObject.toString().replace("10152607", String.valueOf(appID)));


            Response certificationTypeResponse = RestAssured.given()
                    .header("X-AUTH-TOKEN", sessionToken)
                    .contentType(ContentType.JSON)
                    .body(step2SubTypesJsonObject)
                    .post("/applications/"+appID+"/certification-types")
                    .then()
                    .assertThat()
                    .statusCode(200)
                    .extract()
                    .response();

            Assert.assertNotNull(certificationTypeResponse.getBody());

            System.out.println("Step2 Program API Response for subtypes  " + "\n" + certificationTypeResponse.asString());

            if(stepName.toUpperCase().contains("PROGRAMINFORMATION")) {
                this.continueAPIExecution = false;
            }

            return appID;
        } else {

            step2ProgramJsonObject = (JSONObject) jsonParser.parse(step2ProgramJsonObject.toString().replace("21292238", String.valueOf(participantID)));

            Response prgmResponse = RestAssured.given()
                    .header("X-AUTH-TOKEN", sessionToken)
                    .contentType(ContentType.JSON)
                    .body(step2ProgramJsonObject)
                    .post("/applications")
                    .then()
                    .assertThat()
                    .statusCode(200)
                    .extract()
                    .response();


            Assert.assertNotNull(prgmResponse.getBody());
            String pgmName = prgmResponse.jsonPath().getString("programName");
            appID = prgmResponse.jsonPath().getString("id");
            String prgmJson = prgmResponse.getBody().asString();

            System.out.println("------" + "\n" + "Program Name is" + "\n" +
                    pgmName + "\n" + "Step2 Program API Response is  " + "\n" + prgmJson);

            if(stepName.toUpperCase().contains("PROGRAMINFORMATION")) {
                this.continueAPIExecution = false;
            }

            return appID;
        }

    }

    public void step3ExpenseInformation(String stepName) {
        RestAssured.baseURI = baseURI;

        if (continueAPIExecution) {
            //Below is Step3 of Tuition Application where PPT enters the Session Information
            System.out.println("------" + "\n" + "Step 3 Session Information Begins" + "\n" + "--------------");

            Response sessionInfoResponse = RestAssured.given()
                    .header("X-AUTH-TOKEN", sessionToken)
                    .pathParam("app_ID", appID)
                    .contentType(ContentType.JSON)
                    .body(step3SessionInfoJsonObject)
                    .post("/applications/{app_ID}/session-info")
                    .then()
                    .assertThat()
                    .statusCode(200)
                    .extract()
                    .response();

            Assert.assertNotNull(sessionInfoResponse.getBody());
            String sessionInfoJson = sessionInfoResponse.getBody().asString();
            System.out.println("Step3 Session Info Response is  " + "\n" + sessionInfoJson);

            //Below is Step3 of Tuition Application where PPT adds the courses and expenses
            System.out.println("------" + "\n" + "Step 3 Course and Exp Begins" + "\n" + "--------------");

            if ( examExpenses.equalsIgnoreCase("true")) {
                Response examExpense = RestAssured.given()
                        .header("X-AUTH-TOKEN", sessionToken)
                        .pathParam("app_ID", appID)
                        .contentType(ContentType.JSON)
                        .body(step3CertificateExpensesJsonArray)
                        .post("/applications/{app_ID}/application-courses")
                        .then()
                        .assertThat()
                        .statusCode(200)
                        .extract()
                        .response();

                Assert.assertNotNull(examExpense.getBody());
                String examExpJson = examExpense.getBody().asString();
                System.out.println( "Step3 Course and Expense API Response is  " + "\n" + examExpJson);

            } else {
                Response courseExpResponse = RestAssured.given()
                        .header("X-AUTH-TOKEN", sessionToken)
                        .pathParam("app_ID", appID)
                        .contentType(ContentType.JSON)
                        .body(step3CourseExpensesJsonArray)
                        .post("/applications/{app_ID}/application-courses")
                        .then()
                        .assertThat()
                        .statusCode(200)
                        .extract()
                        .response();

                Assert.assertNotNull(courseExpResponse.getBody());
                String courseExpJson = courseExpResponse.getBody().asString();

                System.out.println("Step3 Course and Expense API Response is  " + "\n" + courseExpJson);
            }

            //Below is Step3 of Tuition Application where PPT adds other expenses
            System.out.println("------" + "\n" + "Step 3 Other Expenses Begins" + "\n" + "--------------");
            Response otherExpResponse = RestAssured.given()
                    .header("X-AUTH-TOKEN", sessionToken)
                    .pathParam("app_ID", appID)
                    .contentType(ContentType.JSON)
                    .body(step3OtherExpensesJsonArray)
                    .post("/applications/{app_ID}/application-expenses")
                    .then()
                    .assertThat()
                    .statusCode(200)
                    .extract()
                    .response();


            Assert.assertNotNull(otherExpResponse.getBody());
            String othExpJson = otherExpResponse.getBody().asString();
            System.out.println("Step3 API Response is  " + "\n" + othExpJson);

            if(stepName.toUpperCase().contains("EXPENSEINFORMATION")) {
                this.continueAPIExecution = false;
            }

        } else {
            System.out.println("###########Skipping Step3 API Execution##############");
        }
    }

    public void step4AgreementInformation(String stepName) throws ParseException {
        RestAssured.baseURI = baseURI;

        if (continueAPIExecution) {
            //Below is Step4 of Tuition Application with PPT Agreements acceptance
            System.out.println("------" + "\n" + "Step 4 PPT Agreements Begins" + "\n" + "--------------");

            step4GrantsJsonObject = (JSONObject) jsonParser.parse(step4GrantsJsonObject.toString().replace("Test1", lastName));
            //Below is Step4 of Tuition Application with PPT Agreements with Grants received
            System.out.println("------" + "\n" + "Step 4 PPT Grants" + "\n" + "--------------");
            Response grantResponse = RestAssured.given()
                    .header("X-AUTH-TOKEN", sessionToken)
                    .pathParam("app_ID", appID)
                    .contentType(ContentType.JSON)
                    .body(step4GrantsJsonObject)
                    .post("/applications/{app_ID}/grants-scholarship")
                    .then()
                    .assertThat()
                    .statusCode(200)
                    .extract()
                    .response();

            Response agreementResponse = RestAssured.given()
                    .header("X-AUTH-TOKEN", sessionToken)
                    .pathParam("app_ID", appID)
                    .contentType(ContentType.JSON)
                    .body(step4AgreementsVerifyJsonObject)
                    .post("/applications/{app_ID}/agreements?agreementVerify=true")
                    .then()
                    .assertThat()
                    .statusCode(200)
                    .extract()
                    .response();

            Assert.assertNotNull(agreementResponse.getBody());
            String agreementJson = agreementResponse.getBody().asString();
            System.out.println("Step4 Agreement API Response is  " + "\n" + agreementJson);

            if(stepName.toUpperCase().contains("AGREEMENTSINFORMATION")) {
                this.continueAPIExecution = false;
            }
        } else {
            System.out.println("###########-- Skipping Step 4 API Execution --##############");
        }
    }

    public void step5ReviewAndSubmit() throws ParseException {
        RestAssured.baseURI = baseURI;

        if(continueAPIExecution) {
            //Below is Step5 of Tuition Application where PPT submits the application
            System.out.println("------" + "\n" + "Step 5 PPT submits the application" + "\n" + "--------------");

            if (uploadDocument.equalsIgnoreCase("true")){
                //Below is Step5 of Tuition Application where PPT upload the documents
                System.out.println("------" + "\n" + "Step 5 Document Upload Begins" + "\n" + "--------------");
                Response docUploadResponse = RestAssured.given()
                        .header("X-AUTH-TOKEN", sessionToken)
                        .pathParam("app_ID", appID)
                        .contentType("multipart/form-data")
                        .multiPart("documentType", "Corrections")
                        .multiPart(docUploadfile)
                        .post("/applications/{app_ID}/application-documents")
                        .then()
                        .extract()
                        .response();
                Awaitility.await().atMost(8, TimeUnit.SECONDS).until(() -> docUploadResponse.getStatusCode() == 200);
                System.out.println("Status code returned is  " + "\n" + docUploadResponse.getStatusCode());
                Assert.assertNotNull(docUploadResponse.getBody());
                String docName = docUploadResponse.body().path("documentName");
                Assert.assertEquals("Corrections", docName);
                String docUploadJson = docUploadResponse.getBody().asString();
                System.out.println("Step5 Doc Upload API Response is  " + "\n" + docUploadJson);
            }

            if (appComments.equalsIgnoreCase("true")){
                //Below is Step5 of Tuition Application where PPT adds a comments
                System.out.println("------" + "\n" + "Step 5 application comments" + "\n" + "--------------");
                step5ApplicationCommentsJsonObject = (JSONObject) jsonParser.parse(step5ApplicationCommentsJsonObject.toString().replace("10009518", appID));
                Response commentResponse = RestAssured.given()
                        .header("X-AUTH-TOKEN", sessionToken)
                        .contentType(ContentType.JSON)
                        .body(step5ApplicationCommentsJsonObject)
                        .post("/applications/" + appID + "/comments")
                        .then()
                        .assertThat()
                        .statusCode(200)
                        .extract()
                        .response();


                Assert.assertNotNull(commentResponse.getBody());
                String comment = commentResponse.path("comment");
                Assert.assertEquals("Testing comments section",comment);
                String commentResponseJson = commentResponse.getBody().asString();
                System.out.println("Step 5 commentResponse is  " + "\n" + commentResponseJson);
            }

            Response appSubmitResponse = RestAssured.given()
                    .header("X-AUTH-TOKEN", sessionToken)
                    .pathParam("app_ID", appID)
                    .contentType(ContentType.JSON)
                    .post("/applications/{app_ID}/submission")
                    .then()
                    .assertThat()
                    .statusCode(200)
                    .extract()
                    .response();

            Assert.assertNotNull(appSubmitResponse.getBody());
            String appSubmitJson = appSubmitResponse.getBody().asString();
            System.out.println("Step5 Review and Submit API Response is  " + "\n" + appSubmitJson);
        } else {
            System.out.println("###########-- Skipping Step 5 API Execution --##############");
        }
    }


    public void updateJSON(String attribute, String value) throws ParseException {
        JSONParser jsonParser = new JSONParser();

        String defaultUserName = "atest1";
        String defaultClientName = "210";
        String defaultProgram = "1265";
        String defaultProgramSubType = "\"id\":1";
        String defaultFieldOfStudy = "\"courseOfStudy\":{\"id\":4}";
        String defaultOtherFieldOfStudy = "\"otherCourseOfStudy\":null";
        String defaultCertificateStartDate = "2019-11-27";
        String defaultCertificateEndDate = "2020-01-22";
        String defaultSessionStartDate = "2019-09-04";
        String defaultSessionEndDate = "2019-10-30";

        switch (attribute.toUpperCase()) {
            case "PROGRAM": {
                if (value.equalsIgnoreCase("1343")) {
                    step2CertificationProgramJsonObject = (JSONObject) jsonParser.parse(step2CertificationProgramJsonObject.toString().replace(defaultProgram, value));
                    break;
                } else {
                    step2ProgramJsonObject = (JSONObject) jsonParser.parse(step2ProgramJsonObject.toString().replace(defaultProgram, value));
                    break;
                }
            }
            case "FIELD OF STUDY": {
                step2ProgramJsonObject = (JSONObject) jsonParser.parse(step2ProgramJsonObject.toString().replace(defaultFieldOfStudy, "\"courseOfStudy\":{\"id\":"+value+"}"));
                System.out.println(step2ProgramJsonObject.toString());
                break;
            }
            case "OTHER FIELD OF STUDY": {
                step2ProgramJsonObject = (JSONObject) jsonParser.parse(step2ProgramJsonObject.toString().replace(defaultOtherFieldOfStudy, "\"otherCourseOfStudy\":"+value));
                System.out.println(step2ProgramJsonObject.toString());
                break;
            }
            case "PROGRAM SUBTYPE": {
                this.certificationProgram = "true";
                step2SubTypesJsonObject = (JSONObject) jsonParser.parse(step2SubTypesJsonObject.toString().replace(defaultProgramSubType, "\"id\":" + value));
                System.out.println("updated step2CertificationProgramJsonObject is" + step2SubTypesJsonObject.toString());
                if (value.equalsIgnoreCase("1") || value.equalsIgnoreCase("2")) {
                    this.examExpenses = "true";
                }
                break;
            }
            case "CERTIFICATE START DATE FROM TODAY": {
                step2CertificationProgramJsonObject = (JSONObject) jsonParser.parse(step2CertificationProgramJsonObject.toString().replace(defaultCertificateStartDate, value));
                break;
            }
            case "CERTIFICATE END DATE FROM TODAY": {
                step2CertificationProgramJsonObject = (JSONObject) jsonParser.parse(step2CertificationProgramJsonObject.toString().replace(defaultCertificateEndDate, value));
                break;
            }
            case "SESSION START DATE FROM TODAY": {
                step3SessionInfoJsonObject = (JSONObject) jsonParser.parse(step3SessionInfoJsonObject.toString().replace(defaultSessionStartDate, value));
                break;
            }
            case "SESSION END DATE FROM TODAY": {
                step3SessionInfoJsonObject = (JSONObject) jsonParser.parse(step3SessionInfoJsonObject.toString().replace(defaultSessionEndDate, value));
                break;
            }
            case "UPLOAD": {
                if (value.equalsIgnoreCase("true")) {
                    this.uploadDocument = value;
                }
                break;
            }
            case "COMMENTS": {
                if (value.equalsIgnoreCase("true")) {
                    this.appComments = value;
                }
                break;
            }
            default: {
                System.out.println("The " + attribute + " is not part of handled switch cases ");
            }
        }
    }

    public void setContinueAPIExecution(Boolean continueAPIExecution) {
        this.continueAPIExecution = continueAPIExecution;
    }
}
