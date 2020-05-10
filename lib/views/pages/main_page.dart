import 'dart:async';
import 'package:flutter_kirthan/views/widgets/settings/settings_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kirthan/view_models/main_page_view_model.dart';
import 'package:flutter_kirthan/views/widgets/event/event_panel.dart';
import 'package:flutter_kirthan/views/widgets/team/team_panel.dart';
import 'package:flutter_kirthan/views/widgets/user/user_panel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_kirthan/views/widgets/aboutus.dart';
import 'package:flutter_kirthan/views/widgets/faq.dart';
import 'package:flutter_kirthan/views/widgets/rateus.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/views/widgets/settings/pref_settings.dart';




class MainPage extends StatefulWidget {
  final MainPageViewModel viewModel;

  MainPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    UsersPanel(
      userType: "SuperAdmin",
    ),
    EventsPanel(
      eventType: "All",
    ),
    TeamsPanel(
      teamType: "All",
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future loadData() async {
    //await widget.viewModel.setSuperAdminUserRequests("SuperAdmin");
    await widget.viewModel.setUserRequests("All");
    await widget.viewModel.setEventRequests("All");
    await widget.viewModel.setTeamRequests("All");
  }

  @override
  void initState() {
    super.initState();
    //tabController = TabController(vsync: this, length: 3);
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            child: ListView(
              children: <Widget>[

                Card(
                  child : ListTile(
                    title: Text("Profile"),
                    trailing: Icon(Icons.face),
                    onTap: () {


                    },
                  ),
                ),

                Card(
                  child: ListTile(
                    title: Text("Participated Teams"),
                    trailing: Icon(Icons.phone_in_talk),
                  ),
                ),

                Card(
                  child : ListTile(
                    title: Text("Interested Events"),
                    trailing: Icon(Icons.event),
                  ),
                ),


                Card(
                  child:ListTile(
                    title: Text("Settings"),
                    trailing: Icon(Icons.settings),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MySettingsApp()));
                    },
                  ),
                ),

                Card(
                  child:ListTile(
                    title: Text("Share app"),
                    trailing: Icon(Icons.share),
                    onTap: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext bc){
                            return Container(
                              child: new Wrap(
                                children: <Widget>[
                                  new ListTile(
                                      leading: new Icon(Icons.apps),
                                      title: new Text('WhatsApp'),
                                      onTap: () => {}
                                  ),
                                  new ListTile(
                                    leading: new Icon(Icons.mail),
                                    title: new Text('Mail'),
                                    onTap: () => {},
                                  ),
                                  new ListTile(
                                    leading: new Icon(Icons.message),
                                    title: new Text('Sms'),
                                    onTap: () => {},
                                  ),
                                ],
                              ),
                            );
                          }
                      );


                    },
                  ),
                ),

                Card(
                  child:ListTile(
                    title: Text("Rate Us"),
                    trailing: const Icon(Icons.rate_review),
                    onTap: (){
                      showDialog(
                          context: context,
                          barrierDismissible: true, // set to false if you want to force a rating
                          builder: (context) {
                            return RatingDialog(
                              icon: Icon(Icons.rate_review),
                              title: "Rate Us",
                              description:
                              "Tap a star to set your rating. Add more description here if you want.",
                              submitButton: "SUBMIT",
                              alternativeButton: "Contact us instead?", // optional
                              positiveComment: "We are so happy to hear :)", // optional
                              negativeComment: "We're sad to hear :(", // optional
                              accentColor: Colors.red, // optional
                              onSubmitPressed: (int rating) {
                                print("onSubmitPressed: rating = $rating");
                              },
                              onAlternativePressed: () {
                                print("onAlternativePressed: do something");
                              },
                            );
                          });
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => RateUsApp()));
                    },
                  ),
                ),

                Card(
                  child:ListTile(
                    title: Text("About Us"),
                    trailing: Icon(Icons.info),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsApp()));
                    },
                  ),
                ),

                Card(
                  child:ListTile(
                    title: Text("FAQs"),
                    trailing: Icon(Icons.question_answer),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FaqApp()));
                    },
                  ),
                ),

                Card(
                  child:ListTile(
                      title: Text("Logout"),
                      trailing: Icon(Icons.remove_circle_outline),
                      onTap:(){
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(20.0)), //this right here
                                child: Container(
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Do you want to Logout?'),
                                        ),
                                        SizedBox(
                                          width: 320.0,
                                          child: RaisedButton(
                                            onPressed: () {

                                            },
                                            child: Text(
                                              "yes",
                                              style: TextStyle(
                                                  fontSize: MyPrefSettingsApp.custFontSize,
                                                  color: Colors.white),
                                            ),
                                            color: const Color(0xFF1BC0C5),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 320.0,
                                          child: RaisedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "No",
                                              style: TextStyle(
                                                  fontSize: MyPrefSettingsApp.custFontSize,
                                                  color: Colors.white),
                                            ),
                                            color: const Color(0xFF1BC0C5),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                  ),
                ),



              ],
            )
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Request Approvals',
            style: TextStyle(
              fontFamily: 'Distant Galaxy',
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          //backgroundColor: Colors.blue,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.users),
              title: Text('Users'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.globeAmericas),
              title: Text('Events'),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.teamspeak),
              title: Text('Teams'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        //body: _widgetOptions[_selectedIndex],
        body: ScopedModel<MainPageViewModel>(
          model: widget.viewModel,
          child: _widgetOptions[_selectedIndex],
          /*child: TabBarView(
          controller: tabController,
          children: <Widget>[
            UsersPanel(
              userType: "SuperAdmin",
            ),

            EventsPanel(
              eventType: "All",
            ),
            TeamsPanel(
              teamType: "All",
            ),

          ],
        ),*/
        ));
  }

/*@override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }*/
}