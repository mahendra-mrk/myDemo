public class Bookingclass {
	public Booking__c newObj{get;set;}
 
    public Bookingclass()
    {
        newObj = new Booking__c();
    }
    
     public void saveBooking()
    {
       // insert accObj; // way 1
       Database.SaveResult res = Database.insert(newObj,false);
        
        if(res.isSuccess())
        {
            //this msg will be displayed if account gets inserted
           //below line of code is way 2 which will print the msg on page : 
           ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.INFO,'Account inserted'));
          
            // below line of code is way 3 if we want to redirect to another page.. record detail page
           //---PageReference pr = new PageReference('/'+newObj.id);
            
             // below line of code is way 3 if we want to redirect to another page.. VF page
         // PageReference pr = new PageReference('/apex/AccountInfoVF');
            //---return pr;            
        }
        else{
            List<Database.Error> errs = res.getErrors();
            for(Database.Error er : errs)
            {
                ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,'===>> '+er.getMessage()));
            }
              //---return null; // as the page reference will not redirect to any page
        }
        //return null;
    }


}