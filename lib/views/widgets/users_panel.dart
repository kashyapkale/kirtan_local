import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/view_models/main_page_view_model.dart';
import 'package:flutter_kirthan/views/widgets/user_list_item_list.dart';
import 'package:flutter_kirthan/views/widgets/no_internet_connection.dart';
import 'package:scoped_model/scoped_model.dart';

class UsersPanel extends StatelessWidget {
  String userType;
  UsersPanel({this.userType});
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<Userdetail>>(
          future: (userType =="All") ? model.allusers:model.superadminusers,
          builder: (_, AsyncSnapshot<List<Userdetail>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: const CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var users = snapshot.data;
                  return ListView.builder(
                    itemCount: users == null ? 0 : users.length,
                    itemBuilder: (_, int index) {
                      var user = users[index];
                      return UsersListItem(userdetail: user);
                    },
                  );
                } else if (snapshot.hasError) {
                  return NoInternetConnection(
                    action: () async {
                      await model.setSuperAdminUsers("SuperAdmin");
                      await model.setAllUsers("All");
                      //await model.setUserdetails();
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