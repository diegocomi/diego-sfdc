global class SOAP_LeadCreate {
  webService static String createNewLead(
    string leadFirstName,
    string leadLastName,
    string leadCompanyName,
    string leadEmail,
    string leadPhone
  ) {
    try {
      Lead lead = new Lead();
      lead.firstName = leadFirstName;
      lead.LastName = leadLastName;
      lead.Email = leadEmail;
      lead.Phone = leadPhone;
      lead.Company = leadCompanyName;

      insert lead;
      return lead.Id;
    } catch (Exception ex) {
      return 'Error During Processing: ' + ex.getMessage();
    }
  }
}