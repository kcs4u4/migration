({
    doInit : function(component, event) {
        var action=component.get("c.getMyMap");
        
        action.setCallback(this, function(response){
            var status=response.getState();
            console.log(status);
            if(status==="SUCCESS"){
                var myMap=response.getReturnValue();
                     component.set('v.objectrecords',myMap);
             //   component.set('v.myMap',response.getReturnValue());
            }
       
        });
        $A.enqueueAction(action);
    }	
})