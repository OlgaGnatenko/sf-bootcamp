import { LightningElement, wire } from "lwc";

import getJobPositions from "@salesforce/apex/JobPositionController.getJobPositions";
const COLUMNS = [
  { label: "Name", fieldName: "Name", type: "text" },
  {
    label: "Title",
    fieldName: "Job_Position_Title__c",
    type: "text"
  },
  {
    label: "Candidate Level",
    fieldName: "Candidate_Level__c",
    type: "text"
  },
  {
    label: "Practice Unit",
    fieldName: "Practice_Unit__c",
    type: "text"
  },
  { label: "Location", fieldName: "Location__c", type: "text" },
  {
    label: "Position Budget",
    fieldName: "Position_Budget__c",
    type: "currency"
  }
];
export default class PositionsList extends LightningElement {
  columns = COLUMNS;
  @wire(getJobPositions)
  positions;
}
