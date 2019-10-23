<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>New_Eamil</fullName>
        <ccEmails>kcs4u4@gmail.com</ccEmails>
        <description>New Eamil</description>
        <protected>false</protected>
        <recipients>
            <field>NewEmail__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/NewDependent</template>
    </alerts>
    <rules>
        <fullName>B</fullName>
        <actions>
            <name>New_Eamil</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>B__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
