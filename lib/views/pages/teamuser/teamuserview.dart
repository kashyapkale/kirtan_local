import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/teamuser.dart';
import 'package:flutter_kirthan/views/pages/teamuser/userinfo.dart';
import 'package:flutter_kirthan/views/pages/teamuser/teaminfo.dart';

class TeamUserView extends StatefulWidget {
  final String title = "Team User Mapping";

  @override
  _TeamUserViewState createState() =>
      _TeamUserViewState();
}

class _TeamUserViewState extends State<TeamUserView> {
  List<TeamUser> listofteamusers = [
    TeamUser(id: 1,teamId: 1,userId: 1,createdBy: "SYSTEM",createTime: "2020-04-19T15:41:04.783",updatedBy: "SYSTEM",updateTime: "2020-04-19T15:41:04.783"),
    TeamUser(id: 2,teamId: 1,userId: 2,createdBy: "SYSTEM",createTime: "2020-04-19T15:41:04.783",updatedBy: "SYSTEM",updateTime: "2020-04-19T15:41:04.783"),
    TeamUser(id: 3,teamId: 1,userId: 3,createdBy: "SYSTEM",createTime: "2020-04-19T15:41:04.783",updatedBy: "SYSTEM",updateTime: "2020-04-19T15:41:04.783"),
    TeamUser(id: 4,teamId: 2,userId: 1,createdBy: "SYSTEM",createTime: "2020-04-19T15:41:04.783",updatedBy: "SYSTEM",updateTime: "2020-04-19T15:41:04.783"),
    TeamUser(id: 5,teamId: 2,userId: 2,createdBy: "SYSTEM",createTime: "2020-04-19T15:41:04.783",updatedBy: "SYSTEM",updateTime: "2020-04-19T15:41:04.783"),
    TeamUser(id: 6,teamId: 2,userId: 3,createdBy: "SYSTEM",createTime: "2020-04-19T15:41:04.783",updatedBy: "SYSTEM",updateTime: "2020-04-19T15:41:04.783"),
  ];

  List<int> setofTeams;

  @override
  void initState() {
     super.initState();
     setofTeams= listofteamusers.map((user) => user.teamId).toSet().toList();

  }

  Widget teamUserTreeView() {
    TeamInfo team;
    Set<int> setofTeams= listofteamusers.map((user) => user.teamId).toSet();
    //Set<int> setofTeams= mapTeams.toSet();
    setofTeams.forEach((teamid) {
      //team = new TeamInfo(teamId: teamid);
      team = new TeamInfo(teamId: teamid);
      List<TeamUser> users= listofteamusers.where((user) => user.teamId==teamid).toList();
      users.forEach((myuser) => team.addUser(UserInfo(userid: myuser.userId, username: myuser.userId)));
      //team.render(context);
      return team;
    }
    );

    return team;
  }

  Widget teamUserTreeList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listofteamusers.length ,
      itemBuilder: ( BuildContext context,int index) {
            //return new Text(listofteamusers[index].teamId.toString());
            return new ExpansionTile (
                  title: Text(listofteamusers[index].teamId.toString()),

                //listofteamusers[index].teamId.toString()
            );
      });
  }

  ExpansionTileList() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: new ListView.builder(
            itemCount: setofTeams.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                title: Text("Team Name: ${setofTeams[index]}"),
                subtitle: Text("Hello"),
                children: <Widget>[

                ],
              );
            }
            ),
       ),
    ),
    );
  }
}

