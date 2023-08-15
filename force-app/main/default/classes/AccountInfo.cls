    public class AccountInfo {
    public static list<account> showAccount(string filterIndustry) {
 list <account> filterAccounts = [select name, phone, website,
 industry, annualrevenue from account where Industry = :filterIndustry];
 
return filterAccounts;
    }
    }