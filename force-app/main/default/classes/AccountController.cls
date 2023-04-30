

public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [Select Id,Number_of_Contacts__c,CreatedDate,Name from Account Order by CreatedDate DESC LIMIT 10];
    }
}
