public class List_Colors {
    
    @AuraEnabled
    
    Public static List<Account> getMyMap(){
        
     List < Account > lstOfAcc = [select Name, AnnualRevenue, BillingState, (select LastName from contacts) from Account LIMIT 10];
        return lstOfAcc;
    }

}