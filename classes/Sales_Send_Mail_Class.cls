public class Sales_Send_Mail_Class {
    
    public Sales_Order_Form__c c { get; set; }
    public String queue {get;set;} 
    public Sales_Order_Form__c  obj1  { get; set; }
    public List<Sales_Order_Form__c>  obj  { get; set; }
    public Sales_Send_Mail_Class(ApexPages.StandardController sc){
        Id id = ApexPages.currentPage().getParameters().get('id');
        c = (id == null) ? new Sales_Order_Form__c():[select id,Email__c,AutoRABIT_Accounts__c from Sales_Order_Form__c where id=:id];
                                                          }
    
    public Sales_Send_Mail_Class(){
        c=new Sales_Order_Form__c();
    }
    
    public List<SelectOption> options 
    {
        get
        {
            obj  = [SELECT Id, Name,Email__c,AutoRABIT_Accounts__c FROM Sales_Order_Form__c  ] ;
            System.debug('obj'+obj);
            options = new List<SelectOption>();
           options.add(new SelectOption('', 'select Record'));
            for(Sales_Order_Form__c temp : obj)
            {
                options.add(new SelectOption(temp.Id, temp.Name));
            }
            System.debug('options'+options);
            return options;
        }
        set;
    }
        public PageReference save() {
        try {
            c.id=queue;
            update c;  
            System.debug('c'+c);
            obj1 = [SELECT Id, Name,Phone__c,Email__c, AutoRABIT_Accounts__c FROM Sales_Order_Form__c  where id=:c.id ] ;
           
      System.debug('obj'+obj1);
            pageReference pf= new pageReference('https://login.salesforce.com/apex/Sales_Send_Email?scontrolCaching=1&id='+c.id);
            System.debug('pf'+pf);
            pf.getParameters().put('Id', queue);
            pf.setRedirect(true);
            return pf;
        }
        Catch(System.DmlException e)
        {
            ApexPages.addMessages(e);
            return null;
        }
        
        
        
    }
    
    
}