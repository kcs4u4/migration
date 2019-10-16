@isTest
private class Test_MyScheduleable {
    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() {
        
        List<kcs_dev__A__c> asa = new List<kcs_dev__A__c>();
        Date closeDate = Date.today().addDays(-7);
        for (Integer i=0; i<10; i++) {
            kcs_dev__A__c o = new kcs_dev__A__c(
                kcs_dev__One__c = 'closeDate',
                kcs_dev__Hello__c = 'Prospecting'
            );
            asa.add(o);
        }
        insert asa;
        MySchedulableClass.scheduleMe();
        MySchedulableClass my= new MySchedulableClass();
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',CRON_EXP, my);         
        List<kcs_dev__A__c> asa2 = new List<kcs_dev__A__c>();
        Test.stopTest();
    }
}