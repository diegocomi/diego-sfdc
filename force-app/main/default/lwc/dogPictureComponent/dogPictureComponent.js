import { LightningElement, wire } from "lwc";
import Id from "@salesforce/user/Id";
import Username_Field from "@salesforce/schema/User.Username";
import { getRecord } from 'lightning/uiRecordApi';
import BorderColliePicture from "@salesforce/resourceUrl/Dog_Picture";
import publishDogLike from "@salesforce/apex/DogLikePublisher.publishDogLikeEvent";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class DogPictureComponent extends LightningElement {
  currentUsername;
  error;

  @wire(getRecord, {recordId: Id, fields : [Username_Field]})
  currentUserInfo({error, data}){
    if(data) {
      this.currentUsername = data.fields.Username.value;
    } else if (error) {
      this.error = error;
    }
  }

  get dogPictureURL() {
      return BorderColliePicture;
  }

  handleDogLike() {
    let dogPictureWrapper = {
      dogPicture : this.dogPictureURL,
      username : this.currentUsername
    };

    publishDogLike({wrapper: dogPictureWrapper})
      .then(() => {
        const successToast = new ShowToastEvent({
          title: 'Thank you!',
          message: 'Thank you for your like!',
          variant: 'success'
        });
        this.dispatchEvent(successToast);
      })
      .catch((error) => {
        const errorToast = new ShowToastEvent({
          title: 'Error',
          message: error.body.message,
          variant: 'error'
        });
        this.dispatchEvent(errorToast);
      })
  }

}