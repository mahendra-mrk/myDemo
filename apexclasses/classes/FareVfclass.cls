public class FareVfclass {
    public list<Fare__c> fac{get;set;}
    public Fare__c facObj{get;set;}
    public string recId{set;get;}
    
    public FareVfclass(){
       facObj = new Fare__c();
       load();
    }
    
    public void load(){
       fac = [select Name,Flight__c,Passenger_Type__c,Price__c from Fare__c order by createddate desc]; 
    }
    
    public void rec(){
        facObj = [select Name,Flight__c,Passenger_Type__c,Price__c from Fare__c where id = :recId];
    }
    
    public void godelete(){
        Fare__c fc =  [select id from Fare__c where id = :recId];
        Database.DeleteResult de  =Database.delete(fc,false);
        if(de.isSuccess())
        {
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.INFO,'Fare Deleted Successfully'));
            facObj = new Fare__c();
            load();
        }
    }
    
    public void SaveFare(){
        Database.UpsertResult res = Database.upsert(facObj,false); 
        
        if(res.isSuccess())
        {            
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.CONFIRM,'Fare inserted Successfully!'));                   
             facObj = new Fare__c();
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