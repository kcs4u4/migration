trigger MainTriggerOpportunity on Opportunity (after update) {
     If(Avoid_Trigger_Recursion.firstRun){
        
        Avoid_Trigger_Recursion.firstRun=false;
   
    ClassRenewalOppClone updater13 = new ClassRenewalOppClone();
   
    updater13.cloneOpp(Trigger.new, trigger.oldMap);

     }
}