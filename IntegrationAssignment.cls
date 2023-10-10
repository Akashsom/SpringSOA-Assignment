public class IntegrationAssignment {
    public static void makeHttpCallout() {
        //Define the endpoint URL
        String endpoint = 'https://postman-echo.com/get?foo1=bar1&foo2=bar2';
        
        //Create an HTTP request
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        
        //Create an HTTP object to send the request
        Http http = new Http();
        
        //Send the request and receive the response
        HttpResponse response = http.send(request);
        
        //Check the response status code
        if (response.getStatusCode() == 200) {
            //Print the response body to the debug log
            System.debug('HTTP Response Body: ' + response.getBody());
        } else {
            //Print an error message if the request was not successful
            System.debug('HTTP Request failed with status code: ' + response.getStatusCode());
        }
    }
}