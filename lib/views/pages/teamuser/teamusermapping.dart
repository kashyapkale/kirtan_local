import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/user.dart';

class TeamUserMapping extends StatefulWidget {
  TeamUserMapping({this.selectedUsers}) : super();
  List<UserRequest> selectedUsers;

  final String title = "Team User Mapping";

  @override
  _TeamUserMappingState createState() =>
      _TeamUserMappingState(selectedUsers: selectedUsers);
}

class _TeamUserMappingState extends State<TeamUserMapping> {
  final _formKey = GlobalKey<FormState>();
  List<UserRequest> selectedUsers;

  _TeamUserMappingState({this.selectedUsers});

  List<String> _teams = ['Adilabad',
    'Anantapur',
    'Chittoor',
    'Kakinada',
    'Guntur',
    'Hyderabad'];
  String _selectedTeam;

  @override
  Widget build(BuildContext context) {
    print(selectedUsers.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          DropdownButtonFormField<String>(
            value: _selectedTeam,
            icon: const Icon(Icons.supervisor_account),
            hint: Text('Select Team'),
            items: _teams
                .map((team) => DropdownMenuItem<String>(
              value: team,
              child: Text(team),
            )).toList(),
            onChanged: (input) {
              setState(() {
                _selectedTeam = input;
              });
            },
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: selectedUsers == null ? 0 : selectedUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(selectedUsers[index].firstName),
                  subtitle: Text(selectedUsers[index].lastName),
                );
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('SELECTED ${selectedUsers.length}'),
                  onPressed: null,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  child: Text('DELETE SELECTED'),
                  onPressed: null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
