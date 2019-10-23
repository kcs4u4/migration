({
	han : function(component, event, helper) {
        var navEvent=$A.get("e.force:navigateToSObject");
        navEvent.setParams({
            "recordID":component.get("v.recordId")
        });
        navEvent.fire();
 		
	}
})