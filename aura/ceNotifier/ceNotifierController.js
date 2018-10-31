({
	fireComponentEvent : function(component, event) {
        var cmpEvent=component.getEvent("cmpEvent");
        console.log("cmpEvent"+cmpEvent);
        cmpEvent.setParams({
            "message":  "A component event fired me. " +
            "It all happened so fast. Now, I'm here!" });
        cmpEvent.fire();
        
        }	
})