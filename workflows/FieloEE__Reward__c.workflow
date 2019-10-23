<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>FieloEE__RewardStockWarning</fullName>
        <description>Reward stock warning</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FieloEE__FieloTemplates/FieloEE__RewardStockWarning</template>
    </alerts>
    <rules>
        <fullName>FieloEE__Stock warning</fullName>
        <actions>
            <name>FieloEE__RewardStockWarning</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>(ISPICKVAL(FieloEE__VoucherCreationMode__c, &apos;Controlled By Quantity&apos;)  &amp;&amp; (FieloEE__StockWarning__c  &gt;=  FieloEE__Stock__c)) || (ISPICKVAL(FieloEE__VoucherCreationMode__c, &apos;Controlled By Item&apos;)  &amp;&amp; (FieloEE__StockWarning__c  &gt;=  FieloEE__QuantityAvailable__c))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
