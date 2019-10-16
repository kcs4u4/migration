public class importDataFromCSVController {
    public Blob csvFileBody{get;set;}
    public string csvAsString{get;set;}
    public String[] csvFileLines{get;set;}
    public String[] csvRecordData;
    public List<account> acclist{get;set;}
    public List<contact> conlist{get;set;}
    public List<contact> accconlist{get;set;}
    Public ID acctID;    
    public importDataFromCSVController(){
        csvFileLines = new String[]{};
            acclist = New List<Account>();
        conlist=New List<Contact>();
        accconlist=New List<Contact>();
        
    }
    
    public  void importCSVFile(){
        try{
            csvAsString = csvFileBody.toString();
            csvFileLines = csvAsString.split('\n');
            System.debug('csvFileLines.size()'+csvFileLines.size());
            for(Integer i=1;i<csvFileLines.size();i++){
                Account accObj = new Account() ;
                csvRecordData = csvFileLines[i].split(',');
                System.debug('csvRecordData'+csvRecordData);
                List<Account> aquery= [select id,name from Account where name=: csvRecordData[0]];
                System.debug('aquery.size()'+aquery.size());
                if(aquery.size()>=1){
                    
                    For(Account a2:aquery ){
                        System.debug('a2***'+a2);
                     
                            Contact c= new Contact();
                            string[] csvRecordData = csvFileLines[i].split(',');
                            c.AccountId= a2.id;
                            System.debug('c.AccountId5555'+c.AccountId);
                            c.FirstName=csvRecordData[1];
                            System.debug('csvRecordData[1]'+csvRecordData[1]);
                            System.debug(' c.FirstName'+ c.FirstName);
                            c.LastName=csvRecordData[2];
                            c.Phone=csvRecordData[3];
                            System.debug('c.Phone'+ c.Phone);
                            conlist.add(c); 
                            System.debug('conlist'+conlist);
                           
                               
                               
                    }
                        insert conlist;
                        
                }
              
                else{
                    accObj.name = csvRecordData[0] ;
                    System.debug('csvRecordData[0]'+csvRecordData[0]); 
                    acclist.add(accObj);
                    System.debug('acclist'+acclist);
                    insert acclist;
                    
                    For(Account a:acclist ){
                       
                            Contact c= new Contact();
                            string[] csvRecordData = csvFileLines[i].split(',');
                            c.AccountId= a.id;
                            c.FirstName=csvRecordData[1];
                            System.debug('csvRecordData[1]'+csvRecordData[1]);
                            System.debug(' c.FirstName'+ c.FirstName);
                            c.LastName=csvRecordData[2];
                            c.Phone=csvRecordData[3];
                            System.debug('c.Phone'+ c.Phone);
                            accconlist.add(c); 
                            System.debug('conlist'+conlist);
                            insert accconlist;
                        
                        
                    }
                    
                } 
            }
        }
        catch (Exception e)
        {
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured while importin data Please make sure input csv file is correct');
            ApexPages.addMessage(errorMessage);
        }  
            }
}