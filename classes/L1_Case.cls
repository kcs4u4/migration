public with sharing class L1_Case {
    
    public Case case1{set;get;}
    String test = Label.ACLT11;
    String Test11=System.Label.Aclt111;
  
     //      Schema.FieldSet fs1 = Schema.SObjectType.Opportunity.fieldSets.getMap().get('Tsest'); 
    //  Id devRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Business Account').getRecordTypeId();    
    
     
    Public L1_Case(ApexPages.StandardController controller){
        Id id = ApexPages.currentPage().getParameters().get('id');
        System.debug('id'+id);
      //   List<Recordtype> recordTypeLst = new List<Recordtype>([SELECT Id, Name, DeveloperName FROM RecordType WHERE DeveloperName = 'Business Account' LIMIT 1]);
        case1 = (id == null) ? new Case():[select id ,CI_Job_Name__c ,Instance__c,Org_Name__c,CaseNumber,Login_Url__c ,Reason ,Other_Details__c ,Step_2_Url__c,case1_Text__c,Case1Check__c,Build_Deployement_log_Check__c,Build_Log_in_Path__c,Catalina_log_path_check__c,CI_Build__c,
                                           CI_Deployment__c,X3_4_AR_Related_check__c,Deployment_log_in_path__c ,CruisControl_Path_Check__c,Error_in_rabics_log_check__c,Error_In_Step_2_Check__c,Step_3_4_Related_Chek__c,Deployment_Label__c,Deplyoment_Source__c,
                                           Deployment_Destination__c,Depl_Salesforce_Error_Check__c,Depl_Salesforce_Error__c,Depl_AR_Error_Check__c,Depl_AR_Error__c,Creating_metadata_connection__c,Processing_the_userId_changes__c,Preparing_package__c,EZ_Creating_version_control__c,
                                           EZ_Valdating_version_control__c,EZ_Working_copy__c,EZ_Working_Copy_Not_Exists__c,EZ_Preparing_package__c,EZ_Preparing_destructive__c,EZ_Deleting_destructive__c,EZ_Deleted_destructive__c,
                                           EZ_SCM_working_copy__c,EZ_Adding_new_files__c,EZ_Commit_Process__c from Case where Id=:id];
            }
    
    public L1_Case(){
        case1=new Case();
    }
    Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
    public pageReference Save(){
        
       /* case1.L1TeamTime__c= case1.L1Time__c+case1.L1Time1__c+case1.L1Time2__c;
        System.debug('case1.L1TeamTime__c'+case1.L1TeamTime__c);*/
        update case1;  
        /*System.debug('case1'+case1);*/
        PageReference nextPage = new PageReference('/' + case1.Id);
        return nextPage;
    }
    public pageReference Cancel(){
        PageReference ref = new PageReference('/' + case1.Id);
        ref.setRedirect(true);
        return ref;
        
    }
}