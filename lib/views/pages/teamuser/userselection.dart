import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/views/pages/teamuser/teamusermapping.dart';

class UserSelection extends StatefulWidget {
  UserSelection({Key key}) : super(key: key);

  final String title = "User Selection";

  @override
  _UserSelectionState createState() => _UserSelectionState();
}

class _UserSelectionState extends State<UserSelection> {
  final _formKey = GlobalKey<FormState>();

  List<UserRequest> users;
  List<UserRequest> selectedUsers;
  bool sort;

  @override
  void initState() {
    sort = false;
    selectedUsers = [];
    users = UserRequest.getUsers();
    super.initState();
  }

  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.firstName.compareTo(b.firstName));
      } else {
        users.sort((a, b) => b.firstName.compareTo(a.firstName));
      }
    }
  }

  onSelectedRow(bool selected, UserRequest user) async {
    setState(() {
      if (selected) {
        selectedUsers.add(user);
      } else {
        selectedUsers.remove(user);
      }
    });
  }

  deleteSelected() async {
    setState(() {
      if (selectedUsers.isNotEmpty) {
        List<UserRequest> temp = [];
        temp.addAll(selectedUsers);
        for (UserRequest user in temp) {
          users.remove(user);
          selectedUsers.remove(user);
        }
      }
    });
  }

  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortAscending: sort,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
              label: Text("FirstName"),
              numeric: false,
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }),
          DataColumn(
            label: Text("LastName"),
            numeric: false,
          ),
          DataColumn(
            label: Text("UserName"),
            numeric: false,
          ),
        ],
        rows: users
            .map(
              (user) => DataRow(
                  selected: selectedUsers.contains(user),
                  onSelectChanged: (b) {
                    print("OnSelect");
                    onSelectedRow(b, user);
                  },
                  cells: [
                    DataCell(
                      Text(user.firstName),
                      /*onTap: () {
                        print('Selected ${user.firstName}');
                      },*/
                    ),
                    DataCell(
                      Text(user.lastName),
                    ),
                    DataCell(
                      Text(user.userName),
                    ),
                  ]),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //print("Hello: 1");
    //print(users);
    //print("Hello: 2");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            child: dataBody(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('SELECTED ${selectedUsers.length}'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TeamUserMapping(selectedUsers: selectedUsers)));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('DELETE SELECTED'),
                  onPressed: selectedUsers.isEmpty
                      ? null
                      : () {
                          deleteSelected();
                        },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
