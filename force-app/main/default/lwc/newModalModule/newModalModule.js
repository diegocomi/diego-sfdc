import { api } from 'lwc';
import LightningModal from 'lightning/modal';

export default class NewModalModule extends LightningModal {
    handleOkay(){
        this.close('okay');
    }
}