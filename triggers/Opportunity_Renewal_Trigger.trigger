trigger Opportunity_Renewal_Trigger on Opportunity (After update) {
    
    If(Avoid_Trigger_Recursion.firstRun){
        
        Avoid_Trigger_Recursion.firstRun=false;
        ClassRenewalOppClone updater = new ClassRenewalOppClone();
        updater.cloneOpp(Trigger.new, trigger.oldMap);
    }
}