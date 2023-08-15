@isTest
public class AccountTriggerTest {
    @isTest
    private static void testMethod1(){
       //how to test trigger?
          //insert/update/delete records.
          //single and bulk.

          //prepare data
          List<account> newAccounts = new list<account>{
            new account(name = 'apple', Rating = 'Hot', Industry = 'Energy'), 
            new account(name = 'mango' , Rating = 'Hot', Industry = 'Energy'),
            new account(name = 'orange', Rating = 'Hot', Industry = 'Energy')
           
        };
        //No calling method. Because DML is the call method step for trigger. Other than that there is no method in trigger.
        insert newAccounts;
        

        //assert
        //assert that account is inserted successfully.
        list<account> allAccounts = [select id, name from account];
        assert.areEqual(3, allAccounts.size());

    }

    private static void testMethodDel1(){
//prepare data
List<account> newAccounts = new list<account>{
    new account(name = 'apple', Rating = 'Hot', Industry = 'Energy'), 
    new account(name = 'mango' , Rating = 'Hot', Industry = 'Energy'),
    new account(name = 'orange', Rating = 'Hot', Industry = 'Energy')
   
};
     insert newAccounts;

     delete newAccounts;  //why delete? Because we want to test delete account trigger
    }
}