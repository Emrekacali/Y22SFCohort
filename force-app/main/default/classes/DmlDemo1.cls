public class DmlDemo1 {
   public static void dml1(){
     //create ONE account record.
     
     //1.create new instance of sobject.
     account acc = new account();

     //2.set field names
     acc.Name = 'Salesforce';
     acc.Website = 'salesforce.com';
     acc.Industry = 'Agriculture';
     acc.Rating = 'Warm';

     //dml
     insert acc; //will create record in org.
   }

   public static void dml2(){
    //create one department record

    Department__c dep1 = new Department__c();
    dep1.Name__c = 'Human Resources';
    dep1.Short_Code__c = 'HRs';

    system.debug('BEFORE DML: ' + dep1 );
    insert dep1;
    system.debug('AFTER DML: ' + dep1 );
    Id newDepId = dep1.Id;
    System.debug('Id of new dept is ' + newDepId);
   }

   public static void dml3(){
      //new account
   Account acc = new account(name='Alexander', phone='73213123', NumberOfEmployees= 75);
       //insert the account by using DML
   insert acc;
}
   public static void dml4(){
   account acc = [select id, name from account order by createddate desc limit 1];

   Contact c = new Contact();
   c.LastName = 'Biden';
   c.Phone = '32322';
   c.accountid = acc.id; //this establishes relationship between contact and account
   insert c;
}
}