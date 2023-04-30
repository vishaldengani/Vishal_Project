trigger UpdateNumContacts on Account (before insert, before update) {
        Map<Id, Account> accountsToUpdate = new Map<Id, Account>();
        for (Account acc : Trigger.new) {
            accountsToUpdate.put(acc.Id, acc);
        }
        List<AggregateResult> results = [SELECT AccountId, COUNT(Id) numContacts FROM Contact WHERE AccountId IN :accountsToUpdate.keySet() GROUP BY AccountId];
        for (AggregateResult result : results) {
            Id accountId = (Id)result.get('AccountId');
            Integer numContacts = (Integer)result.get('numContacts');
            if (accountsToUpdate.containsKey(accountId)) {
                Account acc = accountsToUpdate.get(accountId);
                acc.Number_of_Contacts__c = numContacts;
            }
        }
    }