import 'package:flutter/material.dart';

class EventWrite extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  int eventId;
  EventWrite({this.eventId});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center (
        child: Container(
          alignment: Alignment.center,
          height: 600,
          width: 400,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  maxLength: 20,
                  decoration:const InputDecoration(
                    hintText: "Event Title",
                    labelText: "Event Title*",
                  ),
                ),
                TextFormField(
                  decoration:const InputDecoration(
                    hintText: "Event Desciption",
                    labelText: "Event Description*",
                  ),
                ),
                TextFormField(
                  decoration:const InputDecoration(
                    hintText: "Event Date",
                    labelText: "Event Date*",
                  ),
                ),
                TextFormField(
                  decoration:const InputDecoration(
                    hintText: "Event Duration",
                    labelText: "Event Duration*",
                  ),
                ),
                TextFormField(
                  decoration:const InputDecoration(
                    hintText: "Event Location",
                    labelText: "Event Location*",
                  ),
                ),
                TextFormField(
                  decoration:const InputDecoration(
                    hintText: "Event Type",
                    labelText: "Event Type*",
                  ),
                ),
                TextFormField(
                  decoration:const InputDecoration(
                    hintText: "Phone Number",
                    labelText: "Phone Number*",
                  ),
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      child: const Text("Submit"),
                      onPressed: () {

                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}