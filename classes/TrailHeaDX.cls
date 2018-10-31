public class TrailHeaDX {
    
 public TrailHeaDX__c trail;
    
     public TrailHeaDX(ApexPages.StandardController stdController)
    {
        
        trail= new TrailHeaDX__c();    
    }
    public TrailHeaDX__c gettrail() {
      return trail;
  }
    
    public PageReference TrailHead()
    {
        
        insert(trail);
        
        PageReference ref = new PageReference('https://na43.salesforce.com/a0l/e?retURL=%2Fa0l%2Fo');
      //  ref.getParameters().put('CPName',ApexPages.currentPage().getParameters().get('name'));
        ref.setRedirect(true);
        return ref;
    }


}