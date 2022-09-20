import { LightningElement, wire, track } from 'lwc';
import  retrieveAccounts  from '@salesforce/apex/DragAndDropController.retrieveAccountsWithStatus';
import updateAccountStatus from '@salesforce/apex/DragAndDropController.updateAccountStatus';

export default class DragAndDrop extends LightningElement {

    @track suspended = [];
    @track active = [];
    @track inactive = [];

    @wire(retrieveAccounts)
    accounts({error, data}) {
        if(data) {
            data.forEach(account => {
                if(!!account.accountStatus){
                    this[account.accountStatus.toLowerCase()].push(account);
                }
            });
        } 
    }

    handleDrag(event) {
        event.dataTransfer.setData("recordId", event.target.dataset.recordId);
    }

    allowDrop(event) {
        event.preventDefault();
    }

    handleDrop(event) {
        event.preventDefault();
        let targetRecordId = event.dataTransfer.getData("recordId");
        let targetStatusValue = event.target.dataset.statusValue;
        console.log(event.target);
        let accountWrapper = {accountId : targetRecordId, accountStatus : targetStatusValue, accountName : null};
       // updateAccountStatus({accountData : accountWrapper})
       //  .then(() => {
       //     console.log('ok');
       //  })
        
    }
}