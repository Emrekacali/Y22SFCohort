trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete, after delete) {


    if (Trigger.isBefore && Trigger.isUpdate) {
       AccountTriggerHandler.accountValidation2(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }

    public static void accountValidation1(List<account> accTriggerNew){
        //check if annual revenue is less than 5k then throw error
        for (Account accNew : accTriggerNew) {
            if (accNew.AnnualRevenue < 5000) {
                //throw error on RECORD
                //accNew.addError('Annual revene cannot be less than 5000. Come on user!');
                
                //throw error on the field
                accNew.AnnualRevenue.addError('Annual revene cannot be less than 5000. Come on user! (via Handler)');
            }
    
            system.debug('accNew.Industry = ' +accNew.Industry );
            if (accNew.Industry == null) {
                accNew.Industry.addError('Industry CANNOT be blank (via Handler)');
            }
            if (accNew.Rating == null) {
                accNew.Rating.addError('Rating CANNOT be blank (via Handler)');
            }
        }
    }

    if (Trigger.isBefore && Trigger.isDelete) {
        system.debug('acc getting deleted');
        //call method for validation if Acc is NOT active then only allow deleting
        AccountTriggerHandler.validateAccDelete(Trigger.Old);
        //call method to re-assign opportunities of account to 'Temporary Account'
        AccountTriggerHandler2.reassignRelatedOpps(Trigger.old, trigger.OldMap);
    }

    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
             //call method to create contact
            AccountTriggerHandler.createRelatedContact(Trigger.new);
            //call method to create default opp
            AccountTriggerHandler.createRelatedOpportunity(Trigger.new);
        }
        if (Trigger.isUpdate) {
            AccountTriggerHandler.updateRelatedContactPhone(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        }
        if (Trigger.isDelete) {
            system.debug('after delete account Trigger called.');
            //call method to delete all related contacts.
            //AccountTriggerHandler.deleteRelatedContacts(Trigger.old, Trigger.oldMap);
        }
    }
}