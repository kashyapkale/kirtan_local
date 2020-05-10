import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/event.dart';
import 'package:flutter_kirthan/view_models/main_page_view_model.dart';
import 'package:flutter_kirthan/views/widgets/event/event_list_item.dart';
import 'package:flutter_kirthan/views/widgets/no_internet_connection.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_kirthan/views/pages/event/event_maintenance.dart';
import 'package:flutter_kirthan/views/widgets/event/event_calendar.dart';

class EventsPanel extends StatelessWidget {
  String eventType;
  EventsPanel({this.eventType});
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<EventRequest>>(
          future: model.eventrequests,
          builder: (_, AsyncSnapshot<List<EventRequest>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: const CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var eventRequests = snapshot.data;
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
                            child: const Text("Today"),
                            onPressed: () {print("Today"); model.setEventRequests("1");},
                          ),
                          RaisedButton(
                            child: const Text("Calendar View"),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarPage()));
                            },
                          ),
                          RaisedButton(
                            child: const Text("This Week"),
                            onPressed: null,
                          ),
                         /* Expanded(
                            child:
                            RaisedButton(
                              child: const Text("Create an Event"),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EventWrite()));
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
                        itemCount: eventRequests == null ? 0 : eventRequests
                            .length,
                        itemBuilder: (_, int index) {
                          var eventrequest = eventRequests[index];
                          return EventRequestsListItem(
                              eventrequest: eventrequest);
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
                        ),),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventWrite()));
                      },
                    ),
                  );
                }
                else if (snapshot.hasError) {
                  return NoInternetConnection(
                    action: () async {
                      //await model.setSuperAdminUserRequests("SuperAdmin");
                      await model.setUserRequests("All");
                      await model.setEventRequests("All");
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