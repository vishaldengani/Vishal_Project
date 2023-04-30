

import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';

const columns = [
    { label: 'Account ID', fieldName: 'Id' },
    { label: 'Created Date', fieldName: 'CreatedDate' },
    { label: 'Account Name',fieldName : 'Name'},
    { label : 'Number of contacts',fieldName :'Number_of_Contacts__c'}
];

export default class AccountList extends LightningElement {
    @wire(getAccounts)
    accounts;

    columns = columns;
}
