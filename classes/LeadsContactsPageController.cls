public class LeadsContactsPageController {
      
    Public String selectedyear{get; set;}
    Public transient static List<ContactInfo> contlist {get; set;}
    Public transient List<ContactInfo> ContactsToShow{get; set;}
    Public transient List<Opportunity> opplist {get; set;}
    public transient List<Lead> Leadlist {get;set;}
    public transient List<contact> ContactList{get;set;}
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
    public LeadsContactsPageController(){
        contcount = 0;
        Pagesize = '10';
        limitSize = integer.valueOf(pagesize);
        accset = new Set<Id>(); 
        ContactsToShow = new List<ContactInfo>();
        Contlist = new List<ContactInfo>();
        contactlist = new List<contact>();
        leadlist = new List<lead>();
        selectedyear ='All';
        contactlist = [select lastname,firstname,account.name,email,phone from contact];
        Leadlist =[select lastname,firstname,email,phone,company  from lead];
        for(contact c :contactlist){
            contlist.add(new ContactInfo(c.lastname,c.firstname,c.email,c.phone,'Contact',c.account.name));
        }
        for(Lead c :leadlist){
            contlist.add(new ContactInfo(c.lastname,c.firstname,c.email,c.phone,'lead',c.company));
        }
        //contlist = [select Name,firstname,lastname,phone,email,Account.name,Account.ownerid,Account.owner.name,mailingcountry from contact where accountid IN : accset];
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
        try{
        System.debug('navigation');
        contcount = 0;
        ContactsToShow = new List<ContactInfo>();
        Contlist = new List<ContactInfo>();
        contactlist = new List<contact>();
        leadlist = new List<lead>();
        if(selectedyear=='All'){
             contactlist = [select lastname,firstname,account.name,email,phone from contact];
        	Leadlist =[select lastname,firstname,email,phone,company  from lead];
        }
        else{
            dt1 = Date.newInstance(integer.valueOf(selectedyear),01,01);
            dt2 = Date.newInstance(integer.valueOf(selectedyear),12,31);
            System.debug('dt1==='+dt1);   
            contactlist = [select lastname,firstname,account.name,email,phone from contact where createddate>=:dt1 AND createddate<=:dt2 ];
        	Leadlist =[select lastname,firstname,email,phone,company from lead where createddate>=:dt1 AND createddate<=:dt2 ];
            //Opplist = [select accountid from Opportunity where createddate>=:dt1 AND createddate<=:dt2 and stagename=:optystage ];
        } 
        for(contact c :contactlist){
            contlist.add(new ContactInfo(c.lastname,c.firstname,c.email,c.phone,'Contact',c.account.name));
        }
        for(Lead c :leadlist){
            contlist.add(new ContactInfo(c.lastname,c.firstname,c.email,c.phone,'lead',c.company));
        }
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
        Catch(Exception e){
            System.debug('exception====='+e.getMessage());
            
        }
    }
    
    public pagereference exporttoxls(){
        
        return page.ExporttoXls;
        
    }
    
    //Navigation methods
    
    
    public void beginning(){
        try{
        ContactsToShow = new List<ContactInfo>();
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
        Catch(Exception e){
            System.debug('exception====='+e.getMessage());
            
        }     
    }
   
    public void next(){
        try{ System.debug('this is size'+contlist.size());
        ContactsToShow = new List<ContactInfo>();
        loadcontacts();   
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
        Catch(Exception e){
            System.debug('exception====='+e.getMessage());
            
        }
    }
   
    public void previous(){
        try{
       ContactsToShow = new List<ContactInfo>();

        counter=counter-limitSize;       
       
        for(Integer i=counter;i<(counter+limitSize); i++){
            ContactsToShow.add(contlist.get(i));
        }
        calculatePageno();
         }
        Catch(Exception e){
            System.debug('exception====='+e.getMessage());
            
        }    
    }

    public void last (){
        try{   
        ContactsToShow = new List<ContactInfo>();
       
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
        Catch(Exception e){
            System.debug('exception====='+e.getMessage());
            
        }
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
    
    //wrapper class
    public class ContactInfo{
        public String name{get; set;}
        public String email{get;set;}
        public String phone{get;set;}
        public String Company{get; set;}
        public String cType{get;set;}
        public ContactInfo(String fname,String lname,String mail,String mobile,String category,String Org){
            name= fname!=null?(fname+' '+lname):lname;
            email = mail;
            phone = mobile;
            ctype = category;
            company=org;
        }
    }
}