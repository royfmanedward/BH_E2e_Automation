package utility.testrail;


import utility.WebDriverFactory;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class TestRailPostRequest {

    public ArrayList<String> createTestrailPostRequest(APIClient client,
            String testCaseId,
            String previousTestCaseId,
            ArrayList<String> testExampleStatuses,
            String testStatus) throws IOException, APIException {

        if (WebDriverFactory.isRemoteRunner()) {

            Map<String, String> data = new HashMap<>();
            client.setUser("andy.batey.qe@gmail.com");
            client.setPassword("automation");
            String url = "add_result/" + testCaseId + "";

            //Create new array to store example results if new scenario begins
            if (!testCaseId.equals(previousTestCaseId)) {
                testExampleStatuses = new ArrayList<>();
            }

            //Fails test case if any example scenarios fail
            if (testCaseId.equals(previousTestCaseId) || testExampleStatuses.isEmpty()) {
                testExampleStatuses.add(testStatus);

                for (String previousStatus : testExampleStatuses) {
                    if (previousStatus.equals("9")) {
                        testStatus = "9";
                    }
                }
            }

            //Same testCaseId in a row means multiple examples for a scenario exist
            data.put("status_id", testStatus);
            data.put("comment", "");
            client.sendPost(url, data);
        }
        return testExampleStatuses;
    }
}
