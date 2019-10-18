public with sharing class L1_Case {
    
    public Case case1{set;get;}
    
    
    Public L1_Case(ApexPages.StandardController controller){
        Id id = ApexPages.currentPage().getParameters().get('id');
        System.debug('id'+id);
        case1 = (id == null) ? new Case():[select id from Case where Id=:id];
            }
    
    public L1_Case(){
        case1=new Case();
    }
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