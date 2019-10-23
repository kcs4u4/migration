({
	appHandler : function(cmp, event) {
        var message=event.getParam("message");
        console.log(message);
        cmp.set("v.messsagefromevent",message);
        var handlercount=parseInt(cmp.get("v.noOfEvents"))+1;
        cmp.set("v.noOfEvents" , handlercount);
		
	}
})