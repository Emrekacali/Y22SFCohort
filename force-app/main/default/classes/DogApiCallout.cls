public with sharing class DogApiCallout {
    
    public static void dogApiCall() {
        
        //http request
        HttpRequest req = new  HttpRequest();
        //set endpoint
        req.setEndpoint('https://api.thedogapi.com/v1/breeds');
        //set method
        req.setMethod('GET');
        //set headers
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('x-api-key', 'live_Jo7D5KWogobSSBADAuFYN3t3rTU2nE64nbw6sCqvtbalhASwQavD6VMp6EsUHgld');

        Http http = new http();
        HttpResponse  response = http.send(req);

        system.debug('response status code: ' + response.getStatusCode());
        system.debug('response body: ' + response.getBody());

        if (response.getStatusCode() == 200) {
            //parse the response.
            List<TheDogWrapper> dogs = TheDogWrapper.parse(response.getBody());
            for (TheDogWrapper eachDog : dogs) {
                //get details of each DOG.
               
                
                system.debug('Dog name: ' + eachDog.name);
                system.debug('Dog bred for: ' + eachDog.bred_for);
                system.debug('Dog breed_group for: ' + eachDog.breed_group);

                system.debug('Dog life_span: ' + eachDog.life_span);
                system.debug('Dog temperament for: ' + eachDog.temperament);
                system.debug('Dog origin for: ' + eachDog.origin);
                TheDogWrapper.Weight eachDogWeight = eachDog.weight;
                system.debug('--> dog weight (metric) ' + eachDogWeight.metric);

                TheDogWrapper.Weight eachDogHeight = eachDog.Height;
                system.debug('--> dog Height (metric) ' + eachDogHeight.metric);


                system.debug('------');
            }
        }

    }
}