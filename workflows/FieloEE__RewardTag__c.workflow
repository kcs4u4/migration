<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>FieloEE__RewardTagName</fullName>
        <field>Name</field>
        <formula>FieloEE__Tag__r.Name</formula>
        <name>RewardTagName</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>FieloEE__RewardTagName</fullName>
        <actions>
            <name>FieloEE__RewardTagName</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
