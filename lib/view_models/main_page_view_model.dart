import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_kirthan/interfaces/i_restapi_svcs.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_kirthan/models/user.dart';

class MainPageViewModel extends Model {
  Future<List<Userdetail>> _allusers;
  Future<List<Userdetail>> _superadminusers;

  Future<List<Userdetail>> get allusers => _allusers;
  Future<List<Userdetail>> get superadminusers => _superadminusers;

  set allusers(Future<List<Userdetail>> value) {
    _allusers = value;
    notifyListeners();
  }

  set superadminusers(Future<List<Userdetail>> value) {
    _superadminusers = value;
    notifyListeners();
  }


  final IKirthanRestApi apiSvc;

  MainPageViewModel({@required this.apiSvc});


  Future<bool> setAllUsers(String userType) async {
    allusers = apiSvc?.getUserDetails(userType);
    //userdetails = apiSvc?.getDummyUserDetails();
    return allusers != null;
  }

  Future<bool> setSuperAdminUsers(String userType) async {
    superadminusers = apiSvc?.getUserDetails(userType);
    //userdetails = apiSvc?.getDummyUserDetails();
    return superadminusers != null;
  }

}
