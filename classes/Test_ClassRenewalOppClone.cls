@isTest
public class Test_ClassRenewalOppClone {
    
    
    static testMethod void validateClassRenewalOppClone(){
        List<Opportunity> opp1= new List<Opportunity>();
        Map<id,Opportunity> opp2= new Map<id,Opportunity>();
        Account acc=new Account();
        acc.Name='test';
        acc.Primary_Email__c='abc@abc.com';
        acc.Business_Unit__c='AutoRabit';
        acc.Phone='588468684';
        insert acc;
        Opportunity opp=new Opportunity();
        opp.Name='test';
        opp.AccountId=acc.Id;
        opp.Competitors__c='Copado';
        opp.StageName='Closed Won';
        opp.CloseDate=Date.today();
        opp.Is_eligibile_for_Premier_support__c='yes';
        
        opp1.add(opp);
        insert opp1;
        System.assertEquals(opp.Name, 'test'); 
        
        
        opp2.put(opp.id, opp);
        
        Product2 prod = new Product2(Name = 'Laptop X200', Family = 'Hardware');
        insert prod;
        
        Id pricebookId = Test.getStandardPricebookId();
        
        PricebookEntry standardPrice = new PricebookEntry(
            Pricebook2Id = pricebookId, Product2Id = prod.Id,
            UnitPrice = 1, IsActive = true);
        insert standardPrice;
        
        
        Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
        insert customPB;
        Quote ol = new Quote();
        ol.opportunityid = opp.id;
        ol.Name='test';
        insert ol;
        
        
        Test.startTest();
        ClassRenewalOppClone oppclone=new ClassRenewalOppClone();
        oppclone.cloneOpp(opp1,opp2);
        
        Test.stopTest();
        
        
        
    }
    
}