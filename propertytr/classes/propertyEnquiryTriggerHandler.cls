public class propertyEnquiryTriggerHandler {
    
    public static void sendEmailAfterEnquiry(List<Property_Enquiry__c> peList){
        List<string> emailList = new List<string>();
        for(Property_Enquiry__c pe : peList){
            if(pe.Email__c != null){
                emailList.add(pe.Email__c);
            }
        }
        EmailTemplate prTemplate = [select Id,Subject,Description,
                                 HtmlValue,DeveloperName,Body from EmailTemplate 
                                    where DeveloperName ='Response_Email_to_Enquiry'];
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(emailList);
        email.setSubject('Thanks for your Interest!!!');
         string emailBody= messaging.renderStoredEmailTemplate(prTemplate.Id,peList[0].id,peList[0].id).getHtmlBody();
          email.setHtmlBody(emailBody );
        
        email.setTemplateId(prTemplate.id);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
        
    }
    public static void sendEmailToPropOwner(List<Property_Enquiry__c> prenList){
        Set<Id> prSet = new Set<Id>();
        for(Property_Enquiry__c pren : prenList){
            if(pren.Property__c != null){
                prSet.add(pren.Property__c);
            }
        }
        List<Property__c> propList = [SELECT Id, Owner_email__c FROM Property__c where Id IN:prSet];
        List<string> ownerEmailList = new List<string>();
        for(Property__c pr : propList){
            if(pr.Owner_email__c != null){
                ownerEmailList.add(pr.Owner_email__c);
            }
        }
        EmailTemplate prTemplate = [select Id,Subject,Description,
          HtmlValue,DeveloperName,Body from EmailTemplate 
          where DeveloperName ='Owner_Email_for_Property_Enquiry'];
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(ownerEmailList);
        email.setSubject('New Enquiry has been created');
         //string emailBody= messaging.renderStoredEmailTemplate(prTemplate.Id,prenList[0].id,prenList[0].id).getHtmlBody();
          //email.setHtmlBody(emailBody );
        
        //email.setTemplateId(prTemplate.id);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
        
    }
}