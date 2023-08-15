trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete, after delete) {
  
  if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
    //check if annual revenue is less than 5k then throw error
     for (Account accNew : Trigger.new) {
      if (accNew.AnnualRevenue < 5000) {
        //throw error on RECORD
        //accNew.addError('Annual Revenue cannot be less than 5000');
        //throw error on the field
        accNew.AnnualRevenue.addError('Annual Revenue cannot be less than 5000');
      }
    }
  }

  if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
    AccountTriggerHandler.accountValidation1(trigger.new);
  }


  if (Trigger.isBefore && Trigger.isUpdate) {
    Map<id, account> oldAccountMap = Trigger.oldMap;
    //check if account name field is changed
    for (Account newAcc : Trigger.new) {
      system.debug('new acc name: ' + newAcc.name);
      //get old account name. Id of new and old record remains the same.
      Account oldAcc = oldAccountMap.get(newAcc.id);
      
      //to check if name is changed, just compare oldAcc name and newAcc name
      // if(oldAcc.Name != newAcc.Name) {
        //for insert and update
        //addError can be used on trigger.new or newmap
          //addError CANNOT be used with Trigger.old or oldmap (because old is gone, we cannot do anything with that)
         
         if (Trigger.oldMap.get(newAcc.id).Name != newAcc.Name){
          newAcc.addError('Cannot change Account name');
         }
        }
      }


      
