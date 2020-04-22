import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/teamuser.dart';
import 'package:flutter_kirthan/interfaces/i_restapi_svcs.dart';
import 'package:flutter_kirthan/services/data_services.dart';

class TeamUserView extends StatefulWidget {
  final String title = "Team User Mapping View";

  @override
  _TeamUserViewState createState() =>
      _TeamUserViewState();
}

class _TeamUserViewState extends State<TeamUserView> {
  final IKirthanRestApi apiSvc = new RestAPIServices();
  Future<List<TeamUser>> teamusers;

  List<TeamUser> listofteamusers = [
    TeamUser(id: 1,teamId: 1,userId: 1,createdBy: "SYSTEM",createTime: "2020-04-19T15:41:04.783",updatedBy: "SYSTEM",updateTime: "2020-04-19T15:41:04.783"),
    TeamUser(id: 2,teamId: 1,userId: 2,createdBy: "SYSTEM",createTime: "2020-04-19T15:41:04.783",updatedBy: "SYSTEM",updateTime: "2020-04-19T15:41:04.783"),
    TeamUser(id: 3,teamId: 1,userId: 3,createdBy: "SYSTEM",createTime: "2020-04-19T15:41:04.783",updatedBy: "SYSTEM",updateTime: "2020-04-19T15:41:04.783"),
    TeamUser(id: 4,teamId: 2,userId: 1,createdBy: "SYSTEM",createTime: "2020-04-19T15:41:04.783",updatedBy: "SYSTEM",updateTime: "2020-04-19T15:41:04.783"),
    TeamUser(id: 5,teamId: 2,userId: 2,createdBy: "SYSTEM",createTime: "2020-04-19T15:41:04.783",updatedBy: "SYSTEM",updateTime: "2020-04-19T15:41:04.783"),
    TeamUser(id: 6,teamId: 2,userId: 3,createdBy: "SYSTEM",createTime: "2020-04-19T15:41:04.783",updatedBy: "SYSTEM",updateTime: "2020-04-19T15:41:04.783"),
    TeamUser(id: 7,teamId: 2,userId: 4,createdBy: "SYSTEM",createTime: "2020-04-19T15:41:04.783",updatedBy: "SYSTEM",updateTime: "2020-04-19T15:41:04.783"),
  ];

  @override
  void initState() {
    teamusers = apiSvc?.getTeamUserMappings("SA");
    super.initState();
  }

 List<Widget> populateChildren(int teamid) {
   List<Widget> children = new List<Widget>();
   List<TeamUser> listofusers = listofteamusers.where((user) => user.teamId==teamid).toList();
   for(var user in listofusers) {
     children.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(user.userId.toString()),
                Checkbox(
                  value: false,
                  onChanged: (input) {
                    setState(() {

                    });
                  },
                ),
              ],
            )
     );
   }
   return children;
 }

  @override
  Widget build(BuildContext context) {
    List<int> setofTeams= listofteamusers.map((user) => user.teamId).toSet().toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: new ListView.builder(
            shrinkWrap: true,
            itemCount: setofTeams.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                initiallyExpanded: true,
                title: Text("Team Name: ${setofTeams[index]}"),
                subtitle: Text("Hello"),
                children: populateChildren(setofTeams[index]),
              );
            }
            ),
       ),
    ),
    );
  }
}

