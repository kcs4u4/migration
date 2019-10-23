<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>FieloEE__FillMemberSegmentCombination</fullName>
        <field>FieloEE__MemberSegmentCombination__c</field>
        <formula>CASESAFEID(FieloEE__Member2__c) + CASESAFEID(FieloEE__Segment2__c)</formula>
        <name>Fill Member Segment Combination</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>FieloEE__Member Segment Uniqueness</fullName>
        <actions>
            <name>FieloEE__FillMemberSegmentCombination</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
