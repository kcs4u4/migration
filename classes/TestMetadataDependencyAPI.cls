public class TestMetadataDependencyAPI {
    
   ToolingAPI toolingAPI = new ToolingAPI();
   List<ToolingAPIWSDL.CustomObject> customObjects = (List<ToolingAPIWSDL.CustomObject>) toolingAPI.query(
   'Select Id, DeveloperName, NamespacePrefix From'+
   'CustomObject Where NamespacePrefix = \'c\''
   ).records;


}