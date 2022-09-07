public class AirportVfclass {
	 public List<Airport__c> acc {get;set;}
     public Airport__c accObj{get;set;}
    public string recId{set;get;}
    
    public AirportVfclass()
    {
       accObj = new Airport__c();
       load();
    }
    
    public void load()
    {
         acc = [select name from Airport__c order by createddate desc];
    }
    public void goRec()
    {
        //in case of update u shud have existing record
        accObj=[select name from Airport__c where id = :recId];
    }
    
    public void doDelete()
    {
       Airport__c ac =  [select id from Airport__c where id = :recId];
        Database.DeleteResult dr  =Database.delete(ac,false);
        if(dr.isSuccess())
        {
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.INFO,'Account Deleted'));
            accObj = new Airport__c();
            load();
        }
    }
     public void saveAccount()
    {  
        //Database.SaveResult res = Database.insert(accObj,false);
       Database.UpsertResult res = Database.upsert(accObj,false); 
        //if id is thr thn it will be going to update else insert
        
        if(res.isSuccess())
        {            
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.CONFIRM,'Airport inserted'));                   
             accObj = new Airport__c();
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