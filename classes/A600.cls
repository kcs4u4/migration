public Class A600
{
    Public list<CRM_Request__c> test;
public Account createAccount(String name)  //method to create account
{
//sai Add comment for Account A1
//saikumar Test1
Account a01111= new Account();
a01111.Name = name;
return a01111;
}
}