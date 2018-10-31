<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Discount_Given</fullName>
        <field>Discount__c</field>
        <formula>1- ( UnitPrice/ ListPrice )</formula>
        <name>Update Discount Given</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update Amount Field</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Opportunity_Amount__c</field>
            <operation>greaterOrEqual</operation>
            <value>0</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Discount</fullName>
        <actions>
            <name>Update_Discount_Given</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.UnitPrice</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>WFR to update discount percentage of a Product based on Sale price</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
