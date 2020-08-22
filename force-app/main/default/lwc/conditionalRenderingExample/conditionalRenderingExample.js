import { LightningElement, track } from "lwc";

export default class ConditionalRenderingExample extends LightningElement {
  @track displayDiv = false;

  @track cityList = ["Gargallo", "Rome", "London", "Paris", "Berlin"];

  showDivHandler(event) {
    this.displayDiv = event.target.checked;
  }
}