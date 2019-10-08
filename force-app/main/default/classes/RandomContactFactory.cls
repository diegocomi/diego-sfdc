public class RandomContactFactory{

    public static List<Contact> generateRandomContacts(Integer howmany, String surname){
        List<Contact> lstContact = new List<Contact>();
        
        for(Integer i=0;i<howmany;i++){
            Contact c = new Contact();
            c.FirstName = 'XYZ ' + i;
            c.LastName = surname;
            lstContact.add(c);
        }
        
        return lstContact;
    }

}