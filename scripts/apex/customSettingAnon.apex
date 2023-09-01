//fetch information from country code custom setting
List<CountryCode__c> cc = [select id, Code_2__c, Code_3__c, name from countrycode__c];
system.debug(cc);

//built in method:
//to get all records we use .getAll()
Map<string, countryCode__c> allCC = CountryCode__c.getAll();
system.debug('all CC map: ' + allCC);

//print ==> Country=France: CODES are FR & FRA
for (String eachCountry : allCC.keySet()) {
    countryCode__c eachCC = allCC.get(eachCountry);
    system.debug('Country is ' + eachCountry + ': Code is ' + eachCC.Code_2__c + ' & ' + eachCC.Code_3__c);
}

//built in method:
//to get one instance of a country we use getInstance()
CountryCode__c fraCC = CountryCode__c.getInstance('France');
System.debug('FRANCE COUNTRY CODE ONLY: ' + fraCC);

DefaultOppInfo__c defOpp = DefaultOppInfo__c.getOrgDefaults();
system.debug(defOpp);