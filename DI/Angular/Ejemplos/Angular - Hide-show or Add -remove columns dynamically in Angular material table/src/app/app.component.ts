import { Component, ViewChild, OnInit } from '@angular/core';
import { User } from './user/User';
import { MatTableDataSource, MatPaginator, MatSort } from '@angular/material';

interface CustomColumn {
  possition: number;
  name: string;
  isActive: boolean;
}

@Component({
  selector: 'my-app',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent implements OnInit {

  userList: User[];
  selectedRow: number;
  editedRows: boolean[];
  public columnList = ['srno', 'userName', 'email', 'contactNo', 'address'];
  public columnShowHideList: CustomColumn[] = [];

  userListMatTabDataSource = new MatTableDataSource<User>(this.userList);

  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  constructor() { }

  ngOnInit() {
    this.initializeColumnProperties();
    this.editedRows = [];
    this.getAlldata();
    console.log(this.userList);
    this.userListMatTabDataSource.paginator = this.paginator;
    this.userListMatTabDataSource.sort = this.sort;
  }

  applyFilter(filterValue: string) {
    this.userListMatTabDataSource.filter = filterValue.trim().toLowerCase();
  }

  toggleColumn(column) {
    if (column.isActive) {
      if (column.possition > this.columnList.length - 1) {
        this.columnList.push(column.name);
      } else {
        this.columnList.splice(column.possition, 0, column.name);
      }
    } else {
      let i = this.columnList.indexOf(column.name);
      let opr = i > -1 ? this.columnList.splice(i, 1) : undefined;
    }
  }

  initializeColumnProperties() {
    this.columnList.forEach((element, index) => {
      this.columnShowHideList.push(
        { possition: index, name: element, isActive: true }
      );
    });
    // After for loop it will look like this
    //   public columnShowHideList = [
    //   { possition: 0, name: 'action', isActive: true },
    //   { possition: 1, name: 'userName', isActive: true },
    //   { possition: 2, name: 'email', isActive: true },
    //   { possition: 3, name: 'contactNo', isActive: true },
    //   { possition: 4, name: 'address', isActive: true }
    // ];
  }

  getAlldata() {
    this.userList = [
      {
        id: 1, userName: 'Ramesh', password: 'rebqwtye', email: 'ramesh@gmail.com',
        contactNo: '9788235466', address: '123 RG Road, XYCity', edited: undefined
      },
      {
        id: 2, userName: 'Suresh', password: 'rebqwtye', email: 'suresh@gmail.com',
        contactNo: '9788235466', address: '123 RG Road, XYCity', edited: undefined
      },
      {
        id: 3, userName: 'Ganesh', password: 'rebqwtye', email: 'ganesh@gmail.com',
        contactNo: '9788235466', address: '123 RG Road, XYCity', edited: undefined
      },
      {
        id: 4, userName: 'Bhavesh', password: 'rebqwtye', email: 'bhavesh@gmail.com',
        contactNo: '9788235466', address: '123 RG Road, XYCity', edited: undefined
      },
      {
        id: 5, userName: 'Bhavesh', password: 'rebqwtye', email: 'bhavesh@gmail.com',
        contactNo: '9788235466', address: '123 RG Road, XYCity', edited: undefined
      },
      {
        id: 6, userName: 'Bhavesh', password: 'rebqwtye', email: 'bhavesh@gmail.com',
        contactNo: '9788235466', address: '123 RG Road, XYCity', edited: undefined
      },
      {
        id: 7, userName: 'Bhavesh', password: 'rebqwtye', email: 'bhavesh@gmail.com',
        contactNo: '9788235466', address: '123 RG Road, XYCity', edited: undefined
      }
    ];
    this.userListMatTabDataSource.data = this.userList;
  }

  rowClick(rowId) {
    this.selectedRow = rowId;
  }


}
