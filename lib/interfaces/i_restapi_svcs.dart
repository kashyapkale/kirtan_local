import 'dart:async';
import 'package:flutter_kirthan/models/user.dart';

abstract class IKirthanRestApi {
  Future<List<Userdetail>> getUserDetails();
}