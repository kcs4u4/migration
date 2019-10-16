global class MySchedulableClass implements Schedulable
{
  global static void scheduleMe()
  {
    MySchedulableClass msc = new MySchedulableClass();
    String sch = ' 	0 50 16 1/1 * ? *'; // base this on mode or whatever your params are
    String jobID = system.schedule('Scheduled Job', sch, msc);
  }

  global void execute(SchedulableContext sc)
  {
    TestAudittrail w = new TestAudittrail();
    w.usertocon();
  }
}