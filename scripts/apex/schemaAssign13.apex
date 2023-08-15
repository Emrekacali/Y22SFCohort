//all metadata info of contact sobject
Schema.describeSobjectResult contactSR = contact.sobjectType.getDescribe();
system.debug('contactSR => ' + contactSR);

//get map of all field names of contact sobject
Map<string, schema.SObjectField> contactFieldMap = contactSR.fields.getMap();
for (string eachField : contactFieldMap.keySet()) {
    Schema.DescribeFieldResult eachFieldResult = contactFieldMap.get(eachField).getDescribe();
    system.debug('field label is......' + eachFieldResult.getLabel());
}