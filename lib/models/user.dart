import 'package:flutter_kirthan/exceptions/validation_exception.dart';

class User {
  int id;
  String userid;
  String username;
  String password;
  String usertype;

//Typically called form service layer to create a new user
  User({this.id, this.userid, this.username, this.password, this.usertype});
//Typically called from the data_source layer after getting data from an external source.
  User.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    userid = map['userid'];
    username = map['username'];
    password= map['password'];
    usertype= map['usertype'];
  }
//Typically called from service or data_source layer just before persisting data.
  //Here is the appropriate place to check data validity before persistence.
  Map<String, dynamic> toJson() {
    //validate
    _validation();
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userid'] = this.userid;
    data['username'] = this.username;
    data['password'] = this.password;
    data['usertype'] = this.usertype;
    return data;
  }
  _validation() {
    if (userid == null) {
      //NullNameException is defined in the exception folder of the domain
      throw NullNameException('Name cannot be Null');
    }
  }
}

class Userdetail {
  int id;
  String userid;
  String username;
  String password;
  String usertype;
  String firstname;
  String lastname;
  String email;
  int phonenumber;
  String addlineone;
  String addlinetwo;
  String addlinethree;
  String locality;
  String city;
  int pincode;
  String state;
  String country;
  String govtidtype;
  String govtid;
  int isprocessed;
  String createdby;
  String updatedby;
  String updatetime;
  String approvalstatus;
  String approvalcomments;


//Typically called form service layer to create a new user
  Userdetail({this.id, this.userid, this.username, this.password, this.usertype,
    this.firstname,
    this.lastname,
    this.email,
    this.phonenumber,
    this.addlineone,
    this.addlinetwo,
    this.addlinethree,
    this.locality,
    this.city,
    this.pincode,
    this.state,
    this.country,
    this.govtidtype,
    this.govtid,
    this.isprocessed,
    this.createdby,
    this.updatedby,
    this.updatetime,
    this.approvalstatus,
    this.approvalcomments
  });
//Typically called from the data_source layer after getting data from an external source.
  Userdetail.fromMap(Map<String, dynamic> map) {

    id = map['id'];
    userid = map['userid'];
    username = map['username'];
    password= map['password'];
    usertype= map['usertype'];
    firstname=map['firstname'];
    lastname=map['lastname'];
    email=map['email'];
    phonenumber=map['phonenumber'];
    addlineone=map['addlineone'];
    addlinetwo=map['addlinetwo'];
    addlinethree=map['addlinethree'];
    locality=map['locality'];
    city=map['city'];
    pincode=map['pincode'];
    state=map['state'];
    country=map['country'];
    govtidtype=map['govtidtype'];
    govtid=map['govtid'];
    isprocessed=map['isprocessed'];
    createdby=map['createdby'];
    updatedby=map['updatedby'];
    updatetime=map['updatetime'];
    approvalstatus=map['approvalstatus'];
    approvalcomments=map['approvalcomments'];

  }
//Typically called from service or data_source layer just before persisting data.
  //Here is the appropriate place to check data validity before persistence.
  Map<String, dynamic> toJson() {
    //validate
    _validation();
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userid'] = this.userid;
    data['username'] = this.username;
    data['password'] = this.password;
    data['usertype'] = this.usertype;
    data['firstname']=this.firstname;
    data['lastname']=this.lastname;
    data['email']=this.email;
    data['phonenumber']=this.phonenumber;
    data['addlineone']=this.addlineone;
    data['addlinetwo']=this.addlinetwo;
    data['addlinethree']=this.addlinethree;
    data['locality']=this.locality;
    data['city']=this.city;
    data['pincode']=this.pincode;
    data['state']=this.state;
    data['country']=this.country;
    data['govtidtype']=this.govtidtype;
    data['govtid']=this.govtid;
    data['isprocessed']=this.isprocessed;
    data['createdby']=this.createdby;
    data['updatedby']=this.updatedby;
    data['updatetime']=this.updatetime;
    data['approvalstatus']=this.approvalstatus;
    data['approvalcomments']=this.approvalcomments;

    return data;
  }
  _validation() {
    if (userid == null) {
      //NullNameException is defined in the exception folder of the domain
      throw NullNameException('Name cannot be Null');
    }
  }
}