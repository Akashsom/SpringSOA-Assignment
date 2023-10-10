trigger UpdateNumberOfContacts on Contact (after insert, after update, after delete, after undelete) {
    if (Trigger.isInsert || Trigger.isUpdate || Trigger.isundelete) {
        AccountHandler.updateNumberOfContacts(Trigger.new);
    } else if (Trigger.isDelete) {
        AccountHandler.updateNumberOfContacts(Trigger.old);
    }
}