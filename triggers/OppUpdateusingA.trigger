trigger OppUpdateusingA on A__c (After insert,After Update) {
    
    List<Opportunity> opps= new List<Opportunity>();
    
    Set<ID> dealsheetIds = new set<ID>();
    
    List<A__c> a1= [select id from A__c where id in:Trigger.newMap.keySet()];
     List<Opportunity> opp=[select id , A_Object__c from Opportunity];
    
    For(A__c a: a1){
        dealsheetIds.add(a.id);
      //  System.debug('DealsheteIds'+dealsheetIds);
      // List<Opportunity> opp=[select id , A_Object__c from Opportunity where id in:dealsheetIds ];
        
            for(Opportunity opp1:opp){    
                if(a.status__c=='Active'){
                    opp1.A_Object__c=True; 
            }
        else{
          
          if(a.status__c=='InActive'){
            opp1.A_Object__c=False;
            
            opps.add(opp1);
                }
        }
        }
    }
    update opps;
    

}