public class CreateDefaultContact {
  public static void createContact(List<id> accountIds) {
    @invocableMethod

    List<account> listAccount = [select id, name, rating from account where id in :accountIds];


    List<contact> createContacts = new list <contact>();
    for(account eachAcc : listAccount){
        contact c = new contact();
        c.FirstName = eachAcc.Rating;
        c.LastName = eachAcc.Name;
        c.accountId = eachAcc.Id;
        c.Phone = '0032302';
        createContacts.add(c);
    }
     insert createContacts;
  } 
}