Schema.DescribeSObjectResult sR = Account.sObjectType.getDescribe();
system.debug('sR ---> ' + sR);
//results for SObject using getDescribe() -> describeSObjectResult

Schema.DescribeFieldResult nameFR = Account.name.getDescribe();
system.debug('nameFR ---> ' + nameFR);
system.debug('getName() --> ' + nameFR.getName());

