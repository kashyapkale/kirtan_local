import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kirthan/models/event.dart';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/utils/kirthan_styles.dart';
import 'package:flutter_kirthan/interfaces/i_restapi_svcs.dart';
import 'package:flutter_kirthan/services/data_services.dart';
import 'package:flutter_kirthan/views/widgets/event/view_event.dart';
import 'package:flutter_kirthan/common/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_kirthan/views/widgets/settings/pref_settings.dart';



class EventRequestsListItem extends StatelessWidget {
  final EventRequest eventrequest;
  final UserRequest userrequests;
  final IKirthanRestApi apiSvc = new RestAPIServices();

  EventRequestsListItem({@required this.eventrequest,@required this.userrequests});

  @override
  Widget build(BuildContext context) {
    var title = Text(
      eventrequest?.eventTitle,
      style: GoogleFonts.openSans(
        //   color: KirthanStyles.titleColor,
        fontWeight: FontWeight.bold,
        fontSize: MyPrefSettingsApp.custFontSize,
        //fontSize: KirthanStyles.titleFontSize,
      ),
    );


    var subTitle = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        /* Icon(
          Icons.movie,
          //    color: KirthanStyles.subTitleColor,
          size: KirthanStyles.subTitleFontSize,
        ),*/
        Container(
          margin: const EdgeInsets.only(left: 4.0),
          child: Text(
            eventrequest?.eventDescription,
            style: GoogleFonts.openSans(
              fontSize: MyPrefSettingsApp.custFontSize,
              //    color: KirthanStyles.subTitleColor,
            ),
          ),
        ),



        Container(
          child:
          PopupMenuButton(
            itemBuilder: (context) =>
            [
              PopupMenuItem(
                value: 1,
                child: Text("Process",
                    style: TextStyle(
                      fontSize: MyPrefSettingsApp.custFontSize,
                    )),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("Edit",
                    style: TextStyle(
                      fontSize: MyPrefSettingsApp.custFontSize,
                    )),
              ),
              PopupMenuItem(
                value: 3,
                child: Text("Delete",
                    style: TextStyle(
                      fontSize: MyPrefSettingsApp.custFontSize,
                    )),
              ),
            ],
            onSelected: (int menu) {
              if (menu == 2) {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    EditProfileView(eventrequest: eventrequest)),);
              }
              else if (menu == 1) {
                Map<String,dynamic> processrequestmap = new Map<String,dynamic>();
                processrequestmap["id"] = eventrequest?.id;
                processrequestmap["approvalstatus"] = "Approved";
                processrequestmap["approvalcomments"] = "ApprovalComments";
                processrequestmap["eventtype"] = eventrequest?.eventType;
                apiSvc?.processEventRequest(processrequestmap);
              }
              else if(menu == 3) {
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
                                      hintText: 'Do you want to delete?'),
                                ),
                                SizedBox(
                                  width: 320.0,
                                  child: RaisedButton(
                                    onPressed: () {
                                      Map<String,dynamic> processrequestmap = new Map<String,dynamic>();
                                      processrequestmap["id"] = eventrequest?.id;
                                      apiSvc?.deleteEventRequest(processrequestmap);
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
            },
          ),
        ),
      ],
    );

    return Card(
      elevation:10,
      child: Container(
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
            gradient: new LinearGradient(colors: [Colors.blue[200], Colors.purpleAccent],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                tileMode: TileMode.clamp)),
          child: new  Column(
            children: <Widget>[

        new ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          leading: Icon(Icons.event),
          title: title,
          subtitle: subTitle,
         ),


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> [
            Text("Date:",
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: MyPrefSettingsApp.custFontSize,
            )
            ),
            Text("Duration:",
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: MyPrefSettingsApp.custFontSize,
                )
            ),
          ],
        ),

       // Divider(color: Colors.lightBlue),

         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> [
            //Text("Date:"),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                eventrequest?.eventDate,
                style: TextStyle(
                  fontSize: MyPrefSettingsApp.custFontSize,
                  //    color: KirthanStyles.subTitleColor,
                ),
              ),
            ),
            //Text("Duration:"),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                eventrequest?.eventDuration,
                style: TextStyle(
                  fontSize: MyPrefSettingsApp.custFontSize,
                  //    color: KirthanStyles.subTitleColor,
                ),
              ),
            ),
            ],
        ),
        //Divider(color: Colors.blue),
      ],
    ),
      ),
    );
  }



}