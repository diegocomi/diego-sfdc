import { LightningElement, api } from 'lwc';

export default class UtilityBarComponent extends LightningElement {
    @api prop1;
    @api recordId;

    connectedCallback(){
        console.log('connected');
    }

    renderedCallback() {
        console.log('rendered');
    }

    disconnectedCallback() {
        console.log('disconnected');
    }

    handleButtonClick() {
        console.log(this.recordId);
    }
}
