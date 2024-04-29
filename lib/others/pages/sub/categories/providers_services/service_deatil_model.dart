class CarteServiceDetails {
  int? id;
  int? providerId;
  int? serviceId;
  int? amountPerHour;
  DateTime? createdAt;
  DateTime? updatedAt;
  ServiceDetail? service;
  Provider? provider;

  CarteServiceDetails({
    this.id,
    this.providerId,
    this.serviceId,
    this.amountPerHour,
    this.createdAt,
    this.updatedAt,
    this.service,
    this.provider,
  });

  factory CarteServiceDetails.fromJson(Map<String, dynamic> json) {
    return CarteServiceDetails(
      id: json['id'],
      providerId: json['provider_id'],
      serviceId: json['service_id'],
      amountPerHour: json['amount_per_hour'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      service: json['service'] != null ? ServiceDetail.fromJson(json['service']) : null,
      provider: json['provider'] != null ? Provider.fromJson(json['provider']) : null,
    );
  }
}

class ServiceDetail {
  int? id;
  String? name;
  int? serviceTypeId;
  String? description;
  String? img;
  DateTime? createdAt;
  DateTime? updatedAt;
  ServiceType? serviceType;

  ServiceDetail({
    this.id,
    this.name,
    this.serviceTypeId,
    this.description,
    this.img,
    this.createdAt,
    this.updatedAt,
    this.serviceType,
  });

  factory ServiceDetail.fromJson(Map<String, dynamic> json) {
    return ServiceDetail(
      id: json['id'],
      name: json['name'],
      serviceTypeId: json['service_type_id'],
      description: json['description'],
      img: json['img'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      serviceType: json['service_type'] != null ? ServiceType.fromJson(json['service_type']) : null,
    );
  }
}

class ServiceType {
  int? id;
  String? name;
  String? description;
  String? img;
  DateTime? createdAt;
  DateTime? updatedAt;

  ServiceType({
    this.id,
    this.name,
    this.description,
    this.img,
    this.createdAt,
    this.updatedAt,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) {
    return ServiceType(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      img: json['img'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}

class Provider {
  int? id;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  Provider({
    this.id,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      id: json['id'],
      userId: json['user_id'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? userName;
  String? role;
  String? img;
  String? mobile;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.userName,
    this.role,
    this.img,
    this.mobile,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      userName: json['user_name'],
      role: json['role'],
      img: json['img'],
      mobile: json['mobile'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}
