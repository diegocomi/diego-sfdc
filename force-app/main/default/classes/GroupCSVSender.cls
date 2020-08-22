//sends the contents of an object table to a defined email address

public class GroupCSVSender{

    public static void sendGroupCSV(){
        
        //select groups to include and create csv body
        List<Group> grplist = [Select Id, Type, RelatedId, OwnerId,Name,DoesIncludeBosses,DeveloperName from Group];
        string header = 'Id, Type, RelatedId, QueueRoutingConfig, OwnerId,Name,DoesIncludeBosses,DeveloperName \n';
        string finalstr = header ;
        for(Group g: grplist)
            {
                   string recordString = '"'+g.id+'","'+g.Type+'","'+g.RelatedId+'","'+g.OwnerId+'","'+g.Name+'","'+g.DoesIncludeBosses+'","'+g.DeveloperName+'"\n';
                   finalstr = finalstr +recordString;
            }
        system.debug(finalstr);
        
        //create CSV Attachment populated by a Blob instance
        Messaging.EmailFileAttachment csvGroup = new Messaging.EmailFileAttachment();
        blob csvBlob = Blob.valueOf(finalstr);
        string csvname= 'Group.csv';
        csvGroup.setFileName(csvname);
        csvGroup.setBody(csvBlob);
        
        //Define messaging properties (could move email address to parameter or define as current user)
        Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
        String[] toAddresses = new list<string> {'diego.cominazzini@sbdinc.com'};
        String subject ='Group CSV Backup';
        email.setSubject(subject);
        email.setToAddresses( toAddresses );
        email.setPlainTextBody('Group CSV ');
        
        //attach and send
        email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvGroup});
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    }
    
    public static void sendGroupMemberCSV(){
        List<GroupMember> grpMemberList = [Select GroupId, UserOrGroupId from GroupMember];
        string header = 'GroupId, UserOrGroupId \n';
        string finalstr = header ;
        for(GroupMember gm: grpMemberList)
            {
                   string recordString = '"'+gm.GroupId+'","'+gm.UserOrGroupId+'"\n';
                   finalstr = finalstr +recordString;
            }
        system.debug(finalstr);
        Messaging.EmailFileAttachment csvGroupMember = new Messaging.EmailFileAttachment();
        blob csvBlob = Blob.valueOf(finalstr);
        string csvname= 'GroupMember.csv';
        csvGroupMember.setFileName(csvname);
        csvGroupMember.setBody(csvBlob);
        Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
        String[] toAddresses = new list<string> {'diego.cominazzini@sbdinc.com'};
        String subject ='Group Member CSV Backup';
        email.setSubject(subject);
        email.setToAddresses( toAddresses );
        email.setPlainTextBody('Group Member CSV ');
        email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvGroupMember});
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});

    }
}