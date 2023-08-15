public class Scenario1Insert {
    public static void insertAccounts(List<String> accNames) {
        list<account> listAccount = new list<account>();
        for (String eachName : accNames) {
            account ac = new account(name = eachName, rating = 'Hot', Industry = 'Energy', phone = '987641445');
        }
     insert listAccount;
    }
}