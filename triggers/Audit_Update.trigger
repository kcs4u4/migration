trigger Audit_Update on kcs_dev__Audit_Trail__c (after insert) {
    
   /* for (kcs_dev__Audit_Trail__c ld : Trigger.new) {
    //if () {
    AuditIntegrationupdate.auditupdate(ld.Id);
     System.debug('ld.Id');
    } */

}