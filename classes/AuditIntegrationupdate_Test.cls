@isTest(seeAlldata = true)
global class AuditIntegrationupdate_Test{

  static void setupTestData(){
    System.test.startTest();
      
        System.Test.setMock(HttpCalloutMock.class, new Test_MockHttpResponseGenerator()); 
    //    HTTPResponse res = AuditIntegrationupdate_Test.basicAuthCalloutRequest();

    kcs_dev__Audit_Trail__c kcs_dev_audit_trail_Obj = new kcs_dev__Audit_Trail__c(CreatedDate = DateTime.now(), LastModifiedDate = DateTime.now(), kcs_dev__Action__c = 'kcs_d471', kcs_dev__Created_By__c = 'Email17@test.com', kcs_dev__Created_Date__c = DateTime.now(), kcs_dev__Display__c = '19', kcs_dev__Section__c = 'kcs_d863', kcs_dev__User_Id__c = 'kcs_d919', kcs_dev__user_Name__c = 'kcs_d375');
      System.debug('kcs_dev_audit_trail_Obj'+kcs_dev_audit_trail_Obj);
    Insert kcs_dev_audit_trail_Obj; 
    System.test.stopTest();
  }
  static testMethod void test_auditupdate_UseCase1(){
    List<kcs_dev__Audit_Trail__c> kcs_dev_audit_trail_Obj  =  [SELECT CreatedDate,CreatedById,LastModifiedDate,LastModifiedById,kcs_dev__Action__c,kcs_dev__Created_By__c,kcs_dev__Created_Date__c,kcs_dev__Display__c,kcs_dev__Section__c,kcs_dev__User_Id__c,kcs_dev__user_Name__c from kcs_dev__Audit_Trail__c];
    System.assertEquals(true,kcs_dev_audit_trail_Obj.size()>0);
    AuditIntegrationupdate obj01 = new AuditIntegrationupdate();
    AuditIntegrationupdate.auditupdate();
  }
}