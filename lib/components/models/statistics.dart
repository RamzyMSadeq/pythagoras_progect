// class Statistics {
//   int id;
//   String name;
//   String phone;
//   String phoneVerifiedAt;
//   String gender;
//   var dateOfBirth;
//   String location;
//   String supervisor;
//   var supervisorType;
//   bool blockedAt;
//   String createdAt;
//   String updatedAt;
//   int levelId;
//   String power;
//   String avatar;
//   int videosCount;
//   int unitsCount;
//   int ordersCount;
//   int paymentsCount;
//   int videosViewsCount;
//   List<Null> videos;
//   List<Null> units;
//   List<Orders> orders;
//   List<Payments> payments;
//   List<Null> videosViews;

//   Statistics(
//       {this.id,
//       this.name,
//       this.phone,
//       this.phoneVerifiedAt,
//       this.gender,
//       this.dateOfBirth,
//       this.location,
//       this.supervisor,
//       this.supervisorType,
//       this.blockedAt,
//       this.createdAt,
//       this.updatedAt,
//       this.levelId,
//       this.power,
//       this.avatar,
//       this.videosCount,
//       this.unitsCount,
//       this.ordersCount,
//       this.paymentsCount,
//       this.videosViewsCount,
//       this.videos,
//       this.units,
//       this.orders,
//       this.payments,
//       this.videosViews});

//   Statistics.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     phone = json['phone'];
//     phoneVerifiedAt = json['phone_verified_at'];
//     gender = json['gender'];
//     dateOfBirth = json['date_of_birth'];
//     location = json['location'];
//     supervisor = json['supervisor'];
//     supervisorType = json['supervisor_type'];
//     blockedAt = json['blocked_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     levelId = json['level_id'];
//     power = json['power'];
//     avatar = json['avatar'];
//     videosCount = json['videos_count'];
//     unitsCount = json['units_count'];
//     ordersCount = json['orders_count'];
//     paymentsCount = json['payments_count'];
//     videosViewsCount = json['videos_views_count'];
//     if (json['videos'] != null) {
//       videos = new List<Null>();
//       json['videos'].forEach((v) {
//         videos.add(new Null.fromJson(v));
//       });
//     }
//     if (json['units'] != null) {
//       units = new List<Null>();
//       json['units'].forEach((v) {
//         units.add(new Null.fromJson(v));
//       });
//     }
//     if (json['orders'] != null) {
//       orders = new List<Orders>();
//       json['orders'].forEach((v) {
//         orders.add(new Orders.fromJson(v));
//       });
//     }
//     if (json['payments'] != null) {
//       payments = new List<Payments>();
//       json['payments'].forEach((v) {
//         payments.add(new Payments.fromJson(v));
//       });
//     }
//     if (json['videos_views'] != null) {
//       videosViews = new List<Null>();
//       json['videos_views'].forEach((v) {
//         videosViews.add(new Null.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['phone'] = this.phone;
//     data['phone_verified_at'] = this.phoneVerifiedAt;
//     data['gender'] = this.gender;
//     data['date_of_birth'] = this.dateOfBirth;
//     data['location'] = this.location;
//     data['supervisor'] = this.supervisor;
//     data['supervisor_type'] = this.supervisorType;
//     data['blocked_at'] = this.blockedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['level_id'] = this.levelId;
//     data['power'] = this.power;
//     data['avatar'] = this.avatar;
//     data['videos_count'] = this.videosCount;
//     data['units_count'] = this.unitsCount;
//     data['orders_count'] = this.ordersCount;
//     data['payments_count'] = this.paymentsCount;
//     data['videos_views_count'] = this.videosViewsCount;
//     if (this.videos != null) {
//       data['videos'] = this.videos.map((v) => v.toJson()).toList();
//     }
//     if (this.units != null) {
//       data['units'] = this.units.map((v) => v.toJson()).toList();
//     }
//     if (this.orders != null) {
//       data['orders'] = this.orders.map((v) => v.toJson()).toList();
//     }
//     if (this.payments != null) {
//       data['payments'] = this.payments.map((v) => v.toJson()).toList();
//     }
//     if (this.videosViews != null) {
//       data['videos_views'] = this.videosViews.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Orders {
//   int id;
//   int userId;
//   int unitId;
//   String createdAt;
//   String updatedAt;
//   String status;

//   Orders(
//       {this.id,
//       this.userId,
//       this.unitId,
//       this.createdAt,
//       this.updatedAt,
//       this.status});

//   Orders.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     unitId = json['unit_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['unit_id'] = this.unitId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['status'] = this.status;
//     return data;
//   }
// }

// class Payments {
//   int id;
//   int userId;
//   int orderId;
//   String type;
//   String status;
//   double amount;
//   String paymentId;
//   String processData;
//   Null description;
//   String createdAt;
//   String updatedAt;
//   String source;

//   Payments(
//       {this.id,
//       this.userId,
//       this.orderId,
//       this.type,
//       this.status,
//       this.amount,
//       this.paymentId,
//       this.processData,
//       this.description,
//       this.createdAt,
//       this.updatedAt,
//       this.source});

//   Payments.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     orderId = json['order_id'];
//     type = json['type'];
//     status = json['status'];
//     amount = json['amount'];
//     paymentId = json['payment_id'];
//     processData = json['process_data'];
//     description = json['description'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     source = json['source'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['order_id'] = this.orderId;
//     data['type'] = this.type;
//     data['status'] = this.status;
//     data['amount'] = this.amount;
//     data['payment_id'] = this.paymentId;
//     data['process_data'] = this.processData;
//     data['description'] = this.description;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['source'] = this.source;
//     return data;
//   }
// }
