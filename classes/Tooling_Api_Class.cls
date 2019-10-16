public class Tooling_Api_Class {
    
    Public Static void OrgCred(){
        ToolingAPI toolingApi = new ToolingAPI();
        List<ToolingAPIWSDL.CustomObject> customObjects =
            (List<ToolingAPIWSDL.CustomObject>)toolingAPI.query('Select Id, DeveloperName, NamespacePrefix From CustomObject Where DeveloperName = \'A\'','ToolingAPIWSDL.CustomObject').records;
        
        ToolingAPIWSDL.CustomObject customObject = customObjects[0];
        Id customObjectId = customObject.Id;
        List<ToolingAPIWSDL.CustomField> customFields = (List<ToolingAPIWSDL.CustomField>)
            
            ToolingAPI.query('Select Id, DeveloperName, NamespacePrefix, TableEnumOrId From CustomField Where DeveloperName= \'one\'','ToolingAPIWSDL.CustomField').records;
      
        System.debug(customObject.DeveloperName + '__c : ' + customObject.Id);
        for(ToolingAPIWSDL.CustomField customField : customFields){
            
            System.debug(customObject.DeveloperName + '__c.' + customField.DeveloperName + '__c : ' +customField.Id);
            
        }
        
    }
}