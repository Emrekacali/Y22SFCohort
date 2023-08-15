@isTest
public  class AccountTriggerHandlerTest {
    
    @TestSetup //Created testsetup to be able to use the data for any method I want to test with.
    static void makeData(){
        List<account> newAccounts = new list<account>{
            new account(name = 'apple apple',  Rating = 'Hot' , Industry = 'Energy', annualRevenue = 7000), 
            new account(name = 'mango mango' , Rating = 'Hot', Industry = 'Energy', annualRevenue = 7000),
            new account(name = 'orange orange', Rating = 'Hot', Industry = 'Energy',  annualRevenue = 7000)
        };
        insert newAccounts;
    }
       
    @isTest
    private static void testAccValidation1_1() {
        //we use try catch in TEST methods to test trigger validation
        try {
            //prepare data
            List<account> newAccounts = new list<account>{
                new account(name = 'apple', Rating = 'Hot', Industry = 'Energy' , annualRevenue = 3000), 
                new account(name = 'mango' , Rating = 'Hot', Industry = 'Energy', annualRevenue = 3000),
                new account(name = 'orange', Rating = 'Hot', Industry = 'Energy', annualRevenue = 3000)
            };

            //dml is the call method step for trigger.
            insert newAccounts;
            //account trigger is executing (for insert)
                //this will execute accountValidation1
            
        } catch (DmlException Ex) {
            assert.isTrue(ex.getMessage().contains('Annual revenue cannot be less than 5000'));
            //then our handler is doing what it is supposed to do.
        }
        
    }


    @isTest
    private static void testAccValidation1_2() {
        //we use try & catch in TEST methods to test trigger validation
        try {
            //prepare data
            List<account> newAccounts = new list<account>{
                new account(name = 'apple',  Industry = 'Energy' , annualRevenue = 7000), 
                new account(name = 'mango' , Industry = 'Energy',  annualRevenue = 7000),
                new account(name = 'orange', Industry = 'Energy',  annualRevenue = 7000)
            };

            //dml is the call method step for trigger.
            insert newAccounts;
            //account trigger is executing (for insert)
                //this will execute accountValidation1
            
        } catch (DmlException Ex) {
            assert.isTrue(ex.getMessage().contains('Rating CANNOT be blank'));
            //then our handler is doing what it is supposed to do.
        }
    }


    @isTest
    private static void testAccValidation1_3() {
        //we use try & catch in TEST methods to test trigger validation
        try {
            //prepare data
            List<account> newAccounts = new list<account>{
                new account(name = 'apple',  Rating = 'Hot' , annualRevenue = 7000), 
                new account(name = 'mango' , Rating = 'Hot',  annualRevenue = 7000),
                new account(name = 'orange', Rating = 'Hot',  annualRevenue = 7000)
            };

            //dml is the call method step for trigger.
            insert newAccounts;
            //account trigger is executing (for insert)
                //this will execute accountValidation1
            
        } catch (DmlException Ex) {
            assert.isTrue(ex.getMessage().contains('Industry CANNOT be blank'));
            //then our handler is doing what it is supposed to do.
        }
    }

    @isTest
    private static void testAccValidation1_2() {
        //first we will create account - already done in TEST Setup. So chill.
       
        List<Account> listAcc = [select id, name from account];
          
        //then update account
        for (Account eachAcc : listAcc) {
            eachAcc.name += ' v2 ';
        }
        try {
        update listAcc;
        } catch (Exception ex) {
            assert.isTrue(ex.getMessage().contains('CANNOT change account name'));
        }
        
        //it will throw error. We will catch it, and assert it.

    }
}