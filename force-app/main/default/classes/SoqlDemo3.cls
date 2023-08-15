public class SoqlDemo3 {
    public static void dynamicSoql2(List<string> fieldNames, string sObjectName) {
          string query = 'select Id';

          for (string eachField : fieldNames) {
            query += ',' + eachField;
          }

          query += ' from ' + sObjectName;
          system.debug('FINAL QUERY IS ==> ' + query);

          List<SObject> listSO = Database.query(query);

          for (SObject eachRec : listSO) {
            system.debug(eachRec);

            for (string eachField : fieldNames) {
                system.debug('=====> fieldName: ' + eachField + ', value : ' + eachRec.get(eachField));
          }
       }
     }
}