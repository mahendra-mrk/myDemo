public class BookingVfclass {
	public List<Booking__c> acc {get;set;}
     public Booking__c accObj{get;set;}
    public string recId{set;get;}
    
    public BookingVfclass()
    {
       accObj = new Booking__c();
       load();
    }
    
    
    public void load()
    {
         acc = [select name,Arriving_To__c,Address__c,Baggage_Count__c,Beverage__c,Booking_status__c,Fare_Type__c,Flight_Name__c,Food_Items__c,Food_Type__c,Gender__c,Id_Proof__c,	Nationality__c,Onboarding_From__c,Passenger_Email__c,Passenger_Name__c,	Passenger_Type__c,Payment_Mode__c,Total_Fare__c from Booking__c order by createddate desc];

    }
    public void goRec()
    {
        //in case of update u shud have existing record
        accObj=[select name,Arriving_To__c,Address__c,Baggage_Count__c,Beverage__c,Booking_status__c,Fare_Type__c,Flight_Name__c,Food_Items__c,Food_Type__c,Gender__c,Id_Proof__c,	Nationality__c,Onboarding_From__c,Passenger_Email__c,Passenger_Name__c,	Passenger_Type__c,Payment_Mode__c,Total_Fare__c from Booking__c where id = :recId];
    }
    
    public void doDelete()
    {
       Booking__c ac =  [select id from Booking__c where id = :recId];
        Database.DeleteResult dr  =Database.delete(ac,false);
        if(dr.isSuccess())
        {
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.INFO,'Booking Deleted'));
            accObj = new Booking__c();
            load();
        }
    }
     public void saveBooking()
    {  
        //Database.SaveResult res = Database.insert(accObj,false);
       Database.UpsertResult res = Database.upsert(accObj,false); 
        //if id is thr thn it will be going to update else insert
        
        if(res.isSuccess())
        {            
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.CONFIRM,'Booking inserted'));                   
             accObj = new Booking__c();
            load();
        }
        else{
            List<Database.Error> errs = res.getErrors();
            for(Database.Error er : errs)
            {
                ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,'===>> '+er.getMessage()));
            }             
        }        
    }   

}