public class DatabaseDML {
    public static void dmlInsert1() {
        List<account> newAccounts = new List<account>{
            new account(name = 'apple'),
            new account(name = 'orange'),
            new account()
        };
        
        //false --> insert good ones, error bad ones
        //true --> insert ONLY if all are good. DO NOT INSERT any if any 1 is bad.
       List<Database.SaveResult> allResults = Database.insert(newAccounts, false);
       system.debug('all results are: ' + allResults);
       //for each record it returns the result.
       for (database.SaveResult eachResult : allResults) {
        if (eachResult.isSuccess()) {
           System.debug(('record successfully saved. id is = ' + eachResult.getId()));
        } else {
           //not successful 
           System.debug('errors: ' + eachResult.getErrors());
           //List<Database.Error> eachResErrors = eachResult.getErrors();
           for (database.error eachError : eachResult.getErrors()) {
           system.debug('fields: ' + eachError.getFields());
           system.debug('message: ' + eachError.getMessage());
           system.debug('status code: ' + eachError.getStatusCode());
           }
        }
       }
    }

    public static void dmlUpsertEtc() {
        account acc = [select id, name from account where name = 'orange' limit 1];
        acc.Name = 'Blackberry';

        Database.UpsertResult result = Database.upsert(acc, false);
        system.debug('upsert result: ' + result);

        Database.DeleteResult delResult = Database.delete(acc, false);
        system.debug('del result: ' + delResult);

        Database.UndeleteResult undelResult = Database.undelete(acc.id, false);
        system.debug('undelete result: ' + undelResult);
    }


    public static void Assignment11(){
     List<account> newAccounts = new list<account>{
        new account(name = 'Steve', phone = '9765235741'),
        new account(name = 'Alex', phone = '6449871132'),
        new account(name = 'Ricky', phone = '42365233223'),
        new account(name = 'Jeff', phone = '12765235748'),
        new account(name = 'Mikey', phone = '6765235749')
     };

     List<database.SaveResult> allResults = database.insert(newAccounts, false);
     for(database.SaveResult eachResult : allResults) {
        if (eachResult.isSuccess()){
            system.debug('successfully inserted.');
        }
        else {
            system.debug('error it is');
        }
     }
 }
    
 












}
