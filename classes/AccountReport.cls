public with sharing class AccountReport {
    
    Public List<Account> acc{set;get;}
    public Account acct{set;get;}
    
    public AccountReport(ApexPages.StandardController controller){
        this.acct=(Account)controller.getRecord();
    }
    
    public void recordValues(){
    acc=[select id,name,type from Account  ];
        System.debug('acc'+acc);
    }
    
}