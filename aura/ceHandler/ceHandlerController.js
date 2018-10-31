({
	HandleComponent : function(component, event) {
        var message=event.getParam("message");
        console.log(message);
        component.set("v.MessageFromevent",message);
        var numbersofhandlins=parseInt(component.get("v.NumberofEvents"))+1;
         console.log(numbersofhandlins);
        component.set("v.NumberofEvents",numbersofhandlins);
         
       
		
	}
})