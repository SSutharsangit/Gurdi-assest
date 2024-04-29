class User {
  final String id;
  final String name;
  final String email;
  final String username;
  final String role;
  final String mobile;


  User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.role,
    required this.mobile,

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      name: json['name'],
      email: json['email'],
      username: json['user_name'],
      role: json['role'],

      mobile: json['mobile'],
   
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'role': role,
      'mobile': mobile,
     
    };
  }
}
