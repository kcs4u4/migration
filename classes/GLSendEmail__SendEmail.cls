/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SendEmail {
    global SendEmail() {

    }
    @InvocableMethod(label='Send Email')
    global static void Sendemail(List<GLSendEmail.SendEmail.InvokeSendEmail> requests) {

    }
global class InvokeSendEmail {
    @InvocableVariable(label='bccAddresses' description='' required=false)
    global String bccAddresses;
    @InvocableVariable(label='ccAddresses' description='' required=false)
    global String ccAddresses;
    @InvocableVariable(label='Contact/Lead/User ID' description='Required if you use an email template' required=false)
    global Id ContactorLeadID;
    @InvocableVariable(label='Attachment - ContentDocument' description='ContentDocumentId' required=false)
    global String ContentDocumentId;
    @InvocableVariable(label='Attachment - ContentVersion' description='ContentVersionId' required=false)
    global String ContentVersionId;
    @InvocableVariable(label='emailOptOutPolicy' description='' required=false)
    global String emailOptOutPolicy;
    @InvocableVariable(label='Email Template Id' description='Contact/Lead/User ID required if you use this' required=false)
    global Id EmailTemplateId;
    @InvocableVariable(label='Email Template Unique Name' description='API Name  -- Contact/Lead/User ID required if you use this' required=false)
    global String EmailTemplateName;
    @InvocableVariable(label='HtmlBody' description='' required=false)
    global String HtmlBody;
    @InvocableVariable(label='OrgWideEmailAddress' description='' required=false)
    global String OrgWideEmailAddress;
    @InvocableVariable(label='plainTextBody' description='' required=false)
    global String plainTextBody;
    @InvocableVariable(label='Related To ID' description='' required=false)
    global Id RelatedToId;
    @InvocableVariable(label='Save As Activity' description='' required=false)
    global Boolean SaveAsActivity;
    @InvocableVariable(label='subject' description='' required=false)
    global String subject;
    @InvocableVariable(label='ToAddresses' description='' required=false)
    global String ToAddresses;
    @InvocableVariable(label='setTreatTargetObjectAsRecipient' description='' required=false)
    global Boolean TreatBodiesAsTemplate;
    @InvocableVariable(label='Use Signature' description='' required=false)
    global Boolean UseSignature;
    global InvokeSendEmail() {

    }
}
}
