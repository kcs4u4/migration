public class OpportunityContactController {
    
    Public String selectedyear{get; set;}
    Public List<Contact> contlist {get; set;}
    Public List<Contact> ContactsToShow{get; set;}
    Public List<Opportunity> opplist {get; set;}
    Public Set<Id> accset {get;set;} 
    Date dt1;
    Date dt2;
    public String Pagesize{get; set;}
    public Integer contcount {get; set;}
    Integer counter = 0;//TO track the number of records parsed
    Integer limitSize = 10;//Number of records to be displayed
    Integer totalSize =0; //To Store the total number of records available
    public Integer Totalpages {get; set;}
    public integer pageno {get;set;}
    //Public Opportunity opty {get; set;}
    Public String optystage {get; set;}
    public OpportunityContactController(){
        contcount = 0;
        Pagesize = '10';
        limitSize = integer.valueOf(pagesize);
        accset = new Set<Id>(); 
        ContactsToShow = new List<Contact>();
        //opty = new Opportunity();
        optystage  = 'Closed Won';
        // Further modified on request
        /*
        selectedyear = String.valueof(System.today().Year());
        dt1 = Date.newInstance(System.today().Year(),01,01);
        dt2 = Date.newInstance(System.today().Year(),12,31);
        Opplist = [select accountid from Opportunity where createddate>=:dt1 AND createddate<=:dt2];
        */
        selectedyear ='All';
        Opplist = [select accountid from Opportunity where stagename=:optystage ];
        for(Opportunity opp : opplist){
            accset.add(opp.accountid);
        }
        contlist = [select Name,firstname,lastname,phone,email,Account.name,Account.ownerid,Account.owner.name,mailingcountry from contact where accountid IN : accset];
        totalSize = contcount = contlist.size();
        Totalpages = totalSize >0 ? (totalsize/limitsize)+1 :(contlist.size()>0 && contlist.size() <limitsize?1:0);
        //Intial adding of contacts to ContactsToShow
        //check the total records are more than limitSize and assign the records
        if((counter+limitSize) <= totalSize){
            for(Integer i=0;i<limitSize;i++){
                ContactsToShow.add(contlist.get(i));
            }
        }else{
            for(Integer i=0;i<totalSize;i++){
                ContactsToShow.add(contlist.get(i));
            }
        }
        calculatePageno();
    }
    
    public List<SelectOption> getItems() {
            List<SelectOption> options = new List<SelectOption>();
            options.add(new SelectOption('All','All'));
            for(Integer i=1990 ;i<=2100;i++)
            options.add(new SelectOption(String.valueOf(i),String.valueOf(i)));
            return options;
        }
    
    public void loadcontacts(){
        contcount = 0;
        ContactsToShow.clear();
        contlist.clear();
        accset.clear();
        Opplist.clear();
        if(selectedyear=='All'){
            Opplist = [select accountid from Opportunity where stagename=:optystage ];
        }
        else{
            dt1 = Date.newInstance(integer.valueOf(selectedyear),01,01);
            dt2 = Date.newInstance(integer.valueOf(selectedyear),12,31);
            System.debug('dt1==='+dt1);   
            Opplist = [select accountid from Opportunity where createddate>=:dt1 AND createddate<=:dt2 and stagename=:optystage ];
        }   
        for(Opportunity opp : opplist){
            accset.add(opp.accountid);
        }
        contlist = [select Name,Firstname,LastName,phone,email,Account.name,Account.ownerid,Account.owner.name,mailingcountry  from contact where accountid IN : accset];
        System.debug('Contact list=='+optystage);
        totalSize = contcount = contlist.size();
        Totalpages = totalSize >0 ? (totalsize/limitsize)+1 :(contlist.size()>0 && contlist.size()<=limitsize?1:0);
        if((counter+limitSize) <= totalSize){
            for(Integer i=0;i<limitSize;i++){
                ContactsToShow.add(contlist.get(i));
            }
        }else{
            for(Integer i=0;i<totalSize;i++){
                ContactsToShow.add(contlist.get(i));
            }
        }
        calculatePageno();
    }
    
    public pagereference exporttoxls(){
        
        return page.ExporttoXls;
        
    }
    
    //Navigation methods
    
    
    public void beginning(){
   
        ContactsToShow.clear();
        counter=0;
        if((counter + limitSize) <= totalSize){
       
            for(Integer i=0;i<limitSize;i++){
                ContactsToShow.add(contlist .get(i));
            }   
           
        } else{
       
            for(Integer i=0;i<totalSize;i++){
                ContactsToShow.add(contlist .get(i));
            }       
           
        }
       calculatePageno();
    }
   
    public void next(){
   
        ContactsToShow.clear();
        counter=counter+limitSize;
       
        if((counter+limitSize) <= totalSize){
            for(Integer i=counter-1;i<(counter+limitSize);i++){
                ContactsToShow.add(contlist.get(i));
            }
        } else{
            for(Integer i=counter;i<totalSize;i++){
                ContactsToShow.add(contlist.get(i));
            }
        }
        calculatePageno();
    }
   
    public void previous(){
   
        ContactsToShow.clear();

        counter=counter-limitSize;       
       
        for(Integer i=counter;i<(counter+limitSize); i++){
            ContactsToShow.add(contlist.get(i));
        }
        calculatePageno();
    }

    public void last (){
   
        ContactsToShow.clear();
       
        if(math.mod(totalSize , limitSize) == 0){
            counter = limitSize * ((totalSize/limitSize)-1);
        } else if (math.mod(totalSize , limitSize) != 0){
            counter = limitSize * ((totalSize/limitSize));
        }
       
        for(Integer i=counter-1;i<totalSize-1;i++){
                ContactsToShow.add(contlist.get(i));
        }
       calculatePageno();
    }
    
    public Boolean getDisableNext(){
   
        if((counter + limitSize) >= totalSize )
            return true ;
        else
            return false ;
    }
   
    public Boolean getDisablePrevious(){
   
        if(counter == 0)
            return true ;
        else
            return false ;
    } 
    
    public void updatePagelimit(){
        limitSize = integer.valueOf(pagesize);
        loadcontacts();
        beginning();
        System.debug('ContactsToShow=='+ContactsToShow.size());
    }
 
    public void calculatePageno(){
        pageno = (counter/limitsize)+1;
    }
    
    //get picklist values
    
    public List<SelectOption> getPickListValuesIntoList(){
       List<SelectOption> pickListValuesList= new List<SelectOption>();
        Schema.DescribeFieldResult fieldResult = Opportunity.stagename.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValuesList.add(new SelectOption(pickListVal .getLabel(), pickListVal .getValue()));
        }     
        return pickListValuesList;
    }
}