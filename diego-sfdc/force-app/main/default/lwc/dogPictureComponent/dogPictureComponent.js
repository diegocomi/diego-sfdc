import { LightningElement } from "lwc";
import Dog_Picture from "@salesforce/resourceUrl/Dog_Picture";

export default class DogPictureComponent extends LightningElement {
  dogPictureURL = Dog_Picture;
}