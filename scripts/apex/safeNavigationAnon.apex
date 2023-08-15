/*
list<account> listAcc = [select id, name, description from account where name like '%yoll%'];

//we add ?. Because what if description is null then would give a Null Pointer Exception error. To prevent this we added question mark.
for (Account acc : listAcc) {
    if (acc.Description?.contains('yoll')){
        system.debug('description contains yoll');
    }
*/

//we add ?. Because if query doesn't return anything, we are preventing the error by adding question mark.
string checkName = 'yoll';

id accountId = [select id, name, description from account where name = :checkName]?.id;

