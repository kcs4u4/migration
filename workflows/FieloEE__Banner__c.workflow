<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>FieloEE__Inactive</fullName>
        <field>FieloEE__isActive__c</field>
        <literalValue>0</literalValue>
        <name>Inactive</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>FieloEE__Inactive Banner</fullName>
        <actions>
            <name>FieloEE__Inactive</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>NOT(ISNEW()) &amp;&amp;  ( ISNULL(FieloEE__AttachmentId__c) || ISBLANK(FieloEE__AttachmentId__c) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
