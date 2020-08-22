import { LightningElement, api } from "lwc";

export default class MeetingRoom extends LightningElement {
  @api meetingRoomInfo = { roomName: "A-01", roomCapacity: "12" };

  @api showRoomInfo = false;

  tileClickHandler() {
    const tileclicked = new CustomEvent("tileclick", {
      detail: this.meetingRoomInfo
    });
    this.dispatchEvent(tileclicked);
  }
}