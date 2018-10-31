global class AuditTrail_to_CustomObject {
    public static void usertocon() {
        List<kcs_dev__Audit_Trail__c> Audit = new List<kcs_dev__Audit_Trail__c>();
        List<SetupAuditTrail> Setup = [SELECT Id,
                                       Action,
                                       CreatedBy.Name,
                                       CreatedDate,
                                       Display,
                                       Section 
                                       FROM SetupAuditTrail where CreatedDate=LAST_N_DAYS:1];
        System.debug('Setup' +setup);
        for (SetupAuditTrail u: Setup){
            kcs_dev__Audit_Trail__c c = new kcs_dev__Audit_Trail__c();
            c.kcs_dev__Section__c=u.Section;
            c.kcs_dev__Action__c = u.Action;
            c.kcs_dev__Display__c=u.display;
            c.kcs_dev__Created_Date__c=u.CreatedDate;
            c.kcs_dev__Created_By__c=u.CreatedBy.Name;
            Audit.add(c); 
            System.debug('Audit____'+Audit);
        }
     //   Database.SaveResult[] results = Database.insert(Audit);
        insert Audit;
    } 
    
}