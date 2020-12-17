class Video {
  int currentPage;
  List<VideoData> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  var nextPageUrl;
  String path;
  int perPage;
  var prevPageUrl;
  int to;
  int total;

  Video(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Video.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = new List<VideoData>();
      json['data'].forEach((v) {
        data.add(new VideoData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class VideoData {
  int id;
  int userId;
  int levelId;
  int unitId;
  String slug;
  var path;
  String title;
  String status;
  String type;
  String availableAt;
  String description;
  String origin;
  String link;
  String createdAt;
  String updatedAt;
  int isMeetingRunning;
  String meetingEndedAt;
  String thumbnail;
  String sentNotificationAt;
  var videoAccessUrl;
  Level level;
  Unit1 unit;
  User user;

  VideoData(
      {this.id,
      this.userId,
      this.levelId,
      this.unitId,
      this.slug,
      this.path,
      this.title,
      this.status,
      this.type,
      this.availableAt,
      this.description,
      this.origin,
      this.link,
      this.createdAt,
      this.updatedAt,
      this.isMeetingRunning,
      this.meetingEndedAt,
      this.thumbnail,
      this.sentNotificationAt,
      this.videoAccessUrl,
      this.level,
      this.unit,
      this.user});

  VideoData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    levelId = json['level_id'];
    unitId = json['unit_id'];
    slug = json['slug'];
    path = json['path'];
    title = json['title'];
    status = json['status'];
    type = json['type'];
    availableAt = json['available_at'];
    description = json['description'];
    origin = json['origin'];
    link = json['link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isMeetingRunning = json['is_meeting_running'];
    meetingEndedAt = json['meeting_ended_at'];
    thumbnail = json['thumbnail'];
    sentNotificationAt = json['sent_notification_at'];
    videoAccessUrl = json['video_access_url'];
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
    unit = json['unit'] != null ? new Unit1.fromJson(json['unit']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['level_id'] = this.levelId;
    data['unit_id'] = this.unitId;
    data['slug'] = this.slug;
    data['path'] = this.path;
    data['title'] = this.title;
    data['status'] = this.status;
    data['type'] = this.type;
    data['available_at'] = this.availableAt;
    data['description'] = this.description;
    data['origin'] = this.origin;
    data['link'] = this.link;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_meeting_running'] = this.isMeetingRunning;
    data['meeting_ended_at'] = this.meetingEndedAt;
    data['thumbnail'] = this.thumbnail;
    data['sent_notification_at'] = this.sentNotificationAt;
    data['video_access_url'] = this.videoAccessUrl;
    if (this.level != null) {
      data['level'] = this.level.toJson();
    }
    if (this.unit != null) {
      data['unit'] = this.unit.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Level {
  int id;
  String name;
  String color;
  String nameEn;
  String description;
  String createdAt;
  String updatedAt;

  Level(
      {this.id,
      this.name,
      this.color,
      this.nameEn,
      this.description,
      this.createdAt,
      this.updatedAt});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    nameEn = json['name_en'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color'] = this.color;
    data['name_en'] = this.nameEn;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Unit1 {
  int id;
  int userId;
  int levelId;
  String title;
  String description;
  String createdAt;
  String updatedAt;
  int price;
  var itemDeletedAt;
  int term;

  Unit1(
      {this.id,
      this.userId,
      this.levelId,
      this.title,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.price,
      this.itemDeletedAt,
      this.term});

  Unit1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    levelId = json['level_id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    price = json['price'];
    itemDeletedAt = json['item_deleted_at'];
    term = json['term'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['level_id'] = this.levelId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['price'] = this.price;
    data['item_deleted_at'] = this.itemDeletedAt;
    data['term'] = this.term;
    return data;
  }
}
//<uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />

class User {
  int id;
  String name;
  String phone;
  String phoneVerifiedAt;
  String gender;
  var dateOfBirth;
  var location;
  var supervisor;
  var supervisorType;
  bool blockedAt;
  String createdAt;
  String updatedAt;
  int levelId;
  String power;
  String avatar;

  User(
      {this.id,
      this.name,
      this.phone,
      this.phoneVerifiedAt,
      this.gender,
      this.dateOfBirth,
      this.location,
      this.supervisor,
      this.supervisorType,
      this.blockedAt,
      this.createdAt,
      this.updatedAt,
      this.levelId,
      this.power,
      this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    phoneVerifiedAt = json['phone_verified_at'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    location = json['location'];
    supervisor = json['supervisor'];
    supervisorType = json['supervisor_type'];
    blockedAt = json['blocked_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    levelId = json['level_id'];
    power = json['power'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['location'] = this.location;
    data['supervisor'] = this.supervisor;
    data['supervisor_type'] = this.supervisorType;
    data['blocked_at'] = this.blockedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['level_id'] = this.levelId;
    data['power'] = this.power;
    data['avatar'] = this.avatar;
    return data;
  }
}
