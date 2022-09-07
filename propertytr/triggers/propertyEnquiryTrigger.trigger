trigger propertyEnquiryTrigger on Property_Enquiry__c (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        //propertyEnquiryTriggerHandler.sendEmailAfterEnquiry(trigger.new);
        //propertyEnquiryTriggerHandler.sendEmailToPropOwner(trigger.new);
    }
    
}