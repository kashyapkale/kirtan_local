import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_kirthan/interfaces/i_restapi_svcs.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/models/event.dart';

class MainPageViewModel extends Model {
  Future<List<UserRequest>> _userrequests;
  //Future<List<UserRequest>> _superadminusers;
  Future<List<EventRequest>> _eventrequests;

  Future<List<UserRequest>> get userrequests => _userrequests;
  //Future<List<UserRequest>> get superadminusers => _superadminusers;
  Future<List<EventRequest>> get eventrequests => _eventrequests;

  set userrequests(Future<List<UserRequest>> value) {
    _userrequests = value;
    notifyListeners();
  }

  /*set superadminusers(Future<List<UserRequest>> value) {
    _superadminusers = value;
    notifyListeners();
  }*/

  set eventrequests(Future<List<EventRequest>> value) {
    _eventrequests = value;
    notifyListeners();
  }


  final IKirthanRestApi apiSvc;

  MainPageViewModel({@required this.apiSvc});


  Future<bool> setUserRequests(String userType) async {
    userrequests = apiSvc?.getUserRequests(userType);
    //userdetails = apiSvc?.getDummyUserDetails();
    return userrequests != null;
  }

  /*
  Future<bool> setSuperAdminUserRequests(String userType) async {
    superadminusers = apiSvc?.getUserRequests(userType);
    return superadminusers != null;
  }
*/
  Future<bool> setEventRequests(String eventType) async {
    eventrequests = apiSvc?.getEventRequests(eventType);
    return eventrequests != null;
  }

}
