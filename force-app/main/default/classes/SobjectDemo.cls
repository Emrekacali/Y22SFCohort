public class SobjectDemo {
    public static void SobjectDml1() {
     sobject s1 = new Department__c(Name__c = 'Training');

     list<sobject> listSO = new list<sobject>{
        new account(name = 'Lacrose'),
        new contact(firstname = 'titan', LastName = 'king')
     };
     system.debug('before: ' + listSO);
     insert listSO;
     system.debug('after: ' + listSO);
    }

public static void sObjectDml2() {
    list<sobject> listSO = new list<sobject>{
        new account(name = 'Lacrose', website = 'www.lacrose.com'), //0
        new account(name = 'Lacrose', website = 'www.lactose.com'), //1
        new contact(firstname = 'titan', LastName = 'king',  email = 'www.titan@king.com') //2
        new Department__c(Name__c = 'Training')
     };

     system.debug('before: ' + listSO);
     insert listSO;
     system.debug('after: ' + listSO);

     //we are trying to assign generic sobject to account
     account a1 = (account)listSO[0];
     account a2 = (account)listSO[1];
     contact c1 = (contact)listSO[2];
     system.debug('a1.name and website: ' + a1.Name + ' & ' + a1.Website);
     system.debug('a2.name and website: ' + a2.Name + ' & ' + a2.Website);
     system.debug('c1.name and website: ' + c1.firstname + ' & ' + c1.email);
     
     Department__c d1 = (Department__c)listSO[3];
     system.debug('d1 name: ' + d1.name__c);
}

public static void  sObjectGetPut() {
    sObject s1 = new account();
    s1.put('Name', 'Williomson');
    insert s1;

    system.debug('s1.id : ' + s1.Id);
    system.debug('s1.name : ' + s1.get('Name'));
    system.debug('s1.website : ' + s1.get('Website'));
}

public static void Assignment2() {
    sObject s1 = new contact(FirstName = 'Alex', LastName = 'John');
    system.debug(s1);

    contact c1 = (contact)s1;
    system.debug(c1.FirstName);
}

public static void Assignment3() {
    contact c1 = new contact(FirstName = 'David', LastName = 'Miller', Email = 'david.miller@gmail.com');
    insert c1;

    //get or fetch records using SOQL only if we used insert to create the record.
    list<sObject> sCon = [select id, firstname, email from contact where email = 'david.miller@gmail.com'];

    list<contact> updateContacts = new list<contact>();
    for (sObject eachSo : sCon) {
            contact c = (contact)eachSo;
            if (c.firstname == 'David') {
                c.firstname = 'Dave';
                updateContacts.add(c);
            }
            update updateContacts;
            system.debug('final contact list: ' + updateContacts);
    }
}

public static void Homework7() {
     employee__c emp = new employee__c(FirstName__c = 'Dwayne', LastName__c = 'Johnson', JoinDate__c = Date.today(), Email__c = 'dwayne@johnson.com');
     insert emp;
     system.debug('emp inserted: '+ emp);

     list<SObject> SoEmp = [select id, First_name__c, last_name__c, email__c from Employee__c where email__c = 'dwayne@johnson.com'];
     system.debug('soEMP: ' + SoEmp);

     list<Empoyee__c> updatedEmp = new list<Employee__c>();
     system.debug('inside for EM:' + em);
     for(Sobject eachSo: SoEmp){
        Employee__c em = (Employee__c)eachSo;
        if(em.First_name__c == 'Dwayne' && em.last_name__c == 'Johnson'){
            em.First_name__c = 'The';
            em.last_name__c = 'Rock';
            updatedEmp.add(em);
            system.debug('-- added for update');
        }
     } 
      update updatedEmp;
      system.debug('First and last name : ' + updatedEmp);
}