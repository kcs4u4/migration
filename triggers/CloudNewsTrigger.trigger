trigger CloudNewsTrigger on kcs_dev__Cloud_News__e (after insert) {
    
    List<Case> cases= new List<Case>();
    Group queue= [select id from Group where Name = 'NEWTESTGROUP' Limit 1];
    
    For(kcs_dev__Cloud_News__e c: Trigger.New){
        if(c.Urgent__c==True){
            case cs=new case();
            cs.Priority = 'High';
            cs.Subject = 'News team dispatch to ' + c.Location__c;
            cs.OwnerId=queue.id;
            cases.add(cs);
            
        }
    }
    insert cases;
    
}