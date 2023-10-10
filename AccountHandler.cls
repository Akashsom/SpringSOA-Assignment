public class AccountHandler {
    public static void updateNumberOfContacts(List<Contact> contacts) {
        Set<Id> accountIds = new Set<Id>();

        for (Contact contact : contacts) {
            if (contact.AccountId != null) {
                accountIds.add(contact.AccountId);
            }
        }

        if (!accountIds.isEmpty()) {
            List<Account> accountsToUpdate = [SELECT Id, Number_of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN: accountIds];
            for (Account acc : accountsToUpdate) {
                acc.Number_of_Contacts__c = acc.Contacts.size();
            }
            update accountsToUpdate;
        }
    }
}