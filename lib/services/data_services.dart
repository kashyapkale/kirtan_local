import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_kirthan/common/constants.dart';
import 'package:flutter_kirthan/models/user.dart';
import 'package:flutter_kirthan/interfaces/i_restapi_svcs.dart';

class RestAPIServices implements IKirthanRestApi {

  Future<List<Userdetail>> getUserDetails() async {
    var userDetailsJson = await rootBundle.loadString(userdetailsJsonPath);
    List<dynamic> userdetailsData = json.decode(userDetailsJson) as List;
    List<Userdetail> userdetails = userdetailsData.map((userdetailsData) => Userdetail.fromMap(userdetailsData)).toList();

    return userdetails;
  }
}