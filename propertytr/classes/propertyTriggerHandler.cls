public class propertyTriggerHandler {
    
    public static void updateVerified(Map<Id,Property__c> propNewMap,Map<Id,Property__c> propOldMap){
        for(Property__c pr : propNewMap.values()){
            if(propOldMap.get(pr.Id).Status__c == 'Not Available' && pr.Status__c == 'Available'){
                pr.Verified__c = true;
            }
        }
    }

}