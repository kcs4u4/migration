global class newschedule123 implements Schedulable
{
  global static void scheduleMe()
  {
    MySchedulableClass msc = new MySchedulableClass();
    String sch = '	0 0/1 * 1/1 * ? *'; // base this on mode or whatever your params are
    String jobID = system.schedule('Scheduled Job1', '0 0 * * * ?', msc);
  }

  global void execute(SchedulableContext sc)
  {
    TestAudittrail w = new TestAudittrail();
    //  System.debug('Test' + w);
    w.usertocon();
  }
}