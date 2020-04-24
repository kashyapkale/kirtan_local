class EventUser {
  final int id;
  int eventId;
  int teamId;
  int userId;
  String createdBy;
  String createTime;
  String updatedBy;
  String updateTime;

//Typically called form service layer to create a new user
  EventUser(
      {this.id,
        this.eventId,
      this.teamId,
      this.userId,
      this.createdBy,
      this.updatedBy,
      this.createTime,
      this.updateTime});

//Typically called from the data_source layer after getting data from an external source.
  factory EventUser.fromJson(Map<String, dynamic> data) {
    return EventUser(
      id: data['id'],
      eventId: data['eventId'],
      teamId: data['teamId'],
      userId: data['userId'],
      createdBy: data['createdBy'],
      updatedBy: data['updatedBy'],
      updateTime: data['updateTime'],
      createTime: data['createTime'],
    );
  }

  factory EventUser.fromMap(Map<String, dynamic> map) {
    return EventUser(
      id: map['id'],
      eventId: map['eventId'],
      teamId: map['teamId'],
      userId: map['userId'],
      createdBy: map['createdBy'],
      updatedBy: map['updatedBy'],
      updateTime: map['updateTime'],
      createTime: map['createTime'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['eventId'] = this.eventId;
    data['teamId'] = this.teamId;
    data['userId'] = this.userId;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['updateTime'] = this.updateTime;
    data['createTime'] = this.createTime;
    return data;
  }

  Map toStrJson() {
    return {
      "id": this.id,
      "eventId": this.eventId,
      "userId": this.userId,
      "teamId": this.teamId,
      "createdBy": this.createdBy,
      "updatedBy": this.updatedBy,
      "updateTime": this.updateTime,
      "createTime": this.createTime,
    };
  }
}
