public class Sales_Send_Email {
    
    Public Sales_Send_Email(Apexpages.StandardSetController controller){}
    
    public PageReference getSendMail(){
        String id1=ApexPages.currentPage().getParameters().get('Id');
        System.debug('id1'+id1);
        Sales_Order_Form__c  t=[select id, X3rd_Party_Billing_Contact_Name__c,Account_Lookup__c,Address__c,AutoRABIT_Accounts__c,Approved_By__c,Approver_Email__c,Billing_Address__c,
Billing_contact_person_s_name__c,Billing_methodology_details__c,Client_Name__c,Email__c,Email_Invoice_to__c,
End_Client_Location__c,Hourly_cost__c,Invoicing_frequency__c,No_of_hours__c,No_of_months__c,
No_of_Subscriptions__c,No_of_Support__c,Opportunity__c,Opportunity_Lookup__c,Phone__c,Projected_End_Date__c,
Projected_Support_End_Date__c,Rate__c,Sales_Order_Form_Status__c,Sales_Person__c,Start_Date__c,Support_Rate__c,
Support_Start_Date__c,Was_any_3rd_party_services_used__c,Was_support_purchased__c,Who_will_AutoRABIT_pay_for_item__c from Sales_Order_Form__c where id=:id1];
        
        Contact recipient=new Contact(LastName='test',Email=t.AutoRABIT_Accounts__c);
        insert recipient;
        System.debug('Email'+t.AutoRABIT_Accounts__c);
        send(recipient.Id,t.id);
        
        pageReference pf= new pageReference('https://login.salesforce.com/a0E/o');
        System.debug('pf'+pf);
        pf.setRedirect(true);
        return pf;
    }
    
    public  void send(id recipient ,id t) {

        PageReference pdf = Page.SalesOrderExport; 
        pdf.getParameters().put('id',t);
        pdf.setRedirect(true);
        Blob b = pdf.getContent();
        // Create the email attachment
        Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
        efa.setFileName('Excel_attachment.XLS');
        efa.setBody(b);
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setTargetObjectId(recipient);
        email.setSubject('Sales Order Form');
        email.setPlainTextBody('Here is the Sales Order Form you had requested!');
        email.setFileAttachments(new Messaging.EmailFileAttachment[] {efa});
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});         
    }   
}