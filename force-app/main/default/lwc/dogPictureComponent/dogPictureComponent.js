import { LightningElement } from "lwc";
import BorderColliePicture from "@salesforce/resourceUrl/Dog_Picture";
import DachsundPicture from "@salesforce/resourceUrl/dachspicture";
import splitsdk from "@salesforce/resourceUrl/splitsdk";
import { loadScript } from "lightning/platformResourceLoader";
import Id from '@salesforce/user/Id';



export default class DogPictureComponent extends LightningElement {
  treatment;
  userId = Id;
  splitIoClient;
  
  get dogPictureURL() {
    if(this.treatment === 'Einstein') {
      return BorderColliePicture;
    } else if (this.treatment === 'Yext') {
      return DachsundPicture;
    } else {
      return DachsundPicture;
    }
  }

  get treatment_loaded () {
    return !!this.treatment;
  }

  renderedCallback() {
    loadScript(this, splitsdk).then(() => {
      const factory = splitio({
        core: {
          authorizationKey: 'tv7jnj9t3da4vs6ebvug8cppde19v4vk0004',
          key: this.userId,
          trafficType: 'user'
        },
        startup: {
          readyTimeout: 1.5,
        }
      });

      this.splitIoClient = factory.client();

      this.splitIoClient.on(this.splitIoClient.Event.SDK_READY, () => {
        let treatment = this.splitIoClient.getTreatment("AB_SF_CHATBOT");
        console.log('treament = ' + treatment);
        this.treatment = treatment;
      });
    });
  }

  disconnectedCallback() {
    this.splitIoClient.destroy();
  }

    

}