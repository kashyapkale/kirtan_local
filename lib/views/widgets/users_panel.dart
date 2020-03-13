import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/view_models/main_page_view_model.dart';
import 'package:flutter_kirthan/views/widgets/user_list_item_list.dart';
import 'package:flutter_kirthan/views/widgets/no_internet_connection.dart';
import 'package:scoped_model/scoped_model.dart';

class UsersPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<Userdetail>>(
          future: model.userdetails,
          builder: (_, AsyncSnapshot<List<Userdetail>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: const CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var films = snapshot.data;
                  return ListView.builder(
                    itemCount: films == null ? 0 : films.length,
                    itemBuilder: (_, int index) {
                      var film = films[index];
                      return UsersListItem(userdetail: film);
                    },
                  );
                } else if (snapshot.hasError) {
                  return NoInternetConnection(
                    action: () async {
                      await model.setUserdetails();
                      await model.setUserdetails();
                      await model.setUserdetails();
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