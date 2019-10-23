<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>FieloEE__AbuseDescription</fullName>
        <field>FieloEE__AbuseDescription__c</field>
        <name>Abuse Description</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>FieloEE__Abuse Description</fullName>
        <actions>
            <name>FieloEE__AbuseDescription</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>FieloEE__Comment__c.FieloEE__Status__c</field>
            <operation>equals</operation>
            <value>Ok</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
