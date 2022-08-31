import { LightningElement, wire, track } from 'lwc';
import  retrieveAccounts  from '@salesforce/apex/DragAndDropController.retrieveAccountsWithStatus';

export default class DragAndDrop extends LightningElement {

    @track suspended = [];
    @track active = [];
    @track inactive = [];

    @wire(retrieveAccounts)
    accounts({error, data}) {
        if(data) {
            data.forEach(account => {
                this[account.accountStatus.toLowerCase()].push(account);
            });
        } 
    }

    handleDrag(event) {
        console.log('dragging');
        console.log(event.target);
    }

    handleDrop(event) {

    }
}