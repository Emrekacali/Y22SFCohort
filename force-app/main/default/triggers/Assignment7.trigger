trigger Assignment7 on Account (before insert, after insert, before update, after update) {
    
 if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {

    for (Account accNew : Trigger.new) {
        if (accNew.AnnualRevenue < 5000) {
            if (accNew.AnnualRevenue < 5000) {
                accNew.AnnualRevenue.addError('Annual Revenue cannot be less than 5000');
              }
        }

        if (String.isBlank(accNew.Industry)) {
            accNew.Industry.addError('Industry CAN NOT be blank');
        }
       
        if (accNew.Rating == null) {
            accNew.Rating.addError('Rating CAN NOT be blank');
        }

    }

 }


}