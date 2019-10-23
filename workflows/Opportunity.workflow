<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>xsxs</fullName>
        <description>xsxs</description>
        <protected>false</protected>
        <recipients>
            <recipient>chandra@goud.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/asdasd</template>
    </alerts>
    <fieldUpdates>
        <fullName>Amount_Update</fullName>
        <field>Amount</field>
        <formula>Amount * of_months__c</formula>
        <name>Amount Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Opportunit rule1</fullName>
        <actions>
            <name>Amount_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
