@isTest
private class AuditTrail_to_CustomObject_Test{
  @testSetup
  static void setupTestData(){
    System.test.startTest();
    kcs_dev__Audit_Trail__c kcs_dev_audit_trail_Obj = new kcs_dev__Audit_Trail__c(CreatedDate = DateTime.now(),LastModifiedDate = DateTime.now(),kcs_dev__Section__c='AuthProvider',kcs_dev__Display__c='Test',kcs_dev__User_Id__c='00528000002rgux',kcs_dev__user_Name__c='Chandrashkhargoud');
      System.debug('kcs_dev_audit_trail_Obj'+kcs_dev_audit_trail_Obj);
    Insert kcs_dev_audit_trail_Obj; 
    System.test.stopTest();
  }
  static testMethod void test_usertocon_UseCase1(){
    List<kcs_dev__Audit_Trail__c> kcs_dev_audit_trail_Obj  =  [SELECT CreatedDate,CreatedById,LastModifiedDate,LastModifiedById from kcs_dev__Audit_Trail__c];
    System.assertEquals(true,kcs_dev_audit_trail_Obj.size()>0);
    AuditTrail_to_CustomObject obj01 = new AuditTrail_to_CustomObject();
    AuditTrail_to_CustomObject.usertocon();
  }
}