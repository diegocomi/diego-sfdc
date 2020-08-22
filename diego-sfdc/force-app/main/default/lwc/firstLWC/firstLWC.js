import { LightningElement, track } from "lwc";

export default class FirstLWC extends LightningElement {
  @track dynamicGreeting = "Diego";

  greetingChangeHandler(event) {
    this.dynamicGreeting = event.target.value;
  }
}