@isTest
public class PrimaryContactCheckerTest {

 @TestSetup
    static void makeData(){
        Account a  = new Account(name = 'testy');
        insert a;
        Account insertedA = [select name,id from account where name like 'testy'];
        Contact c = new Contact(lastname = 'larry',accountid = insertedA.id);
        Contact d = new Contact(lastname = 'jerry', accountid = insertedA.id);
        insert c;
        insert d;
        
    }

    @isTest
    public static void larryIsPrimary(){
        Id SysAdminId = [select id from profile where name like 'System Administrator'].id;
        User u = [select name from user where profileid =: SysAdminId AND isActive = true limit 1];
        System.RunAs(u){
        Contact c = [select name, primary_contact__c from contact where name like 'larry'];
        System.assertEquals(true,c.primary_contact__c);
        }
    }

    @isTest
    public static void jerryIsNotPrimary(){
        Id SysAdminId = [select id from profile where name like 'System Administrator'].id;
        User u = [select name from user where profileid =: SysAdminId AND isActive = true limit 1];
        System.RunAs(u){
        Contact d = [select name, primary_contact__c from contact where name like 'jerry'];
        System.assertEquals(false,d.primary_contact__C);
        }
    }
}
