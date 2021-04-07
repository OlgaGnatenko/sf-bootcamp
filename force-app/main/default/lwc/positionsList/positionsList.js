import { LightningElement, wire } from "lwc";

import getJobPositions from "@salesforce/apex/JobPositionController.getJobPositions";
const COLUMNS = [
  { label: "Name", fieldName: "Job_Position__c.Name", type: "text" },
  {
    label: "Title",
    fieldName: "Job_Position__c.Job_Position_Title__c",
    type: "text"
  },
  {
    label: "Candidate Level",
    fieldName: "Job_Position__c.Candidate_Level__c",
    type: "text"
  },
  {
    label: "Practice Unit",
    fieldName: "Job_Position__c.Practice_Unit__c",
    type: "text"
  },
  { label: "Location", fieldName: "Job_Position__c.Location__c", type: "text" },
  {
    label: "Position Budget",
    fieldName: "Job_Position__c.Position_Budget__c",
    type: "currency"
  }
];
export default class PositionsList extends LightningElement {
  columns = COLUMNS;
  @wire(getJobPositions)
  positions;
}
