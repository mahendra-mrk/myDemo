public class FareControllerClass {
     @AuraEnabled(cacheable=true)
    public static list<Fare__c> getAllFare(string flightNo){
        if(String.isNotBlank(flightNo)){
        
            String fli = '%'+flightNo+'%';
            list<Fare__c> far = [select Name,Flight__r.Name,Passenger_Type__c,Price__c from Fare__c where Flight__r.Name LIKE :fli];
            return far;
        
        }else{
        
        list<Fare__c> far = [select Name,Flight__r.Name,Passenger_Type__c,Price__c from Fare__c];
        return far;
        }

    }
}