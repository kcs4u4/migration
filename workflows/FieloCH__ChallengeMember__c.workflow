<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>FieloCH__AccomplishedChallengeAlert</fullName>
        <description>Accomplished Challenge Alert</description>
        <protected>false</protected>
        <recipients>
            <field>FieloCH__MemberEmail__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FieloEE__FieloTemplates/FieloCH__ChallengeAccomplished</template>
    </alerts>
    <fieldUpdates>
        <fullName>FieloCH__EmailUpdate</fullName>
        <field>FieloCH__MemberEmail__c</field>
        <formula>FieloCH__Member__r.FieloEE__Email__c</formula>
        <name>Email Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>FieloCH__Accomplished Challenge</fullName>
        <actions>
            <name>FieloCH__AccomplishedChallengeAlert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>FieloCH__ChallengeMember__c.FieloCH__Status__c</field>
            <operation>equals</operation>
            <value>Accomplished</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FieloCH__Email Update</fullName>
        <actions>
            <name>FieloCH__EmailUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
