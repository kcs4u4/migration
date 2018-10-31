<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_Notification_Contact_form</fullName>
        <ccEmails>sales@autorabit.com</ccEmails>
        <description>Email Notification - Contact form (WebSite)</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderAddress>sales@autorabit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/WebToLead_AutoResponse_Rule</template>
    </alerts>
    <alerts>
        <fullName>Lead_is_Converted</fullName>
        <description>Lead is Converted</description>
        <protected>false</protected>
        <recipients>
            <recipient>abhilash.m@autorabit.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>niranjan.g@39demo.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>simon.w@autorabit.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>sales@autorabit.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Test_Convert</template>
    </alerts>
    <alerts>
        <fullName>New_Lead_Notification</fullName>
        <ccEmails>prashanth.s@autorabit.com</ccEmails>
        <description>New Lead Notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>arvind.t@autorabit.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>corpadmin@autorabit.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jeff.s@autorabit.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sherdah.m@autorabit.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>venkatesh.t@autorabit.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Lead_Notification</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update</fullName>
        <field>DC_Scheduled_For__c</field>
        <formula>DC_Scheduled_For__c</formula>
        <name>Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_SDR</fullName>
        <field>SDR__c</field>
        <formula>$User.FirstName +&apos; &apos;+$User.LastName</formula>
        <name>Update SDR</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>AutoRABIT - Lead Conversion Notification</fullName>
        <actions>
            <name>Lead_is_Converted</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.IsConverted</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>AutoRABIT RecordType</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.DoNotCall</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>AutoRABIT - New Lead Notification</fullName>
        <actions>
            <name>New_Lead_Notification</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>This Sends an email when New lead is created</description>
        <formula>AND(ISNEW(), RecordType.DeveloperName = &apos;AutoRABIT_RecordType&apos;, ISBLANK(Secondary_Lead_Source__c) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Email notification to Lead - Contact Form</fullName>
        <actions>
            <name>Email_Notification_Contact_form</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>equals</operation>
            <value>Website - Contact Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.RecordTypeId</field>
            <operation>equals</operation>
            <value>AutoRABIT RecordType</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.DoNotCall</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Email notification to Lead after filling the Contact form on the Website</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Lead Followup - Contacted OR Demo Performed</fullName>
        <active>false</active>
        <booleanFilter>(1 OR 2) AND 3</booleanFilter>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Contacted</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Demo Performed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.DoNotCall</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>When a lead status is set to &apos;Contacted&apos; or &apos;Demo Performed&apos; and when we do not get any response from lead for 7 days from the date of contacted or Demo Performed, the lead owner should get a task alert to follow up further with the lead.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Lead_Follow_Up_30_days</name>
                <type>Task</type>
            </actions>
            <timeLength>29</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Lead_Follow_Up_7_Days</name>
                <type>Task</type>
            </actions>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Primary Lead with Dates</fullName>
        <actions>
            <name>Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Dates will be applicable when Primary Lead is selected</description>
        <formula>Primary_Lead__c  &lt;&gt; Null &amp;&amp; ( ISPICKVAL(Status,&apos;Discovery Call Scheduled&apos;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update SDR on Discovery Call</fullName>
        <actions>
            <name>Update_SDR</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.SDR__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Update SDR on Discovery Call</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Lead_Follow_Up_30_days</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please follow up with the Lead and update in the chatter or notes.</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Lead Follow Up_30_days</subject>
    </tasks>
    <tasks>
        <fullName>Lead_Follow_Up_7_Days</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please follow up with the Lead and update in the chatter or notes.</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Lead Follow Up_7_Days</subject>
    </tasks>
    <tasks>
        <fullName>TestTask</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>TestTask</subject>
    </tasks>
</Workflow>
