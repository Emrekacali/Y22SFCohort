@isTest    

public class DmlDemo1Test{
@isTest 
 private static void testDml1() {
  //call method
     DmlDemo1.dml1();  //in this class we are creating one account. Will it create record in the org? No. It will only create in its own testing world.


  //verify
  //how to verify if data is being created?
  //soql
  account acc = [select id, name, website from account limit 1];
  //assert if name as Salesforce
  system.assertEquals('Salesforce', acc.name);
  assert.areEqual('Salesforce', acc.name);
   }

@isTest
private static void testDml2() {
    DmlDemo1.dml2();

    list<department__c> d1 = [select id, name__c, short_code__c from department__c limit 1];
    system.assert(!d1.isEmpty());
    assert.areEqual('Human Resources', d1[0].name__c);
}

@isTest
private static void testDml4(){
    //step1: prepare data
    //prepare data, create data which is NEEDED for our method to run successfully
    account acc = new account();

    //2.set field names
    acc.Name = 'Salesforce';
    acc.Website = 'salesforce.com';
    acc.Industry = 'Agriculture';
    acc.Rating = 'Warm';
    //dml
    insert acc; //will create record in org.

    //step2: call method (or test actual code)
    DmlDemo1.dml4();

    //step3: assertion
    //verify if contact with lastname = biden is created or not
    contact c = [select id, lastname, accountid, phone from contact where lastname = 'Biden'];
    assert.areEqual(acc.id, c.accountid);
    assert.areEqual('32322', c.phone);
  }
}