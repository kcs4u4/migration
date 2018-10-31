trigger Check_Duplicates on Account (before insert) {
    
    For(Account acc:Trigger.New){
        
       List<Account> myAcc=[select id ,name from Account where name=:acc.Name];
        
        if(myAcc.size()>=1){
               acc.Name.addError('Account with same Name already Existing');     
        }
    }

}