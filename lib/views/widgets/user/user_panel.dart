import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/view_models/main_page_view_model.dart';
import 'package:flutter_kirthan/views/pages/teamuser/teamuserview.dart';
import 'package:flutter_kirthan/views/pages/teamuser/userselection.dart';
import 'package:flutter_kirthan/views/pages/user/user_maintenance.dart';
import 'package:flutter_kirthan/views/widgets/no_internet_connection.dart';
import 'package:flutter_kirthan/views/widgets/user/user_list_item.dart';
import 'package:scoped_model/scoped_model.dart';

class UsersPanel extends StatelessWidget {
  String userType;
  UsersPanel({this.userType});
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<UserRequest>>(
            future: model.userrequests,
            // ignore: missing_return
            builder: (_, AsyncSnapshot<List<UserRequest>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(child: const CircularProgressIndicator());
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    var userRequests = snapshot.data;
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
                                  child: const Text("Super Admin"),
                                  onPressed: () {
                                    print("Super Admin");
                                    model.setUserRequests("SA");
                                  },
                                ),
                                RaisedButton(
                                  child: const Text("Admin"),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TeamUserView()));
                                  },
                                ),
                                RaisedButton(
                                  child: const Text("Team-User Add"),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UserSelection()));
                                  },
                                ),
                                /*Expanded(
                                child: FloatingActionButton(
                                  child: const Text("+"),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UserWrite()));
                                  },
                                ),
                              ),*/
                              ],
                            ),
                          ),
                        ),
                      ),
                      body: new RefreshIndicator(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                        userRequests == null ? 0 : userRequests.length,
                        itemBuilder: (_, int index) {
                          var userrequest = userRequests[index];
                          return UserRequestsListItem(userrequest: userrequest);
                        },
                      ),
                        onRefresh: () {
                          model.setUserRequests("SA");
                        },
                      ),
                      floatingActionButton: FloatingActionButton(
                        child: const Text("+",
                        style: TextStyle(
                          fontSize:20,
                        ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserWrite()));
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return NoInternetConnection(
                      action: () async {
                        //await model.setSuperAdminUserRequests("SuperAdmin");
                        await model.setUserRequests("All");
                        //await model.setUserdetails();
                      },
                    );
                  }
              }
            });
      },
    );
  }
}
