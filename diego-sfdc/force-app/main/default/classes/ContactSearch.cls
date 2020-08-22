public class ContactSearch{
    public static List<Contact> searchForContacts(String str1, String str2){
        List<Contact> lstContact = [SELECT Id, Name, LastName, MailingPostalCode FROM Contact
                                    WHERE LastName = :str1 AND MailingPostalCode = :str2];
        return lstContact;
    }
}