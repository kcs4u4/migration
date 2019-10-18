global class AuditTrail_to_CustomObject {
    
    public static void usertocon() {
        List<kcs_dev__Audit_Trail__c> Audit = new List<kcs_dev__Audit_Trail__c>();
        List<SetupAuditTrail> Setup = [SELECT Id,
                                       Action, CreatedBy.Name, CreatedBy.id, CreatedBy.Email, CreatedDate,Display,
                                       Section FROM SetupAuditTrail where CreatedDate=TODAY AND HOUR_IN_DAY(CreatedDate) > 1 ];
        System.debug('Setup' +setup);
        String sString;
        String actionString;
        for (SetupAuditTrail u: Setup){
            kcs_dev__Audit_Trail__c c = new kcs_dev__Audit_Trail__c();
            actionString=u.Action;
            System.debug('actionString'+actionString);
        // Apex Component
            if(u.Section=='Component' ){
                c.kcs_dev__Section__c='ApexComponent';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringAfter('Component');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
           // Apex Class 
            if(u.Section=='Apex Class' && u.Action=='createdApexClass'){
                c.kcs_dev__Section__c='ApexClass';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringBetween('Created ',' Apex Class code');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            } 
            if(u.Section=='Apex Class' && u.Action=='changedApexClass'){
                c.kcs_dev__Section__c='ApexClass';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringBetween('Changed ',' Apex Class code');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            if(u.Section=='Apex Class' && u.Action=='deletedApexClass'){
                c.kcs_dev__Section__c='ApexClass';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringBetween('Deleted ',' Apex Class code');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            // Apex Page
            if(u.Section=='Page'){
                c.kcs_dev__Section__c='ApexPage';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringAfter('Page ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            //Apex Trigger
              if(u.Section=='Apex Trigger'){
                c.kcs_dev__Section__c='ApexTrigger';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringAfter('Trigger code: ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            //Approval Process
              if(u.Section=='Approval Process'){
                c.kcs_dev__Section__c='ApprovalProcess';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringAfter('Approval Process: ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
             //AssignmentRule
              if(u.Section=='Customize Leads' || u.Section=='Customize Cases'){
                c.kcs_dev__Section__c='AssignmentRule';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringAfter('Assignment Rule ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email; 
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            //AuthProvider
              if(u.Section=='Auth. Providers'){
                c.kcs_dev__Section__c='AuthProvider';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringAfter('Auth. Provider ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
/*              //AutoResponseRule
              if((u.Section=='Customize Leads' || u.Section=='Customize Cases') ){
                c.kcs_dev__Section__c='AutoResponseRule';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringAfter('Auto-Response Rule ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email; 
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            } 
            //AutoResponseRule
              if((u.Section=='Customize Leads' || u.Section=='Customize Cases') ){
                c.kcs_dev__Section__c='AutoResponseRule';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringAfter('Auto-Response Rule ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email; 
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            } */
             //BusinessProcess
              if((u.Section=='' && u.Section==Null ) ){
                c.kcs_dev__Section__c='BusinessProcess';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringBetween('"','"');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email; 
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            //Certificate
              if(u.Section=='Certificate and Key Management' && (u.Action=='insertCertificate' || u.Action=='deleteCertificate' ) ){
                c.kcs_dev__Section__c='Certificate';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringAfter('Certificate');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email; 
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            //Certificate
              if(u.Section=='Certificate and Key Management' && (u.Action=='changeCertificateFriendlyName' || u.Action=='changeCertificateDeveloperName' ) ){
                c.kcs_dev__Section__c='Certificate';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringAfter('to');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email; 
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
             } 
           //CompactLayout 
              if(u.Section=='Custom Apps' && u.display.contains('Compact Layout')){
                c.kcs_dev__Section__c='CompactLayout';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringAfter('on')+'.'+sString.substringBetween('Compact Layout','on');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email; 
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }  
            //Connected App have to write

            //CustomApplication
              if(u.Section=='Custom Apps' && u.Action.contains('packagingapp') ){
                c.kcs_dev__Section__c='CustomApplication';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringAfter('package:');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email; 
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
             } 
             //CustomApplication
             if(u.Section=='Custom Apps' && (u.Action.contains('TabSet')) ){
                c.kcs_dev__Section__c='CustomApplication';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringAfter('app');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email; 
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
             } 
             //CustomFeedFilter
              if(u.Action=='createdFeedFilter' ){
                c.kcs_dev__Section__c='CustomFeedFilter';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringBetween('Feed Filter: ',' with');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email; 
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
             } 
              //CustomFeedFilter
             if(u.Action=='deletedFeedFilter' ){
                c.kcs_dev__Section__c='CustomFeedFilter';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringAfter('Feed Filter: ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email; 
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
             } 
              //CustomFeedFilter
             if(u.Action.contains('updatedFeedFilter') ){
                c.kcs_dev__Section__c='CustomFeedFilter';
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringAfter('to ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email; 
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
             } 

              //AnalyticSnapshot
            if(u.Section=='Reporting Snapshots' && u.Action=='createdReportJob'  ){
                c.kcs_dev__Section__c='AnalyticSnapshot';  
                sString=u.display;
                c.kcs_dev__Display__c=sString.substringAfter('Created reporting snapshot ');
                c.kcs_dev__Created_Date__c=u.CreatedDate;
                c.kcs_dev__Created_By__c=u.CreatedBy.Email;
                c.kcs_dev__User_Id__c=u.CreatedBy.id;
                c.kcs_dev__user_Name__c=u.CreatedBy.Name;
                Audit.add(c);
            }
            
   
            
            System.debug('Audit____'+Audit);
        }
           Database.SaveResult[] results = Database.insert(Audit);
       // insert Audit;
    } 
    
}