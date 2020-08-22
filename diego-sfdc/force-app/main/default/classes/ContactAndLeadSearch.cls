public class ContactAndLeadSearch{
    public static List<List<SObject>> searchContactsAndLeads(String s){
        List<List<SObject>> searchResult = [FIND :s IN NAME FIELDS
                                            RETURNING Contact(Name),Lead(Name)];
        return searchResult;
    }
}