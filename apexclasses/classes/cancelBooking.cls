public class cancelBooking {
    
    public string searchBooking{get;set;}
    public List<Booking__c> bookingList{get;set;}
    public Booking__c cancelBooking{get;set;}
    public string str;
    
    public void getBookedTicket(){
        str = '%'+searchBooking+'%';
        bookingList = [SELECT Name,Flight_Name__c,Passenger_Name__c,Onboarding_From__c,Arriving_To__c,Gender__c,Nationality__c,Booking_status__c from Booking__c where Name like:str];
    }
    public void cancelBookedTicket(){
        for(Booking__c b:bookingList){
            b.Booking_status__c = 'Cancelled';
        }
        update bookingList;
        
    }
    
}