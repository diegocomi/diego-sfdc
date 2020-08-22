public class EmailMissionSpecialist {
	
    //Public method
    public void sendMail(String address, String subject, String body){
        //create message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> toAddresses = new List<String>{address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        inspectResults(results);
        
    }
    
    private static Boolean inspectResults(Messaging.SendEmailResult[] results){
        Boolean sendResult = true;
        
        for(Messaging.SendEmailResult res : results){
            if(res.isSuccess()){
                System.debug('Email Sent Successfully');
            } else{
                sendResult = false;
                System.debug('The following errors occurred:' + res.getErrors());
            }
        }
        
        return sendResult;
        
    }
}