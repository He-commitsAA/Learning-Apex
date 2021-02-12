public inherited sharing class PrimaryContactChecker {


    public static void check(List<Contact> contacts){
        for(contact c: contacts){
            if(!c.primary_contact__c && c.accountid != null){
                seeIfFirst(c);
            }
        }
    }

    public static void seeIfFirst(Contact c){
        List<Contact> otherContacts = [select name,accountid from contact where accountid =: c.accountid AND id !=: c.id];
        if(otherContacts.size() == 0){
            c.primary_contact__c = true;
        }
    }
}
