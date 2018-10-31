<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Activate_License_for_Lead</fullName>
        <description>Activate License for Lead</description>
        <protected>false</protected>
        <recipients>
            <recipient>simon.w@autorabit.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>vijay@39demo.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/AutoRABIT_Trial_Initated</template>
    </alerts>
    <alerts>
        <fullName>Email_alert_reminder_for_Sales_Executive_to_fill_out_the_Sales_Order_Form</fullName>
        <description>Email alert reminder for Sales Executive to fill out the Sales Order Form</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Order_Form/Sales_Order_Form_reminder</template>
    </alerts>
    <alerts>
        <fullName>Email_to_Notify_PreSales_when_Trial_is_Expired</fullName>
        <description>Email to Notify PreSales when Trial is Expired</description>
        <protected>false</protected>
        <recipients>
            <recipient>bhargavi@39demo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>brad.b@techsophy.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>navneeth@39demo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>niranjan.g@39demo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>paul.d@39demo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>simon.w@autorabit.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>vijay@39demo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>vishnu@autorabit.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Final_Activation</template>
    </alerts>
    <alerts>
        <fullName>Final_Week_of_Trial</fullName>
        <description>Final Week of Trial</description>
        <protected>false</protected>
        <recipients>
            <field>Contact_Name__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Final_Activation</template>
    </alerts>
    <alerts>
        <fullName>First_Week_of_Trial</fullName>
        <description>First Week of Trial</description>
        <protected>false</protected>
        <recipients>
            <field>Contact_Name__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Second_Activation_Email</template>
    </alerts>
    <alerts>
        <fullName>QBR</fullName>
        <ccEmails>csg@autorabit.com</ccEmails>
        <description>QBR</description>
        <protected>false</protected>
        <recipients>
            <recipient>corpadmin@autorabit.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Initiate_QBR</template>
    </alerts>
    <alerts>
        <fullName>Subs_Activation_mail</fullName>
        <ccEmails>subscriptions@autorabit.com</ccEmails>
        <description>Subs Activation mail</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Subscription_Activation_Request</template>
    </alerts>
    <fieldUpdates>
        <fullName>Amount_Update</fullName>
        <field>Amount</field>
        <formula>Opportunity_Amount__c</formula>
        <name>Amount Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Oppt_Amount_New_Logs_upsell</fullName>
        <field>Oppt_Amout_New_Logs_upsell__c</field>
        <formula>IF(New__c==true,  Opportunity_Amount__c  ,IF( Upsell__c ==true,  Opportunity_Amount__c  ,Null) )</formula>
        <name>Oppt Amount New Logs+upsell</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Oppt_Amount_New_Update</fullName>
        <description>If Oppurtunity is New Then update Oppt Amount New Field</description>
        <field>Oppt_Amout_New_Logs_upsell__c</field>
        <formula>IF( New__c ==True,  Opportunity_Amount__c , Null)</formula>
        <name>Oppt Amount New Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Oppt_Amount_Renewal_Update</fullName>
        <field>Oppt_Amout_Renewal__c</field>
        <formula>IF(  Renewal__c ==True, Opportunity_Amount__c , Null)</formula>
        <name>Oppt Amount Renewal Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Oppt_Amount_Upsell_Update</fullName>
        <field>Oppt_Amout_Upsell__c</field>
        <formula>IF(Upsell__c ==True, Opportunity_Amount__c , Null)</formula>
        <name>Oppt Amount Upsell Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Renewal</fullName>
        <field>Oppt_Amout_Renewal__c</field>
        <formula>IF(Renewal__c==true,  Opportunity_Amount__c ,Null)</formula>
        <name>Renewal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Amount_Field</fullName>
        <field>Amount</field>
        <formula>Opportunity_Amount__c</formula>
        <name>Update Amount Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Amount_based_on_Subs_PS</fullName>
        <description>Update Amount based on Subs &amp; PS</description>
        <field>Amount</field>
        <formula>If( isblank( Discount__c), (No_of_Subscriptions__c * 299 *  of_Months__c  +  PS_Hrs__c *250) , (No_of_Subscriptions__c * 299 * of_Months__c  +  PS_Hrs__c *250)- (Discount__c*(No_of_Subscriptions__c * 299 * of_Months__c +  PS_Hrs__c *250)))</formula>
        <name>Update Amount based on Subs &amp; PS</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Opp_owner</fullName>
        <field>OwnerId</field>
        <lookupValue>corpadmin@autorabit.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Update Opp owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Stage_Negotiation_Set_Date</fullName>
        <description>Update Stage &quot;Negotiation&quot; Set Date</description>
        <field>Stage_Negotiation_Set_Date__c</field>
        <formula>now()</formula>
        <name>Update Stage &quot;Negotiation&quot; Set Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Stage_PriorValue_on_Oppty</fullName>
        <description>Update Stage PriorValue on Oppty</description>
        <field>PriorStage__c</field>
        <formula>text(priorvalue(StageName))</formula>
        <name>Update Stage PriorValue on Oppty</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Stage_Proposal_Set_Date</fullName>
        <description>Update Stage &quot;Proposal&quot; Set Date</description>
        <field>Stage_Proposal_Set_Date__c</field>
        <formula>now()</formula>
        <name>Update Stage &quot;Proposal&quot; Set Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Stage_Trial_completed_Set_Date</fullName>
        <description>Update Stage &quot;Trial completed&quot; Set Date</description>
        <field>Stage_Trial_completed_Set_Date__c</field>
        <formula>now()</formula>
        <name>Update Stage &quot;Trial completed&quot; Set Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_Field</fullName>
        <field>StageName</field>
        <literalValue>Trial Expired</literalValue>
        <name>Update Status Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_of_days_in_Negotiation</fullName>
        <description>Update &apos;# of days in Negotiation&apos;</description>
        <field>of_days_in_Negotiation__c</field>
        <formula>today() - datevalue( Stage_Negotiation_Set_Date__c )</formula>
        <name>Update &apos;# of days in Negotiation&apos;</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_of_days_in_PG</fullName>
        <description>Update &apos;# of days in Playground&apos;</description>
        <field>days_in_Playground__c</field>
        <formula>today() - datevalue( Stage_Playground_Set_Date__c )</formula>
        <name>Update &apos;# of days in Playground&apos;</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_of_days_in_Playground</fullName>
        <field>Stage_Playground_Set_Date__c</field>
        <formula>now()</formula>
        <name>Update Playground Set Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_of_days_in_Proposal</fullName>
        <description>Update &apos;# of days in Proposal&apos;</description>
        <field>of_days_in_Proposal__c</field>
        <formula>today() - datevalue( Stage_Proposal_Set_Date__c )</formula>
        <name>Update &apos;# of days in Proposal&apos;</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_of_days_in_Trial_Completed</fullName>
        <description>Update &apos;# of days in Trial Completed&apos;</description>
        <field>of_days_in_Trail_Completed__c</field>
        <formula>today() - datevalue( Stage_Trial_completed_Set_Date__c )</formula>
        <name>Update &apos;# of days in Trial Completed&apos;</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Upsell_Renewal</fullName>
        <description>If Opportunity Amount field is Upsell + Renewal then update this field</description>
        <field>Oppt_Amout_Renewal__c</field>
        <formula>IF(Renewal__c==true,  Opportunity_Amount__c  ,IF( Upsell__c ==true,  Opportunity_Amount__c  ,Null) )</formula>
        <name>Upsell + Renewal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Upsell_Renewal_r</fullName>
        <field>Oppt_Amout_Renewal__c</field>
        <formula>IF( Upsell__c ==true,  Opportunity_Amount__c , Null)</formula>
        <name>Upsell + Renewal_r</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>When_Trial_End_Date_is_Reached</fullName>
        <field>StageName</field>
        <literalValue>Trial Expired</literalValue>
        <name>When Trial End Date is Reached</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>AutoRABIT - Trial Expiry</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Evaluation_End_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Email_to_Notify_PreSales_when_Trial_is_Expired</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Opportunity.Evaluation_End_Date__c</offsetFromField>
            <timeLength>-2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>AutoRABIT -Trial Initiated</fullName>
        <actions>
            <name>Activate_License_for_Lead</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Trial Initiated</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AutoRABIT- First Week of Trial</fullName>
        <actions>
            <name>First_Week_of_Trial</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>Evaluation_Start_Date__c  + 7=TODAY()</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Oppty Amt to Amt</fullName>
        <actions>
            <name>Amount_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Opportunity_Amount__c  &gt; 0</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>QBR</fullName>
        <actions>
            <name>QBR</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won-Implementation Incomplete</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Sales Order Form reminder</fullName>
        <actions>
            <name>Email_alert_reminder_for_Sales_Executive_to_fill_out_the_Sales_Order_Form</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Please_fill_out_Sales_Order_Form</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <description>This workflow rule is used to remind the sales person to fill out the Sales Order Form through email and task alerts.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update %23 of days in Negotiation</fullName>
        <actions>
            <name>Update_of_days_in_Negotiation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Stage_Negotiation_Set_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PriorStage__c</field>
            <operation>equals</operation>
            <value>Negotiation</value>
        </criteriaItems>
        <description>Update # of days in Negotiation</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update %23 of days in Playground</fullName>
        <actions>
            <name>Update_of_days_in_PG</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Stage_Playground_Set_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PriorStage__c</field>
            <operation>equals</operation>
            <value>Playground</value>
        </criteriaItems>
        <description>Update # of days in Playground</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update %23 of days in Proposal</fullName>
        <actions>
            <name>Update_of_days_in_Proposal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Stage_Proposal_Set_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PriorStage__c</field>
            <operation>equals</operation>
            <value>Proposal</value>
        </criteriaItems>
        <description>Update # of days in Proposal</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update %23 of days in Trail Completed</fullName>
        <actions>
            <name>Update_of_days_in_Trial_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Stage_Trial_completed_Set_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PriorStage__c</field>
            <operation>equals</operation>
            <value>Trial Completed</value>
        </criteriaItems>
        <description>Update # of days in Trail Completed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Amount on Opportunity based on Subs %26 PS</fullName>
        <actions>
            <name>Update_Amount_based_on_Subs_PS</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.No_of_Subscriptions__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Update Amount on Opportunity based on Subs &amp; PS</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Negotiation Set Date</fullName>
        <actions>
            <name>Update_Stage_Negotiation_Set_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update Negotiation Set Date</description>
        <formula>ISCHANGED( StageName ) &amp;&amp; Ispickval(StageName, &apos;Negotiation&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Opp owner based on opp source field</fullName>
        <actions>
            <name>Update_Opp_owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Opportunity_Source__c</field>
            <operation>equals</operation>
            <value>Partner Referral</value>
        </criteriaItems>
        <description>Updates the opportunity owner if partner referral is selected as the opportunity source.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Oppt Amount New</fullName>
        <actions>
            <name>Oppt_Amount_New_Logs_upsell</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Oppt_Amount_New_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Renewal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Opportunity_Amount__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Playground Set Date</fullName>
        <actions>
            <name>Update_of_days_in_Playground</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update Playground Set Date</description>
        <formula>ISCHANGED( StageName ) &amp;&amp; Ispickval(StageName, &apos;Playground&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update PriorStage value</fullName>
        <actions>
            <name>Update_Stage_PriorValue_on_Oppty</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update prior  Stage of an Oppty</description>
        <formula>ischanged(StageName)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Proposal set Date</fullName>
        <actions>
            <name>Update_Stage_Proposal_Set_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update Proposal set Date</description>
        <formula>ISCHANGED( StageName ) &amp;&amp; Ispickval(StageName, &apos;Proposal&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Trail Completed Set Date</fullName>
        <actions>
            <name>Update_Stage_Trial_completed_Set_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update Trail Completed Set Date</description>
        <formula>ISCHANGED( StageName ) &amp;&amp; Ispickval(StageName, &apos;Trial Completed&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>subs Activation</fullName>
        <actions>
            <name>Subs_Activation_mail</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won,Closed Won-Implementation Incomplete</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Please_fill_out_Sales_Order_Form</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please go to the opportunity the task is assigned to and fill out the Sales Order Form.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Please fill out Sales Order Form</subject>
    </tasks>
</Workflow>
