<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>FieloEE__InstantReward</fullName>
        <description>Instant Reward</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FieloEE__FieloTemplates/FieloEE__InstantReward</template>
    </alerts>
    <rules>
        <fullName>FieloEE__Notify Instant Reward</fullName>
        <actions>
            <name>FieloEE__InstantReward</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>FieloEE__RedemptionItem__c.FieloEE__isInstantRedemption__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
