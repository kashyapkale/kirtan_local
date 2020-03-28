
class EventRequest {
  final int eventId;
  String eventTitle;
  String eventDescription;
  String eventDate;
  String eventDuration;
  String eventLocation;
  String eventType;
  int phoneNumber;
  String addLineOne;
  String addLineTwo;
  String addLineThree;
  String locality;
  String city;
  int pinCode;
  String state;
  String country;
  bool isProcessed;
  String createdBy;
  String createTime;
  String updatedBy;
  String updateTime;
  String approvalStatus;
  String approvalComments;


//Typically called form service layer to create a new user
  EventRequest(
      {this.eventId, this.eventTitle, this.eventDescription, this.eventDate, this.eventDuration,
        this.eventLocation,
        this.eventType,
        this.phoneNumber,
        this.addLineOne,
        this.addLineTwo,
        this.addLineThree,
        this.locality,
        this.city,
        this.pinCode,
        this.state,
        this.country,
        this.isProcessed,
        this.createdBy,
        this.updatedBy,
        this.updateTime,
        this.approvalStatus,
        this.approvalComments });

//Typically called from the data_source layer after getting data from an external source.
  factory EventRequest.fromJson(Map<String, dynamic> data) {
    return EventRequest(
      eventId: data['eventId'],
      eventTitle: data['eventTitle'],
      eventDescription: data['eventDescription'],
      eventDate: data['eventDate'],
      eventDuration: data['eventDuration'],
      eventLocation: data['eventLocation'],
      eventType: data['eventType'],
      phoneNumber: data['phoneNumber'],
      addLineOne: data['addLineOne'],
      addLineTwo: data['addLineTwo'],
      addLineThree: data['addLineThree'],
      locality: data['locality'],
      city: data['city'],
      pinCode: data['pinCode'],
      state: data['state'],
      country: data['country'],
      isProcessed: data['isProcessed'],
      createdBy: data['createdBy'],
      updatedBy: data['updatedBy'],
      updateTime: data['updateTime'],
      approvalStatus: data['approvalStatus'],
      approvalComments: data['approvalComments'],
    );
  }

  factory EventRequest.fromMap(Map<String, dynamic> map) {
    return EventRequest(
      eventId: map['eventId'],
      eventTitle: map['eventTitle'],
      eventDescription: map['eventDescription'],
      eventDate: map['eventDate'],
      eventDuration: map['eventDuration'],
      eventLocation: map['eventLocation'],
      phoneNumber: map['phoneNumber'],
      addLineOne: map['addLineOne'],
      addLineTwo: map['addLineTwo'],
      addLineThree: map['addLineThree'],
      locality: map['locality'],
      city: map['city'],
      pinCode: map['pinCode'],
      state: map['state'],
      country: map['country'],
      isProcessed: map['isProcessed'],
      createdBy: map['createdBy'],
      updatedBy: map['updatedBy'],
      updateTime: map['updateTime'],
      approvalStatus: map['approvalStatus'],
      approvalComments: map['approvalComments'],
    );
  }
}