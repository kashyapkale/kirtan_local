import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_kirthan/interfaces/i_restapi_svcs.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_kirthan/models/user.dart';

class MainPageViewModel extends Model {
  Future<List<Userdetail>> _userdetails;

  Future<List<Userdetail>> get userdetails => _userdetails;

  set userdetails(Future<List<Userdetail>> value) {
    _userdetails = value;
    notifyListeners();
  }

  final IKirthanRestApi apiSvc;

  MainPageViewModel({@required this.apiSvc});


  Future<bool> setUserdetails() async {
    userdetails = apiSvc?.getUserDetails();
    return userdetails != null;
  }

}
