@isTest

private class TestVerifyDate{
    
   
    @isTest static void testDateCheckWithin30Days(){
        Date baseDate = Date.newInstance(2016,5,15);
        Date withinDate = Date.newInstance(2016,5,28);
        Date testDate = VerifyDate.CheckDates(baseDate,withinDate);
        System.assertEquals(withinDate,testDate);
    }
    
    @isTest static void testDateCheckPastDate(){
        Date baseDate = Date.newInstance(2016,5,15);
        Date pastDate = Date.newInstance(2016,4,30);
        Date endOfMonth = Date.newInstance(2016,5,31);
        Date testDate = VerifyDate.CheckDates(baseDate,pastDate);
        System.assertEquals(endOfMonth,testDate);
    }
    
    @isTest static void testDateCheckFutureDate(){
        Date baseDate = Date.newInstance(2016,5,15);
        Date futureDate = Date.newInstance(2016,7,1);
        Date endOfMonth = Date.newInstance(2016,5,31);
        Date testDate = VerifyDate.CheckDates(baseDate,futureDate);
        System.assertEquals(endOfMonth,testDate);
    }

}