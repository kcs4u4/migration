public Class Test01
{
public IntTest__c createAccount(Date name) 
{
IntTest__c t01= new IntTest__c();
t01.ITester__c= name;
return t01;
}
}