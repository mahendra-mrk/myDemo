trigger propertyTrigger on Property__c (before insert,before update) {
    if(trigger.isBefore && trigger.isUpdate){
        propertyTriggerHandler.updateVerified(trigger.newMap,trigger.oldMap);
    }
}