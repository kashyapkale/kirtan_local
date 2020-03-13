import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/utils/star_wars_styles.dart';

class UsersListItem extends StatelessWidget {
  final Userdetail userdetail;

  UsersListItem({@required this.userdetail});

  @override
  Widget build(BuildContext context) {
    var title = Text(
      userdetail?.userid,
      style: TextStyle(
        color: StarWarsStyles.titleColor,
        fontWeight: FontWeight.bold,
        fontSize: StarWarsStyles.titleFontSize,
      ),
    );

    var subTitle = Row(
      children: <Widget>[
        Icon(
          Icons.movie,
          color: StarWarsStyles.subTitleColor,
          size: StarWarsStyles.subTitleFontSize,
        ),
        Container(
          margin: const EdgeInsets.only(left: 4.0),
          child: Text(
            userdetail?.username,
            style: TextStyle(
              color: StarWarsStyles.subTitleColor,
            ),
          ),
        ),
      ],
    );

    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          title: title,
          subtitle: subTitle,
        ),
        Divider(),
      ],
    );
  }
}