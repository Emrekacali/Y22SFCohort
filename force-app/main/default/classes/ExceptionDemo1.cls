public class ExceptionDemo1 {
    public static void homework6show(string fullname) {
              try {
                if (!fullname.contains(' ')) {
                    system.debug('final output: ' + fullname);
                } else{
                    //split fullname using ' '(space)
                    list<string> nameList = fullname.split(' ');
                    system.debug('*** name list is ' + nameList);

                    string abbrName = '';
                    for (Integer i = 0; i < nameList.size()-1; i++){
                         abbrName += nameList[i].substring(0, 1) + '. ';
                    }

                    abbrName += nameList[nameList.size() - 1];
                    system.debug('Final Output: '+ abbrName);
                }
            } catch (NullPointerException ne) {
                system.debug('something was null buddy');
                system.debug('ne message: ' + ne.getMessage());
            } catch (Exception ex) {
                system.debug('Something went wrong buddy');
                system.debug('ex message: ' + ex.getMessage());
            }    
     }      
} 

public static string demo2 (string n) {

    try {
        Account a = [select id, name from account where name = :n];
        system.debug(a);

        account a1 = new account (name = n);
        insert a1;
        system.debug(a1);
        return 'Acc inserted successfull. Acc id is ' + a1.id;

    } catch (QueryException qe) {
        system.debug('query went wrong');
        system.debug('qe msg: ' + qe.getMessage());
        return 'query went wrong. DML didn\'t execute'; 
    } catch (Exception ex) {
        system.debug('something went wrong');
        system.debug('general exception msg ' + ex.getMessage());
        return 'general exception. No can do account.';
    } finally {
        system.debug('finally finally');
        system.debug('apex is simple');
    }
}


