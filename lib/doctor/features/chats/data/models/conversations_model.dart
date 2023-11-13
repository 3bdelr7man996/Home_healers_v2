class ConversationsModel {
  List<OnlineUsers>? onlineUsers;
  List<OnlineAdvs>? onlineAdvs;
  List<Conversations>? conversations;

  ConversationsModel({this.onlineUsers, this.onlineAdvs, this.conversations});

  ConversationsModel.fromJson(Map<String, dynamic>? json) {
    if (json?['online_users'] != null) {
      onlineUsers = <OnlineUsers>[];
      json?['online_users'].forEach((v) {
        onlineUsers!.add(new OnlineUsers.fromJson(v));
      });
    }
    if (json?['online_advs'] != null) {
      onlineAdvs = <OnlineAdvs>[];
      json?['online_advs'].forEach((v) {
        onlineAdvs!.add(new OnlineAdvs.fromJson(v));
      });
    }
    if (json?['conversations'] != null) {
      conversations = <Conversations>[];
      json?['conversations'].forEach((v) {
        conversations!.add(new Conversations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.onlineAdvs != null) {
      data['online_advs'] = this.onlineAdvs!.map((v) => v.toJson()).toList();
    }
    if (this.conversations != null) {
      data['conversations'] =
          this.conversations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OnlineUsers {
  Patient? user;
  bool? online;

  OnlineUsers({this.user, this.online});

  OnlineUsers.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new Patient.fromJson(json['user']) : null;
    online = json['online'];
  }
}

class Patient {
  int? id;
  String? name;
  String? image;

  Patient({this.id, this.name, this.image});

  Patient.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    name = json?['name'];
    image = json?['image'];
  }
}

class OnlineAdvs {
  Advertiser? advertiser;
  bool? online;

  OnlineAdvs({this.advertiser, this.online});

  OnlineAdvs.fromJson(Map<String, dynamic>? json) {
    advertiser = json?['advertiser'] != null
        ? new Advertiser.fromJson(json?['advertiser'])
        : null;
    online = json?['online'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.advertiser != null) {
      data['advertiser'] = this.advertiser!.toJson();
    }
    data['online'] = this.online;
    return data;
  }
}

class Advertiser {
  int? id;
  String? firstnameAr;
  String? image;

  Advertiser({this.id, this.firstnameAr, this.image});

  Advertiser.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    firstnameAr = json?['firstname_ar'];
    image = json?['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname_ar'] = this.firstnameAr;
    data['image'] = this.image;
    return data;
  }
}

class Conversations {
  String? name;
  String? image;
  int? id;
  bool? online;
  String? lastMsg;

  Conversations({this.name, this.image, this.id, this.online, this.lastMsg});

  Conversations.fromJson(Map<String, dynamic>? json) {
    name = json?['name'];
    image = json?['image'];
    id = json?['id'];
    online = json?['online'];
    lastMsg = json?['last_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['id'] = this.id;
    data['online'] = this.online;
    data['last_msg'] = this.lastMsg;
    return data;
  }
}
