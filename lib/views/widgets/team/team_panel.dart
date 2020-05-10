import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/team.dart';
import 'package:flutter_kirthan/view_models/main_page_view_model.dart';
import 'package:flutter_kirthan/views/pages/team/team_maintenance.dart';
import 'package:flutter_kirthan/views/widgets/no_internet_connection.dart';
import 'package:flutter_kirthan/views/widgets/team/team_list_item.dart';
import 'package:scoped_model/scoped_model.dart';

class TeamsPanel extends StatelessWidget {
  String teamType;
  TeamsPanel({this.teamType});
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<TeamRequest>>(
          future: model.teamrequests,
          // ignore: missing_return
          builder: (_, AsyncSnapshot<List<TeamRequest>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: const CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var teamRequests = snapshot.data;
                  return Scaffold(
                      appBar: AppBar(
                      backgroundColor: Colors.white,
                        bottom: PreferredSize(
                        preferredSize: Size(double.infinity, 10.0),
                          child: Padding(
                          padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                              RaisedButton(
                              child: const Text("All Teams"),
                              onPressed: () {
                                print("All Teams");
                                model.setTeamRequests("AE");
                              },
                            ),
                            /*
                            RaisedButton(
                              child: const Text("Admin"),
                              onPressed: () {
                                print("Admin");
                                model.setUserRequests("A");
                              },
                            ),
                            RaisedButton(
                              child: const Text("User"),
                              onPressed: () {
                                print("Users");
                                model.setUserRequests("U");
                              },
                            ),*/
                            /*Expanded(
                              child: RaisedButton(
                                child: const Text("Create a Team"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TeamWrite()));
                                },
                              ),
                            ),*/
                          ],
                        ),
                          ),
                        ),
                      ),
                    body:  new RefreshIndicator(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                          teamRequests == null ? 0 : teamRequests.length,
                          itemBuilder: (_, int index) {
                            var teamrequest = teamRequests[index];
                            return TeamRequestsListItem(
                                teamrequest: teamrequest);
                          },
                        ),
                      onRefresh: () {
                        model.setTeamRequests("AE");
                      },
                    ),
                    floatingActionButton: FloatingActionButton(
                      child: const Text("+",
                        style: TextStyle(
                          fontSize:20,
                        ),),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TeamWrite()));
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return NoInternetConnection(
                    action: () async {
                      await model.setTeamRequests("All");
                    },
                  );
                }
            }
          },
        );
      },
    );
  }
}
