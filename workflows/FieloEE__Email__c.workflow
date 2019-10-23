<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>FieloEE__Recomend</fullName>
        <description>send recomend mail</description>
        <protected>false</protected>
        <recipients>
            <field>FieloEE__Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FieloEE__FieloTemplates/FieloEE__Recomend</template>
    </alerts>
    <fieldUpdates>
        <fullName>FieloEE__DeleteEmail</fullName>
        <field>FieloEE__Deleted__c</field>
        <literalValue>1</literalValue>
        <name>Delete Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>FieloEE__Recomend</fullName>
        <actions>
            <name>FieloEE__Recomend</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>FieloEE__DeleteEmail</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>FieloEE__Email__c.FieloEE__Type__c</field>
            <operation>equals</operation>
            <value>Recommend</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
