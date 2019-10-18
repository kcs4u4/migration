public  class Search_Controller {
    @AuraEnabled
    
    Public static List<Account> fetchAccount(string searchkeyword){
      String searchkey=searchkeyword+'%';
        List<Account> searchResult= new List<Account>();
        List<Account> listofAccount=[select  id ,name from Account where name Like:searchkey limit 500];
        For(Account acc:listofAccount){
            searchResult.add(acc);
        }
        System.debug('searchResult:'+searchResult);
        return searchResult;
    }

}