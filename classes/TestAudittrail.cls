global class TestAudittrail {
    


    public static  void usertocon() {
        List<kcs_dev__A__c> contacts = new List<kcs_dev__A__c>();
        List<SetupAuditTrail> Setup = [SELECT Id,
        Action,
        CreatedBy.Name,
        CreatedDate,
        Display,
        Section 
     FROM SetupAuditTrail ];
        System.debug('Setup' +setup);
        for (SetupAuditTrail u: Setup){
            kcs_dev__A__c c = new kcs_dev__A__c();
            c.kcs_dev__One__c=u.Section;
            c.kcs_dev__Hello__c = u.Action;
            
            
            
            contacts.add(c);       
        }
        insert contacts;
    } 
}