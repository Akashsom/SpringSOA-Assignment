import { LightningElement, wire } from 'lwc';
import getRecentAccounts from '@salesforce/apex/RecentAccountsController.getRecentAccounts';

const columns = [
    { label: 'Account Name', fieldName: 'Name', type: 'text' },
    { label: 'Created Date', fieldName: 'CreatedDate', type: 'date' },
];

export default class RecentAccountsTable extends LightningElement {
    columns = columns;
    accountData;

    @wire(getRecentAccounts)
    wiredRecentAccounts({ data, error }) {
        if (data) {
            this.accountData = data;
        } else if (error) {
            console.error(error);
        }
    }
}