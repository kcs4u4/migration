({
	fireAppEvent : function(cmp,event) {
          console.log("-------------");
        var appEvent= $A.get("e.c:aeEvent");
      
        appEvent.setParams({
            "message":"This is application Event"
             });
		 appEvent.fire();
	}
})