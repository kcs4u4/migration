public class TicketWithSupportCtrl {
    public Attachment attach {get;set;}
    public Case c{get;set;}
    Public Contact contactObj; 
    Public string companyName{get;set;}
    public string Emailval {get;set;}
    public string subjectval {get;set;}
    public Boolean rendered{set;get;}
    Public string userPriority {get;set;}
    Public string featureTypeVal {get;set;}
    Public string loginInstance {get;set;}
    public string emailValue {get;set;}
    public List<Case> caseListAll {get;Set;}
    public List<Case> caseList {get;Set;}
    public Boolean hideTable {get;set;}
    public String filename{get;set;}
    public String body{get;set;}
    public TicketWithSupportCtrl(){
      companyName = 'Hello';  
      attach = new Attachment();
      caseList = new List<Case>();  
      c = new Case();
    }
    public List<SelectOption> Category
    {
        get
        {
            List<SelectOption> options = new List<SelectOption>();
            Schema.DescribeFieldResult fieldResult = case.Reason.getDescribe();
            
            List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
            
            for( Schema.PicklistEntry f : ple)
                options.add(new SelectOption(f.getLabel(), f.getValue()));
            return options;
            
        }
    }
    
    public List<SelectOption> Priority1
    {
        get
        {
           
            List<SelectOption> options = new List<SelectOption>();
            Schema.DescribeFieldResult fieldResult = case.Priority.getDescribe();
            
            List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
            
            for( Schema.PicklistEntry f : ple)
                options.add(new SelectOption(f.getLabel(), f.getValue()));
            return options;
            
        }
    }
    public void searchCases(){
        searchCaseList(emailValue);   
    }
    public Boolean searchCaseList(String searchString){
          system.debug('---CheckCall---');
          caseListAll = new List<Case>();
          caseList = new List<Case>();
          if(!String.isBlank(searchString))
          caseListAll = [SELECT CaseNumber, SuppliedName, Subject, Status, Reason, Type, SuppliedEmail, SuppliedCompany,Login_Url__c FROM Case WHERE SuppliedEmail =: searchString ORDER BY CaseNumber desc];

          for(Case c: caseListAll){
              if(c.Reason != 'Other' && c.Type != 'Other' && c.SuppliedEmail != '')
              {
                  caseList.add(c);                
              }            
          }

          hideTable = !caseList.isEmpty();
          return hideTable;
    }    
    
    public PageReference caseSave(){
        c.Priority=userPriority;
        c.Reason = featureTypeVal;
        c.Login_Url__c = loginInstance;
        insert c;
        if(attach.name!=null && attach.body!=null){
            attach.ParentId = c.Id;
            insert attach;
        }
        PageReference orderPage = new PageReference('/apex/newSupport');
        system.debug('------------------'+c);
        return orderPage;     
    } 
}