if (Trigger.isBefore && Trigger.isUpdate) {
  
    AccountTriggerHandler.accountValidation2(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
}

if (Trigger.isAfter && Trigger.isInsert) {
      //call method to create contact 
      AccountTriggerHandler.createRelatedContact(Trigger.new);
      //call method to create opportunity
      AccountTriggerHandler.createRelatedOpportunity(Trigger.new);
}

if (Trigger.isUpdate) {
  AccountTriggerHandler.updateRelatedContactPhone(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
}

if (Trigger.isDelete) {
  system.debug('after delete account Trigger called.');
  //call method to delete all related contacts.
  AccountTriggerHandler.deleteRelatedContacts(Trigger.old, Trigger.oldMap);
}


if (Trigger.isBefore && Trigger.isDelete) {
  System.debug('Account is getting deleted');
  //call method for validation if Acc is NOT active then only allow deleting.
  AccountTriggerHandler.validateAccDelete(Trigger.Old);

  //call method to re-assign opportunities of account to 'Temporary Account'
  AccountTriggerHandler2.reassignRelatedOpps(Trigger.old, Trigger.OldMap);

  //call method to validate if account is associated with contact or opportunities. If so, don't allow.
  //AccountTriggerHandler.validateAccDelete2(Trigger.Old, Trigger.OldMap);
}
      
/*
 //validation in trigger, we have to use .addError method in Trigger.new or newMap
 // we can addError in both, in before and after context, but the recommended is to addError in before context.

 if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
  //check if annual revenue is less than 5k then throw error
   for (Account accNew : Trigger.new) {
    if (accNew.AnnualRevenue < 5000) {
      //throw error on RECORD
      //accNew.addError('Annual Revenue cannot be less than 5000');
      //throw error on the field
      accNew.AnnualRevenue.addError('Annual Revenue cannot be less than 5000');
    }
   }
 } 

 */



  /*
   // When account is created and active__c field is selected as 'Yes', update description as 'Account is now active 'Enjoy' else 'Record Created'
   if (Trigger.isBefore && Trigger.isInsert) {

    for (Account acc : Trigger.new) {
      acc.Description = 'Record Created';
      //check if active__c field == 'Yes'
      if (acc.Active__c == 'Yes') {
        acc.Description = 'Account is now active. Enjoy buddy!';
      }
    }
   
  }

  */


  /*
   //check if trigger is running in before insert context
    if (Trigger.isBefore && Trigger.isInsert) {
      //why for loop? Because Trigger.new is list
      for (Account newAcc : Trigger.new) {
        newAcc.Ownership = 'Public';
        newAcc.Description = 'Description updated from trigger.';
      }
    }
 */ 


     
/*
//HOW to get data which is being inserted or updated
  //Trigger.new
  List<account> newAccounts = Trigger.new;
 //Map <id, account> //record id as KEY //record itself as VALUE
  Map<id, account> newAccountsMap = Trigger.newMap;

  List<account> oldAccounts = Trigger.old;
  Map<id, account> oldAccountMap = Trigger.oldMap;

  if (Trigger.isBefore && Trigger.isInsert) {
    system.debug('--- Before Insert ---');
    system.debug('--- Trigger.New ---' + Trigger.new);
    system.debug('--- Trigger.NewMap ---' + Trigger.newMap);
    system.debug('--- Trigger.old ---' + Trigger.old);
    system.debug('--- Trigger.oldMap ---' + Trigger.oldMap);
  }
 
  if (Trigger.isBefore && Trigger.isUpdate) {
    system.debug('--- Before Update ---');
    system.debug('--- Trigger.New ---' + Trigger.new);
    for (Account newAcc : trigger.new) {
      system.debug('new acc name: ' +  newAcc.Name); 
      system.debug('new acc name: ' +  newAcc.Website);
    }
    //system.debug('--- Trigger.NewMap ---' + Trigger.newMap);
    system.debug('--- Trigger.old ---' + Trigger.old);
    for (Account oldAcc : trigger.old) {
      system.debug('old acc name: ' +  oldAcc.Name);
      system.debug('old acc website: ' +  oldAcc.Website);
    }
    
    //system.debug('--- Trigger.oldMap ---' + Trigger.oldMap);
  }

  */

  /*
  if (Trigger.isBefore && Trigger.isInsert) {
    system.debug('account before insert trigger called.');
  }

  //get data using trigger.new
   system.debug('newly inserted account record: ' + newAccounts);
    for (Account newAcc : Trigger.new) {
      system.debug('newAcc name : ' + newAcc.name);
    }
  }
  */


   /*
   system.debug('newMap BEFORE --> ' + newAccountsMap);
   system.debug('total records inserted: ' + newAccounts.size()); //list method list.size()
   system.debug('total records inserted (context variable trigger.size): ' + trigger.size);
   
  }

  if (Trigger.isafter && Trigger.isInsert) {
    system.debug('account after insert trigger called.');
  

  //get data using trigger.new
   system.debug('newly inserted account record (AFTER): ' + trigger.new);
   system.debug('newMap AFTER --> ' + trigger.newMap);
   system.debug('total records inserted: ' + newAccounts.size()); //list method list.size()
   system.debug('total records inserted (context variable trigger.size): ' + trigger.size);

  }

*/
 
 
  /*
  if(Trigger.isBefore) {
    system.debug('Before trigger called');
    if (Trigger.isInsert) {
      system.debug('account before insert trigger called.');
    }
    if (Trigger.isUpdate) {
      system.debug('account before Update trigger called.');
    }
  }

    if (Trigger.isAfter) {
      system.debug('After trigger called');
      if (Trigger.isInsert) {
        system.debug('account after insert trigger called.');
      }
      if (Trigger.isUpdate) {
        system.debug('account after Update trigger called.');
      }
    }
    */



  /*
     system.debug('Trigger isInsert will be true when we create record -> ' + Trigger.isInsert);
     system.debug('Trigger isUpdate will be true when we create record -> ' + Trigger.isUpdate);


    if(Trigger.isBefore && Trigger.isInsert){
      system.debug('account before insert trigger called.');
  }

    if(Trigger.isAfter && Trigger.isInsert){
      system.debug('account after insert trigger called');
  }
     
    if(Trigger.isBefore && Trigger.isUpdate){
      system.debug('account after insert trigger called');
        }
    if(Trigger.isAfter && Trigger.isUpdate){
      system.debug('account after insert trigger called');
        }
 }
*/


//Salesforce allows us to create more than 1 trigger per object.
  //But
//We should not. We should not create more than one trigger per sObject.
}