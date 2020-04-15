import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_kirthan/common/constants.dart';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/models/event.dart';
import 'package:flutter_kirthan/interfaces/i_restapi_svcs.dart';

class RestAPIServices implements IKirthanRestApi {
  //final _baseUrl = 'http://10.0.2.2:8080';
  final _baseUrl = 'http://192.168.1.8:8080';
  http.Client _client = http.Client();

  set client(http.Client value) => _client = value;

  static final RestAPIServices _internal = RestAPIServices.internal();
  factory RestAPIServices() => _internal;
  RestAPIServices.internal();

  Future<List<UserRequest>> getUserRequests(String userType) async {
    String requestBody = '{"locality":"Warje"}';

    if (userType == "SA" ) {
      requestBody = '{"userType":"SuperAdmin"}';
    }
    else if (userType == "A" ) {
      requestBody = '{"userType":"Admin"}';
    }
    else if (userType == "U" ) {
      requestBody = '{"userType":""}';
    }

    print(requestBody);

    var response = await _client.put('$_baseUrl/getuserrequests', headers: {"Content-Type": "application/json"}, body: requestBody);

    if (response.statusCode == 200) {
      //print(response.body);
      List<dynamic> userrequestsData = json.decode(response.body);
      //print(userdetailsData);
      List<UserRequest> userrequests = userrequestsData.map((userrequestsData) => UserRequest.fromMap(userrequestsData)).toList();

      //print(userdetails);

      return userrequests;

    } else {
      throw Exception('Failed to get data');
    }
  }

  Future<UserRequest> submitNewUserRequest(Map<String,dynamic> userrequestmap) async {
    print(userrequestmap);
    String requestBody = json.encode(userrequestmap);
    print(requestBody);


    var response = await _client.put('$_baseUrl/submitnewuserrequest', headers: {"Content-Type": "application/json"}, body: requestBody);

    if (response.statusCode == 200) {
      print(response.body);
      UserRequest respuserrequest = json.decode(response.body);
      print(respuserrequest);
      //print(userdetailsData);
      //List<UserRequest> userrequests = userrequestsData.map((userrequestsData) => UserRequest.fromMap(userrequestsData)).toList();

      //print(userdetails);

      return respuserrequest;

    } else {
      throw Exception('Failed to get data');
    }
  }
  Future<bool> processUserRequest(Map<String,dynamic> processrequestmap) async {
    print(processrequestmap);
    String requestBody = json.encode(processrequestmap);
    print(requestBody);

    var response = await _client.put('$_baseUrl/processuserrequest', headers: {"Content-Type": "application/json"}, body: requestBody);

    if (response.statusCode == 200) {
      print(response.body);

      return true;

    } else {
      throw Exception('Failed to get data');
    }
  }

  Future<List<UserRequest>> getDummyUserRequests() async {

    var response = await _client.get('$_baseUrl/getdummyuserrequest', headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      //print(response.body);
      List<dynamic> userdetailsData = json.decode(response.body);
      //print(userdetailsData);
      List<UserRequest> userdetails = userdetailsData.map((userdetailsData) => UserRequest.fromMap(userdetailsData)).toList();

      return userdetails;

    } else {
      throw Exception('Failed to get data');
    }
  }

  Future<List<UserRequest>> getUserRequestsFromJson() async {
    var userDetailsJson = await rootBundle.loadString(userdetailsJsonPath);
    List<dynamic> userdetailsData = json.decode(userDetailsJson) as List;
    List<UserRequest> userdetails = userdetailsData.map((userdetailsData) => UserRequest.fromMap(userdetailsData)).toList();

    return userdetails;
  }

  Future<List<EventRequest>> getEventRequests(String eventType) async {
    print("I am in Service: getEventRequests");

    String requestBody = '';

    if(eventType == "1") {
      requestBody = '{"eventId":"1"}';
    }
    else {
      requestBody = '{"city":"Pune"}';
    }

    print(requestBody);

    var response = await _client.put('$_baseUrl/geteventrequests', headers: {"Content-Type": "application/json"}, body: requestBody);

    if (response.statusCode == 200) {
      //print(response.body);
      List<dynamic> eventrequestsData = json.decode(response.body);
      //print(userdetailsData);
      List<EventRequest> eventrequests = eventrequestsData.map((eventrequestsData) => EventRequest.fromMap(eventrequestsData)).toList();

      //print(userdetails);

      return eventrequests;

    } else {
      throw Exception('Failed to get data');
    }
  }

  Future<EventRequest> submitNewEventREquest(EventRequest pEventrequest) async {
    String requestBody = '';
    print(requestBody);
    var response = await _client.put('$_baseUrl/submitneweventrequest', headers: {"Content-Type": "application/json"}, body: requestBody);
    if (response.statusCode == 200) {
      EventRequest eventrequestsData = json.decode(response.body);
      print(eventrequestsData);
    }
  }

  Future<List<EventRequest>> getDummyEventRequests() async {

    List<EventRequest> eventrequests;
    return eventrequests;
  }


}