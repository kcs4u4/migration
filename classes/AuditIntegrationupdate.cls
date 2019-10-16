public class AuditIntegrationupdate {
    @future (callout=true)
    public static void auditupdate() {
        //Construct HTTP request and response
        //Http request method,Endpoint and setBody
        HttpRequest req = new HttpRequest();
        req.setHeader('Content-Type','application/json');
        String endpoint = 'https://putsreq.com/fz8aw53T4GnJjeBpXGUB';
        req.setMethod('POST');
        req.setEndpoint(endpoint); 
        //  system.debug('LD ID' +ldid);
        //SOQL to construct JSON string in set body
       List<kcs_dev__Audit_Trail__c> audit=[select id,kcs_dev__Section__c,kcs_dev__User_Id__c,kcs_dev__user_Name__c,kcs_dev__Action__c,kcs_dev__Created_Date__c,kcs_dev__Created_By__c,kcs_dev__Display__c from kcs_dev__Audit_Trail__c ]; 
        system.debug('serialized JSON'+JSON.serialize(audit));
        String JsonString=JSON.serialize(audit);
        system.debug(JsonString);
        req.setBody(JsonString); 
        //Http response method 
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
        
    }
    
}