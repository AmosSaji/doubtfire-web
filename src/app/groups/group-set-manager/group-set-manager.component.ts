import { Component, Input } from '@angular/core';

@Component({
  selector: 'group-set-manager',
  templateUrl: './group-set-manager.component.html',
  styleUrls: ['./group-set-manager.component.scss'],
})
export class GroupSetManagerComponent {
  @Input() unit: any;
  @Input() unitRole: any;
  @Input() project: any;
  @Input() selectedGroup: any;
  @Input() selectedGroupSet: any;
  @Input() showGroupSetSelector: boolean;

  constructor() {}

  newGroupSelected() {
    // Logic for selecting a new group
    console.log('New group selected');
  }

  updateGroup(group: any) {
    // Logic for updating the group
    console.log('Group updated:', group);
  }

  addMember(student: any) {
    // Logic for adding a member to the group
    console.log('Member added:', student);
  }

  groupMembersLoaded() {
    // Logic for handling group members being loaded
    console.log('Group members loaded');
  }
}
