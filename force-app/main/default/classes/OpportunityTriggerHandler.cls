public  class OpportunityTriggerHandler {
    //create a method to count opp and update in account
    public static void updateNumberOfOppsInAcc(List<Opportunity> oppTriggerNew, Map<Id, Opportunity> oppTriggerNewMap) {
    //we have to update account records
      //which account records we have to update?

    //get all acc ids for which we want to update count of oops
      set<id> accIds = new set<id>();
      for (Opportunity newOp : oppTriggerNew) {
        //check if accountId is NOT NULL
        if (newOp.AccountId !=null) {
            accIds.add(newOp.AccountId); //add accountId. 
        }
      }

      //if accIds is NOT EMPTY then count its opportunity and populate and update acc
       if(!accIds.isEmpty()) {
     
        //how to get count of opps for each Account.
         //1. account TO opportunities query
        list<account> listAcc = [select id, name, (select id from Opportunities) from account where id in :accIds] ;
     for (Account acc : listAcc){
        integer countOpp = acc.Opportunities.size();
        acc.Number_of_opportunities__c = countOpp;
     }
        update listAcc;
    }
    }
}