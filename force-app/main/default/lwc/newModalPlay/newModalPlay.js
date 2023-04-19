import { LightningElement } from 'lwc';
import LightningAlert from 'lightning/alert';
import LightningConfirm from 'lightning/confirm';
import LightningPrompt from 'lightning/prompt';
import NewModalModule from 'c/newModalModule';

export default class NewModalPlay extends LightningElement {
    async handleAlertClick() {
        await LightningAlert.open({
            message: 'alert message',
            theme: 'error',
            label: 'error!'
        });
        //do things here when the alert is closed
        console.log('alert closed');
    }

    async handleConfirmClick(){
        const result = await LightningConfirm.open({
            message : 'confirm modal message',
            variant : 'headerless',
            label : 'modal label'
        });
        //this executes after the modal closes
        //result is true if ok was clicked, and false if cancel was clicked

        if(result){
            console.log('ok was clicked');
        } else {
            console.log('cancel was clicked');
        }
    }

    //the open() method of LightningPrompt returns a promise
    handlePromptClick(){
        LightningPrompt.open({
            message : 'prompt message',
            label : 'please respond',
            defaultValue: 'initial input value'
        }).then((result) => {
            //result is input text
            console.log(result);
            //and null if cancel was clicked
            if(!result){
                console.log('cancel was clicked');
            }
        })
    }

    handleOpenModal(){
        NewModalModule.open({
            size : 'medium'
        });
    }


}