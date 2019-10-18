public class Detail_Page_Notifieer {
    
    public kcs_dev__A__c a;
    
    public Detail_Page_Notifieer(Apexpages.StandardController controller ){
        
        this.a=(kcs_dev__A__c) controller.getRecord();
        System.debug('this.a'+this.a);
    }
    
    Public PageReference Load(){
        kcs_dev__A__c record=[select id,createdDate,kcs_dev__One__c from kcs_dev__A__c where id=:this.a.Id];
        System.debug('record'+record);
        If(record.kcs_dev__One__c=='test'){
            
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.INFO,'Hello World'));
        }
       
         return null;
    }
    
}