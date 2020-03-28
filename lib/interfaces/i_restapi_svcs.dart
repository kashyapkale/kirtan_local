import 'dart:async';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/models/event.dart';

abstract class IKirthanRestApi {
  //Sample
  Future<List<UserRequest>> getUserRequestsFromJson();

  //user
  Future<List<UserRequest>> getUserRequests(String userType);
  Future<List<UserRequest>> getDummyUserRequests();

  //event
  Future<List<EventRequest>> getEventRequests(String userType);
  Future<EventRequest> submitNewEventREquest(EventRequest pEventrequest);
  Future<List<EventRequest>> getDummyEventRequests();
}