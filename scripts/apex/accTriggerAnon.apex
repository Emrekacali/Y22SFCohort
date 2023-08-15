Account ac = new account(NAME = 'acc new trg 6');
insert ac;
system.debug('********');
ac.name = 'acc new trg 6 v2';
update ac;

list<Account> ac1 = new List<account>{
    new account(NAME = 'acc trgg 10'),
    new account(NAME = 'acc trgg 11'),
    new account(NAME = 'acc trgg 12')
};
insert ac1;