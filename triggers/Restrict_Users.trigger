trigger Restrict_Users on Opportunity (before delete) {
    
    for(Opportunity opp:Trigger.old){
        if(opp.StageName=='Closed Won'){
            
             opp.adderror('opp Cannot be deleted');
            
        }
        
    }

}