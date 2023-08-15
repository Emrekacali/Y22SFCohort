public class DmlDemo3 {
    public static void dmlUpsert1() {

          Contact c = new contact (FirstName = 'Don', LastName = 'Lemon', email = 'Don.Lemon@sfdc.com');
          Contact c1 = new contact (FirstName = 'Don', LastName = 'Kixot', email = 'Don.Kixot@sfdc.com');

          List <contact> listCon = new list <contact> {c, c1};
          system.debug('BEFORE dml: ' + listCon);
          upsert listCon contact.fields.email;
          system.debug('AFTER dml: ' + listCon);
    }

    public static void dmlAssignment6() {
          Account acc = new account (name = 'Alex');
          insert acc;

          acc.AccountNumber = 'sss22f';
          
          Account acc2 = new account (name = 'Jeff');

          List <account> listAcc = new list <account> {acc, acc2};
          System.debug ('before upsert dml' + listAcc);
          upsert listAcc;
          System.debug ('after upsert dml' + listAcc);
    }

    public static void sobjectAssignment() {
      List <sobject> listSO1 = [select id, name, phone, accountnumber from account limit 10];

      for (sobject EachSO: listSO1) {
            system.debug('Id: ' + EachSO.id);
            system.debug('name: ' + EachSO.get('name')); 
            system.debug('phone: ' + EachSO.get('phone'));
            system.debug('accountnumber: ' + EachSO.get('accountnumber'));
            system.debug('---------');
            }
    }
}