schema.SObjectType acc = schema.getGlobalDescribe().get('Account');

schema.DescribeFieldResult ratingFR = Account.rating.getDescribe();
List<schema.PicklistEntry> allRatingValues = ratingFR.getPicklistValues();
system.debug('rating values: ' + allRatingValues);

for (schema.PicklistEntry eachEntry : allRatingValues) {
    system.debug(eachEntry.getLabel() + '-->' + eachEntry.getValue());
} 

