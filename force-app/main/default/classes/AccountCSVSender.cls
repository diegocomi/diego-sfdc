public class AccountCSVSender{
    //a lovely comment to remove later
    public static void sendCSV(Integer i){
    List<Account > acclist = [Select id,name , Site, AccountNumber from Account limit :i];
    string header = 'Record Id, Name , Site, AccountNumber \n';
    string finalstr = header ;
    for(Account a: acclist)
    {
           string recordString = '"'+a.id+'","'+a.Name+'","'+a.Site+'","'+a.AccountNumber +'"\n';
           finalstr = finalstr +recordString;
    }
    Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
    blob csvBlob = Blob.valueOf(finalstr);
    string csvname= 'Account.csv';
    csvAttc.setFileName(csvname);
    csvAttc.setBody(csvBlob);
    Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
    String[] toAddresses = new list<string> {'diego.cominazzini@sbdinc.com'};
    String subject ='Account CSV';
    email.setSubject(subject);
    email.setToAddresses( toAddresses );
    email.setPlainTextBody('Account CSV ');
    email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
    Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    }
}